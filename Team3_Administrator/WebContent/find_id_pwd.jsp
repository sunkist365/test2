<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/login.css">
</head>
<body class="find_id_pwd_body">
<%
	int no = Integer.parseInt(request.getParameter("no"));
	if (no == 1) { // ���̵� ã��
		out.println("<div class='title'>���̵� ã��</div>");
	} else if (no == 2) { // ��й�ȣ ã��
		out.println("<div class='title'>��й�ȣ ã��</div>");
	}
%>
	<form class="find_id_pwd" name="find_id_pwd" action="find_id_pwd_ok.jsp">
	
<%
	if (no == 1) { // ���̵� ã��
%>		
		<input type="text" name="name" placeholder="�̸��� �Է����ּ���">
		<input type="text" name="jumin" placeholder="�ֹε�Ϲ�ȣ�� �Է����ּ��� ex) 111111-2222222">
		<input type="hidden" name="no" value="1">
<%	
	} else if (no == 2) { // ��й�ȣ ã��
%>	
		<input type="text" name="id" placeholder="���̵� �Է����ּ���">
		<input type="text" name="jumin" placeholder="�ֹε�Ϲ�ȣ�� �Է����ּ��� ex) 111111-2222222">
		<input type="hidden" name="no" value="2">
<%	
	}
%>	
		<input type="button" value="ã��" onclick="document.find_id_pwd.submit()">
		<input type="button" value="���" onclick="cancel()">
	</form>	
</body>
<script>
	function cancel(){
		window.close();
	}
</script>
</html>