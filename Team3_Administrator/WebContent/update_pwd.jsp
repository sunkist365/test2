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
	
	System.out.println(id+", " + pwd);
	
	int result = loginQuery.updatePwd(id, pwd);
	out.println("<script>");
	if(result != -1){
		out.println("alert('비밀번호가 수정되었습니다.')");
		out.println("window.close()");
	}else{
		out.println("alert('비밀번호가 수정되지 않았습니다.')");
		out.println("history.back();");
	}
	out.println("</script>");
%>
</body>
</html>