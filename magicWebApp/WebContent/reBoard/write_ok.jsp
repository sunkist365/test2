<%@page import="java.net.InetAddress"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="magic.board.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="magic.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 확인</title>
</head>
<body>
<%
	board.setB_date(new Timestamp(System.currentTimeMillis()));
	

	InetAddress address = InetAddress.getLocalHost();
	String ip = address.getHostAddress();

	board.setB_ip(ip);
	
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