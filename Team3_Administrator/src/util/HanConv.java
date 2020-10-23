package util;

import java.net.URLEncoder;

public class HanConv { // ����ڰ� ���� �Է��ϴ°� �ƴ� ���������� �������� ���� �����Ҷ� (request�� ����ڷκ��� ��û�� ������ ����ϱ� ����)
	public static String toKor(String str) { // ���ڷ� �ѱ��� ������
		if(str == null || str.equals("") || str.equals("null"))
			return str;
		
		try {
			return new String(str.getBytes("8859_1"), "euc-kr"); // 8859_1 > utf-8(����), euc-kr > utf-16
		}catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}

	public static String toKor2(String str) { // ���ڷ� �ѱ��� �Ѱ��ٶ�

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