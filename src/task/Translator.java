package task;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Translator {
	private String papaApiURL;
	private String passportKey;
	private Map<String, String> headers;
	private Map<String, String> params;
	private Gson gson = new Gson();

	public Translator() {
		headers = new HashMap<>();
        headers.put("origin", "http://terms.tta.or.kr");
		headers.put("upgrade-insecure-requests", "1");
		headers.put("content-type", "application/x-www-form-urlencoded");
		headers.put("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36");
		headers.put("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
		headers.put("referer", "http://terms.tta.or.kr/wordDiscoverList.do");
		headers.put("accept-encoding", "gzip, deflate");
		headers.put("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
	}

	private String ttaPageParse(int num) {
		params = new HashMap<>();
		params.put("listCount", "30");
		params.put("listPage", String.valueOf(num));
		params.put("searchTerm", "");
		params.put("word_seq", "");
		try {
			Document response = Jsoup.connect(papaApiURL)
					.timeout(3000)
					.headers(headers)
					.data(params)
					.ignoreContentType(true)
					.post();
			return getText(response.body().text());
		} catch (IOException e) {
			System.out.println("Error: Translate Failed");
			return "";
		}
	}

	private String getText(String doc) {
		try {
			JsonObject obj1 = new JsonParser().parse(doc).getAsJsonObject();
			JsonObject obj2 = obj1.get("message").getAsJsonObject();
			JsonObject obj3 = obj2.get("result").getAsJsonObject();
			return obj3.get("translatedText").getAsString();
		} catch (Exception e) {
			System.out.println("Error: Get Translate Error (" + e.getMessage() + ")");
			return "";
		}
	}

	public static <K, V> HashMap<K, V> castHash(HashMap input, Class<K> keyClass, Class<V> valueClass) {
		HashMap<K, V> output = new HashMap<>();
		if (input == null)
			return output;
		for (Object key: input.keySet().toArray()) {
			if ((key == null) || (keyClass.isAssignableFrom(key.getClass()))) {
				Object value = input.get(key);
				if ((value == null) || (valueClass.isAssignableFrom(value.getClass()))) {
					K k = keyClass.cast(key);
					V v = valueClass.cast(value);
					output.put(k, v);
				} else {
					throw new AssertionError(
							"Cannot cast to HashMap<"+ keyClass.getSimpleName()
									+", "+ valueClass.getSimpleName() +">"
									+", value "+ value +" is not a "+ valueClass.getSimpleName()
					);
				}
			} else {
				throw new AssertionError(
						"Cannot cast to HashMap<"+ keyClass.getSimpleName()
								+", "+ valueClass.getSimpleName() +">"
								+", key "+ key +" is not a " + keyClass.getSimpleName()
				);
			}
		}
		return output;
	}
}