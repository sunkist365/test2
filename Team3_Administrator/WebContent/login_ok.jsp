<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="loginQuery" class="db.LoginQuery"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%	
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String username = loginQuery.login(id, pwd);
				
		out.println("<script>");
		if(username != null){
			out.println("alert('로그인 되었습니다.')");
			out.println("location.href='main.jsp'");
			session.setAttribute("userid", id);
			session.setAttribute("username", username);
		}else{
			out.println("alert('아이디와 비밀번호를 확인해주세요')");
			out.println("history.back();");
		}
		out.println("</script>");
	%>
</body>
</html>