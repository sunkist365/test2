package myUtil;

public class HanConv {
	public static String toKor(String str) {
		if(str==null || str.equals("") || str.equals("null")) {
			return str;
		}
		try {
			return new String(str.getBytes("8859_1"), "euc-kr"); // 8859_1 �� utf-8 / euc-kr �� utf-16 ���ڵ� ���
		}catch(Exception e) {									 // ����ó��.
			e.printStackTrace();
			return str;
		} 
	}
}
