<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if((session.getAttribute("Member") == null )||(session.getAttribute("Member").equals("yes"))){ 
%>
		<jsp:forward page="login.jsp"></jsp:forward>
<%
	}
%>
<%@ include file="admin_top.jsp"%>
<section>
<div align="center">	
	<img src="./resources/images/admin_main.jpg" width=900 />
</div>
</section>
