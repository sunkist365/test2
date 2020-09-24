<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//세션이 loginOK를 타고 들어오지 못하면 로그인으로 보냄.(비정상적 접속 차단)
	if(session.getAttribute("Member") == null){ 
%>
		<jsp:forward page="login.jsp"></jsp:forward>		
<%
	}

	String uid = (String)session.getAttribute("uid");
	String name = (String)session.getAttribute("name");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 메인화면</title>
</head>
<body>
	<form method="post" action="logOut.jsp">
		<table border="1" align="center">
			<tr align="center">
				<td>
					안녕하세요. <%=name%>(<%=uid%>)님
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="로그아웃">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="회원정보 변경" onclick="location.href='memberUpdate.jsp'">					
				</td>
			</tr>
		</table>
	</form>
</body>
</html>