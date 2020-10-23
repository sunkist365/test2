package util;

import java.net.URLEncoder;

public class HanConv { // 사용자가 값을 입력하는게 아닌 페이지에서 페이지로 값을 전달할때 (request는 사용자로부터 요청을 받을때 사용하기 때문)
	public static String toKor(String str) { // 인자로 한글을 받을때
		if(str == null || str.equals("") || str.equals("null"))
			return str;
		
		try {
			return new String(str.getBytes("8859_1"), "euc-kr"); // 8859_1 > utf-8(영문), euc-kr > utf-16
		}catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}

	public static String toKor2(String str) { // 인자로 한글을 넘겨줄때

		if(str == null || str.equals("") || str.equals("null"))
			return str;
		
		try {
			return URLEncoder.encode(str, "euc-kr");
		}catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}
}