package task;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.*;

public class Task {
	private static Random rand = new Random();
	private static Map<String, String> headers;
	private static Map<String, String> params;

	public static void main(String[] args) {
		setHeaders();
		ttaGetList();
	}

	public static void setHeaders() {
		headers = new HashMap<>();
		headers.put("origin", "http://terms.tta.or.kr");
		headers.put("upgrade-insecure-requests", "1");
		headers.put("content-type", "application/x-www-form-urlencoded");
		headers.put("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) " +
				"Chrome/69.0.3497.100 Safari/537.36");
		headers.put("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
		headers.put("referer", "http://terms.tta.or.kr/wordDiscoverList.do");
		headers.put("accept-encoding", "gzip, deflate");
		headers.put("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");

		params = new HashMap<>();
		params.put("listCount", "30");
		params.put("listPage", String.valueOf(rand.nextInt(8) + 1));
		params.put("searchTerm", "");
		params.put("word_seq", "");
	}

	private static String getSeq(String word) {
		String checkUrl = "http://terms.tta.or.kr/dictionary/CheckwordDiscover.do?subject=";
		try {
			String response = Jsoup.connect(checkUrl + word)
					.ignoreContentType(true)
					.get()
					.body()
					.text();
			System.out.println(response);
			JsonObject obj1 = new JsonParser().parse(response).getAsJsonObject();
			return obj1.get("word_seq").getAsString();
		} catch (Exception e) {
			System.out.println("Error: getSeq Error (" + e.getMessage() + ")");
			return "";
		}
	}

	private static String getAss(String seq) {
		String chartUrl = "http://terms.tta.or.kr/dictionary/dictionaryChart.do?word_seq=";
		try {
			String response = Jsoup.connect(chartUrl + seq)
					.ignoreContentType(true)
					.get()
					.body()
					.text();
			JsonObject obj1 = new JsonParser().parse(response).getAsJsonObject();
			System.out.println("obj1: " + obj1);
			JsonObject obj2 = obj1.get("result").getAsJsonObject();
			System.out.println("obj2: " + obj2);
			JsonObject obj3 = obj2.get("children").getAsJsonObject();
			System.out.println("obj3: " + obj3);
			return obj1.get("word_seq").getAsString();
		} catch (Exception e) {
			System.out.println("Error: getAss Error (" + e.getMessage() + ")");
			return "";
		}
	}

	public static void ttaGetList() {
		String mainUrl = "http://terms.tta.or.kr";
		String pageUrl = mainUrl + "/wordDiscoverList.do?listPage=";

		String checkUrl = mainUrl + "/dictionary/CheckwordDiscover.do?subject=";
		String chartUrl = mainUrl + "/dictionary/dictionaryChart.do?word_seq=";

		String itemUrl1 = mainUrl + "/dictionary/dictionaryView.do?subject=";
		String itemUrl2 = mainUrl + "/dictionary/dictionaryView.do?word_seq=";

		try {
			int num = rand.nextInt(8) + 1;
			Document pageDoc = Jsoup.connect(pageUrl + num).get();
			System.out.println("PageUrl: " + pageUrl + num);
			List<String> list = new ArrayList<>();
			pageDoc.select(".align_l a")
					.forEach(a ->
							list.add(a.text()));

			String title = list.get(0);
			String wordSeq = getSeq(title);
			Document itemDoc = Jsoup.connect(itemUrl2 + wordSeq).get();
			String desc = itemDoc.select("#cont dd").text();
			String ass = getAss(wordSeq);
			System.out.println("title: " + title);
			System.out.println("wordSeq: " + wordSeq);
			System.out.println("desc: " + desc);
			System.out.println("ass: " + ass);

			Document response = Jsoup.connect(itemUrl1 + list.get(0))
					.timeout(3000)
					.data("listPage", String.valueOf(rand.nextInt(8) + 1))
					.ignoreContentType(true)
					.post();

		} catch (IOException e) {
			System.out.println("Error: Translate Failed");
		}
	}

	public static void termsSearch() {
		Random rand = new Random();
		String mainUrl = "https://terms.naver.com";
		// 블로터
		String subUrl1 = "/list.nhn?cid=59088&categoryId=59096&so=date.asc&viewType=&categoryType=&page=";
		// 한국 정보 통신
		String subUrl2 = "/list.nhn?cid=42346&categoryId=42346&so=date.dsc&viewType=&categoryType=&page=";

		// 한국 정보 통신(목록)
		String dddd = "http://terms.tta.or.kr/wordDiscoverList.do";
		// 한국 정보 통신(내용)
		String ttaUrl = "http://terms.tta.or.kr/dictionary/dictionaryView.do?subject=";

		int count = 1;
		for (int i = 0; i < 1; i++) {
			int num = rand.nextInt(1000) + 1;
			String pageUrl = mainUrl + subUrl2 + num;
			System.out.println("pageUrl: " + pageUrl);
			System.out.println();

			try {
				String[] items1 = Jsoup.connect(pageUrl).get()
						.select(".info_area .title a")
						.text()
						.replace("담기", "")
						.split("] ");

				for (String s : items1) {
					System.out.println(s);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

			try {
				Document mainDoc = Jsoup.connect(pageUrl).get();
				Elements items = mainDoc.select(".info_area .title a");
				for (Element item : items) {
					String itemUrl = item.attr("href");
					if (itemUrl.startsWith("#")) continue;
					System.out.println("termsSearch Run: " + count++);
					System.out.println("naver: " + mainUrl + itemUrl);

					Document subDoc = Jsoup.connect(mainUrl + itemUrl).get();
					String title = subDoc.select(".headword_title .headword").text().split("\\(")[0];
					String desc = subDoc.select(".headword_title .desc").text();

					System.out.println("tta: " + ttaUrl + title);
					Document ttaDoc = Jsoup.connect(ttaUrl + title).get();
					String description = ttaDoc.select("dd .no_css").text();
					String associated = ttaDoc.select("dd .no_css a").text();

					System.out.println("title: " + title);
					System.out.println("desc: " + desc);

					System.out.println("ttaDescription: " + description);
					System.out.println("associated: " + associated);
					System.out.println();
				}
			} catch (IOException e) {
				System.out.println("Error: termsSearch Exception");
				e.printStackTrace();
			}
		}
	}
}
