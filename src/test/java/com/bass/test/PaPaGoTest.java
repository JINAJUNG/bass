//package com.bass.test;
//
//import static org.junit.Assert.fail;
//
//import java.io.BufferedReader;
//import java.io.DataOutputStream;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.MalformedURLException;
//import java.net.URL;
//import java.util.Map;
//
//import javax.net.ssl.HttpsURLConnection;
//
//import org.junit.Test;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//public class PaPaGoTest {
//	private String clientId = "Tg4BzFj3trmrpSh7rvCp";
//	private String clientSecret = "G1_6CIl2oX";
//	@Test
//	public void test() {
//		HttpsURLConnection huc = null;
//		BufferedReader br = null;
//		String text = "바람";
//		try {
//			URL url = new URL("https://openapi.naver.com/v1/papago/n2mt");
//			huc = (HttpsURLConnection) url.openConnection();
//			huc.setRequestMethod("POST");
//			huc.setRequestProperty("X-Naver-Client-Id", "Tg4BzFj3trmrpSh7rvCp");
//			huc.setRequestProperty("X-Naver-Client-Secret",  "G1_6CIl2oX");
//			String param = "source=ko&target=en&text=" + text;
//			
//			huc.setDoOutput(true);
//			DataOutputStream dos = new DataOutputStream(huc.getOutputStream());
//			dos.writeBytes(param);
//			dos.flush();
//			dos.close();
//			
//			int status = huc.getResponseCode();
//			
//				br = new BufferedReader(new InputStreamReader(huc.getInputStream()));
//				String result;
//				StringBuffer sb = new StringBuffer();
//				while((result=br.readLine())!=null) {
//					sb.append(result);
//				}
//				br.close();
//		
//
//			if(status==200) {
//			System.out.println(sb.toString());
///*				throw new IOException(sb.toString()); */
//				
//			}
//			ObjectMapper om = new ObjectMapper();
//			Map<String,Map<String,Map>> map = om.readValue(sb.toString(), Map.class);
//			System.out.println(map);
//			System.out.println(text + "번역=>" + map.get("message").get("result").get("translatedText"));
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		fail("Not yet implemented");
//	}
//
//}
