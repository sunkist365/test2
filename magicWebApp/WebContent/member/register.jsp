<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입 페이지입니다.</title>
<style>
	tr{
		height: 30px;
	}
	tr:first-child {
		height: 50px;
	}
	tr td:first-child{
		width: 80px;
	}
</style>
<script type="text/javascript" src="./script.js" charset="utf-8"></script>
<!-- script language="JavaScript" src="script.js" -->
</head>
<body>
	<form action="registerOK.jsp" name="reg_frm" method="post">
		<table border="1" align="center">
			<tr>
				<td colspan="2" align="center">
				<h1>회원 가입 신청</h1>
				'*'표시 항목은 필수 입력 항목입니다.
				</td>
			</tr>
			<tr>
				<td>User  ID</td>
				<td><input type="text" name="mem_uid" size="20">*</td>
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
				<td><input type="text" name="mem_name" size="20">*</td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="email" name="mem_email" size="30">*</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="mem_addr" size="40"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="등록" onclick="check_ok()">
					&nbsp; &nbsp; &nbsp; &nbsp; 
					<input type="reset" value="다시입력">
					&nbsp; &nbsp; &nbsp; &nbsp;
					<input type="button" value="가입안함" onclick="location.href='login.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>