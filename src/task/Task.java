package task;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import javafx.util.Pair;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;
import java.util.stream.Collectors;

public class Task {

	private static class LazyHolder {
		static final Task INSTANCE = new Task();
	}

	public static Task getInstance() {
		return Task.LazyHolder.INSTANCE;
	}

	private static Document getDocument(String url) {
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			System.out.println("Error: getAss Failed (" + e.getMessage() + ")");
		}
		return doc;
	}

	public List<TaskDto> createTasks() {
		Random rand = new Random();
		String mainUrl = "http://terms.tta.or.kr";
		String pageUrl = mainUrl + "/wordDiscoverList.do?listPage=";

		int num = rand.nextInt(8) + 1;
		Document pageDoc = getDocument(pageUrl + num);
		if (pageDoc == null) {
			System.out.println("Error: getDocument(pageDoc) == null");
			return new ArrayList<>();
		}
		System.out.println("PageUrl: " + pageUrl + num);

		return getTaskList(pageDoc, 1);
	}

	private List<TaskDto> getTaskList(Document doc, int num) {
		List<String> titles = new ArrayList<>();
		Elements itemUrls = doc.select(".align_l a");
		for (Element itemUrl : itemUrls) {
			titles.add(itemUrl.text());
		}
		Collections.shuffle(titles);

		return titles.stream()
				.map(Task::getSeq)
				.filter(seq -> !seq.equals(""))
				.map(Task::getInfo)
				.filter(Objects::nonNull)
				.filter(task -> task.getAssociated().size() > 2)
				.limit(num)
				.collect(Collectors.toList());
	}

	private static String getSeq(String word) {
		try {
			String checkUrl = "http://terms.tta.or.kr/dictionary/CheckwordDiscover.do?subject="
					+ URLEncoder.encode(word, "UTF-8");
			System.out.println("CheckUrl: " + checkUrl);
			String response = Jsoup.connect(checkUrl)
					.ignoreContentType(true)
					.get()
					.body()
					.text();
			JsonObject obj1 = new JsonParser().parse(response).getAsJsonObject();
			return obj1.get("word_seq").getAsString();
		} catch (Exception e) {
			System.out.println("Error: getSeq Error (" + e.getMessage() + ")");
			return "";
		}
	}

	private static TaskDto getInfo(String seq) {
		String itemUrl = "http://terms.tta.or.kr/dictionary/dictionaryView.do?word_seq=" + seq;
		System.out.println("viewUrl: " + itemUrl);
		Document itemDoc = getDocument(itemUrl);
		if (itemDoc == null) return null;
		String description = itemDoc.select("#cont dd").text();
		Pair<String, List<String>> associated = getAss(seq);
		if (associated == null) return null;
		return new TaskDto(associated.getKey(), seq, description, associated.getValue());
	}

	private static Pair<String, List<String>> getAss(String seq) {
		List<String> associated = new ArrayList<>();
		String chartUrl = "http://terms.tta.or.kr/dictionary/dictionaryChart.do?word_seq=" + seq;
		System.out.println("ChartUrl: " + chartUrl);

		try {
			String response = Jsoup.connect(chartUrl)
					.ignoreContentType(true)
					.get()
					.body()
					.text();

			JsonObject obj1 = new JsonParser().parse(response).getAsJsonObject();
			JsonObject obj2 = obj1.get("result").getAsJsonObject();
			JsonArray arr1 = obj2.getAsJsonArray("children");

			int total = 0, pass = 0;
			for (JsonElement element : arr1) {
				JsonObject obj = element.getAsJsonObject();
				String name = obj.get("name").getAsString();
				total++;
				if (name.contains("동의어") || name.contains("하위어")) continue;
				if (!obj.get("wordseq").isJsonNull()) {
					pass++;
					associated.add(obj.get("name").getAsString());
				}
			}
			System.out.println("검색어: " + obj2.get("name").getAsString());
			System.out.println("전체| " + total + " / " + pass + " |통과");
			System.out.println(associated);
			return new Pair<>(obj2.get("name").getAsString(), associated);
		} catch (Exception e) {
			System.out.println("Error: getAss Error (" + e.getMessage() + ")");
			return null;
		}
	}

}
