<%@page import="book_project.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="book" class="book_project.BookBean"></jsp:useBean>
<jsp:setProperty property="*" name="book"/>

<%
	BookDBBean db = BookDBBean.getinstance();
	int re = db.insertBook(book);
	
	if(re == 1){
		response.sendRedirect("index.jsp");
	}else{
%>
		<script>
			alert('입력 오류가 생겼습니다.');
			history.go(-1);
		</script>
<%
	}
%>