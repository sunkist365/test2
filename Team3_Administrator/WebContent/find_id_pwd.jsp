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
	if (no == 1) { // 아이디 찾기
		out.println("<div class='title'>아이디 찾기</div>");
	} else if (no == 2) { // 비밀번호 찾기
		out.println("<div class='title'>비밀번호 찾기</div>");
	}
%>
	<form class="find_id_pwd" name="find_id_pwd" action="find_id_pwd_ok.jsp">
	
<%
	if (no == 1) { // 아이디 찾기
%>		
		<input type="text" name="name" placeholder="이름을 입력해주세요">
		<input type="text" name="jumin" placeholder="주민등록번호를 입력해주세요 ex) 111111-2222222">
		<input type="hidden" name="no" value="1">
<%	
	} else if (no == 2) { // 비밀번호 찾기
%>	
		<input type="text" name="id" placeholder="아이디를 입력해주세요">
		<input type="text" name="jumin" placeholder="주민등록번호를 입력해주세요 ex) 111111-2222222">
		<input type="hidden" name="no" value="2">
<%	
	}
%>	
		<input type="button" value="찾기" onclick="document.find_id_pwd.submit()">
		<input type="button" value="취소" onclick="cancel()">
	</form>	
</body>
<script>
	function cancel(){
		window.close();
	}
</script>
</html>