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
		out.println("alert('��й�ȣ�� �����Ǿ����ϴ�.')");
		out.println("window.close()");
	}else{
		out.println("alert('��й�ȣ�� �������� �ʾҽ��ϴ�.')");
		out.println("history.back();");
	}
	out.println("</script>");
%>
</body>
</html>