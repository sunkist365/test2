<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNUM = request.getParameter("pageNUM");
	int b_id = Integer.parseInt(request.getParameter("b_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제하기</title>
<script type="text/javascript" src="board.js"></script>
</head>
<body>
	<div align="center" >
		<h1>글 삭 제 하 기</h1>
		<h2>&gt;&gt; 암호를 입력하세요. &lt;&lt;</h2>
		<form method="post" action="delete_ok.jsp?b_id=<%=b_id%>&pageNUM=<%=pageNUM%>" name="form">
			<p>암&nbsp;호&nbsp;&nbsp;<input type="password" name="chk_pwd" maxlength="12">
			<p> <input type="button" value="글삭제" onclick="delete_ok()">
			&nbsp;<input type="reset" value="다시작성">
			&nbsp;<input type="button" value="글목록" onclick="location.href='list.jsp?&pageNUM=<%=pageNUM%>'">
		</form>
	</div>  
</body>
</html>