<%@page import="magic.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 올리기</title>
<script type="text/javascript" src="board.js"></script>
</head>
<%
	String pageNUM = request.getParameter("pageNUM");
	int b_id=0, b_ref=1, b_step=0, b_level=0;
	String b_name="", b_title="";

	//답글일 경우 b_id를 가져온다.
	if(request.getParameter("b_id") != null){
		b_id = Integer.parseInt(request.getParameter("b_id"));
	}
	
	BoardDBBean db = BoardDBBean.getinstance();
	BoardBean board = db.getBoard(b_id, false); //원글db를 가져온다, 새글이면 null
	
	if(board != null){
		b_title = board.getB_title();
		b_ref = board.getB_ref();
		b_step = board.getB_step();
		b_level = board.getB_level();
	}
%>
<body>
	<h1 align="center">글 올 리 기</h1>
	<form action="write_ok.jsp" method="post" name="form" enctype="multipart/form-data">
		<input type="hidden" name="b_id" value="<%=b_id%>">
		<input type="hidden" name="b_ref" value="<%=b_ref%>">
		<input type="hidden" name="b_step" value="<%=b_step%>">
		<input type="hidden" name="b_level" value="<%=b_level%>">
		<div align="center">
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="b_name" size="10"></td>
					<td>이메일</td>
					<td><input type="text" name="b_email" size="20"></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3">
						<% if(b_id == 0){ %>
						<input type="text" name="b_title" size="50">
						<%}else{ %>
						<input type="text" name="b_title" size="50" value="[답변]:<%=b_title %>">
						<%} %>
					</td>
				</tr>
				<tr>
					<td>파일</td>
					<td colspan="3">
						<input type="file" name="b_fname" size="50">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="50" name="b_content"></textarea>					
					</td>
				</tr>
				<tr>
					<td>암&nbsp;호</td>
					<td><input type="password" name="b_pwd" maxlength="12" size="12"></td>
				<tr>
			</table>
			<br><br>
			<input type="button" value="글쓰기" onclick="check_ok()">
			<input type="reset" value="다시작성">
			<input type="button" value="글목록" onclick="location.href='list.jsp?&pageNUM=<%=pageNUM%>'">
		</div>
	</form>
</body>
</html>