<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="magic.board.*" %>
<%
	String pageNUM = request.getParameter("pageNUM");	
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	BoardDBBean db = BoardDBBean.getinstance();
	
	BoardBean board = db.getBoard(b_id,false);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정페이지</title>
<script type="text/javascript" src="board.js"></script>
</head>
<body>
	<h1 align="center">글 수 정 하 기</h1>
	<form action="edit_ok.jsp?b_id=<%=b_id%>&pageNUM=<%=pageNUM%>" method="post" name="form">
		<div align="center">
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="b_name" size="10" value="<%=board.getB_name()%>"></td>
					<td>이메일</td>
					<td><input type="text" name="b_email" size="20" value="<%=board.getB_email()%>"></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3"><input type="text" name="b_title" size="50" value="<%=board.getB_title()%>"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="50" name="b_content"><%=board.getB_content()%></textarea>					
					</td>
				</tr>
				<tr>
					<td>암&nbsp;호</td>
					<td><input type="password" name="b_pwd" maxlength="12" size="12"></td>
				<tr>
			</table>
			<br><br>
			<input type="button" value="글수정" onclick="check_ok()">
			<input type="reset" value="다시작성">
			<input type="button" value="글목록" onclick="location.href='list.jsp?pageNUM=<%=pageNUM%>'">
		</div>
	</form>
</body>
</html>