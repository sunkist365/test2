<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="magic.member.*" %>
<%
	String uid = (String)session.getAttribute("uid");
	MemberDBBean manager=MemberDBBean.getInstance();
	MemberBean mb = manager.getMember(uid);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="script.js" charset="utf-8"></script>
<body>
	<form action="memberUpdateOK.jsp" name="update_frm" method="post">
		<table border="1" align="center">
			<tr>
				<td colspan="2" align="center">
				<h1>회원 정보 수정</h1>
				'*'표시 항목은 필수 입력 항목입니다.
				</td>
			</tr>
			<tr>
				<td>User  ID</td>
				<td><%=mb.getMem_uid() %></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="mem_pwd" size="20">*</td>
			</tr>
			<tr>
				<td>암호 확인</td>
				<td><input type="password" name="pwd_check" size="20">*</td>
			</tr>
			<tr>
				<td>이 름</td>
				<td><%=mb.getMem_name() %></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="email" name="mem_email" value="<%=mb.getMem_email() %>" size="30">*</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="mem_addr" value="<%=mb.getMem_addr() %>" size="40"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="update_check_ok()">
					&nbsp; &nbsp; &nbsp; &nbsp; 
					<input type="reset" value="다시입력">
					&nbsp; &nbsp; &nbsp; &nbsp;
					<input type="button" value="수정안함" onclick="location.href='main.jsp'">
					&nbsp; &nbsp; &nbsp; &nbsp;
					<input type="button" value="삭제" onclick="delete_check()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>