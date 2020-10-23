<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String filename	 = request.getParameter("fileN");
		String orgname	 = request.getParameter("orgN");
		
		String saveDirectory = application.getRealPath("/upload");
		String path = saveDirectory + File.separator + filename;
		
		System.out.println(path);
		File file = new File(path);
		long length = file.length();
		
		response.setContentType("application/octet-stream");
		
		response.setContentLength((int)length);
		
		boolean isIe = request.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1 ||
					   request.getHeader("user-agent").indexOf("11.0") != -1;
		if(isIe){ // 인터넷 익스플로러
			orgname = URLEncoder.encode(orgname,"UTF-8");
		}
		else{ 
			orgname = new String(orgname.getBytes("UTF-8"), "8859_1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + orgname);
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			
		out.clear();
		out = pageContext.pushBody();
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		int data;
		while((data=bis.read()) != -1){
			bos.write(data);
			bos.flush();
		}
		
		//8] 스트림 닫기
		bis.close();
		bos.close();
%>
</body>
</html>