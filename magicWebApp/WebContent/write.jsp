<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 올 리 기</h1>
		<form method="post" action="write_ok.jsp">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140"><input type="text" name="b_name" size="10"></td>
					<td width="80">이메일</td>
					<td width="240"><input type="text" name="b_email" size="24"></td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3"><input type="text" name="b_title" size="55"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="65" name="b_content"></textarea>
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4" width="480">
						<input type="submit" value="글쓰기"> &nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>	
		</form>
	</center>
</body>
</html>