<%@page import="org.apache.tomcat.util.http.fileupload.UploadContext"%>
<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="magic.board.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!--enctype때문에 안됨  -->
<%-- <jsp:useBean id="board" class="magic.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 확인</title>
</head>
<body>
<%
	BoardBean board = new BoardBean();	

	SmartUpload upload = new SmartUpload();
	upload.initialize(pageContext); //객체 초기화
	upload.upload(); //업로드
	
	String b_fname = null;
	int b_fsize = 0;
	
	File file = upload.getFiles().getFile(0);
	if(!file.isMissing()){
		b_fname = file.getFileName();
		file.saveAs("reBoard/upload/"+b_fname);
		b_fsize = file.getSize();
	}
	
	board.setB_name(upload.getRequest().getParameter("b_name"));
	board.setB_email(upload.getRequest().getParameter("b_email"));
	board.setB_title(upload.getRequest().getParameter("b_title"));
	board.setB_content(upload.getRequest().getParameter("b_content"));
	board.setB_pwd(upload.getRequest().getParameter("b_pwd"));
	board.setB_fname(b_fname);
	board.setB_fsize(b_fsize);
	
	//////////////////////////////////////////////
	Timestamp ts = new Timestamp(System.currentTimeMillis());
	board.setB_date(ts);
	//////////////////////////////////////////////
	InetAddress address = InetAddress.getLocalHost();
	String ip = address.getHostAddress();

	board.setB_ip(ip);
	//////////////////////////////////////////////
	BoardDBBean manager = BoardDBBean.getinstance();
	int re = manager.insertBoard(board);
	
	if(re == 1){
		response.sendRedirect("list.jsp");
	}else{
		response.sendRedirect("write.jsp");
	}
%>
</body>
</html>