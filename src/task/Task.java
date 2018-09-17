package task;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

public class Task {

	public static void main(String[] args) {
		termsSearch();
	}


	public static void termsSearch() {
		Random rand = new Random();
		String mainUrl = "https://terms.naver.com";
		// 블로터
		String subUrl1 = "/list.nhn?cid=59088&categoryId=59096&so=date.asc&viewType=&categoryType=&page=";
		// 한국정보통신
		String subUrl2 = "/list.nhn?cid=42346&categoryId=42346&so=date.dsc&viewType=&categoryType=&page=";
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
