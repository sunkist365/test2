<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="magic.board.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	String pageNUM = request.getParameter("pageNUM");	
	int b_id = Integer.parseInt(request.getParameter("b_id")); //list.jsp에서 받아온 b_id
	
	BoardDBBean db = BoardDBBean.getinstance();
	BoardBean board = db.getBoard(b_id, true); //조회수를 늘린다.
	/* SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); */
	
	String b_name="", b_email="", b_title="", b_content="", b_date2="", b_fname="";
	/* Timestamp b_date = null; */
	int b_hit=0, b_fsize=0;
	
	if(board != null){
		b_title = board.getB_title();
		b_name = board.getB_name();
		b_email = board.getB_email();
		b_content = board.getB_content();
		/* b_date = board.getB_date(); */
		b_date2 = board.getDate2();
		b_hit = board.getB_hit();
		b_fname = board.getB_fname();
		b_fsize = board.getB_fsize();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<script type="text/javascript" src="board.js"></script>
</head>
<body>
	<div align="center">
		<h1>글내용보기</h1>
		<table width="800" border="1">
			<tr>
				<th width="150">글번호</th>
				<td align="center" width="200"><%= b_id %></td>
				<th width="150">조회수</th>
				<td align="center" width="200"><%= b_hit %></td>			
			</tr>
			<tr>
				<th width="150">작성자</th>
				<td align="center" width="200"><%= b_name %></td>
				<th width="150">작성일</th>
				<td  width="200" align="center">
				<%-- <%= sdf.format(b_date) %> --%>
				<%=b_date2 %>
				</td>
			</tr>
			<tr>
				<th>파일</th>
				<td colspan="3" align="center">
					<%
						if(b_fname != null){
					%>
							<img src="../images/zip.gif">&nbsp;
							<a href="./upload/<%=b_fname %>">
								(원본파일 :&nbsp;<%=b_fname%>)
							</a>
					<%
						}
					%>
				</td>
			</tr>
			<tr>
				<th width="150">글제목</th>
				<td colspan="3" width="500"><%= b_title %></td>
			</tr>
			<tr>
				<th width="150">글내용</th>
				<td colspan="3" width="500"><%= b_content %></td>
				<!-- <pre>태그를 쓰면 엔터키도 먹힘. 근데 여기엔 하지마셈  -->
			</tr>
		</table>
		<table width="800">
			<tr>
				<td align="right">
					<input type="button" value="답변글" onclick="location.href='write.jsp?b_id=<%=b_id%>&pageNUM=<%=pageNUM%>'"> <!-- 답변 글을 달려고 하면 원글의 b_id를 가져간다. -->
					<input type="button" value="글 수정" onclick="location.href='edit.jsp?b_id=<%=b_id%>&pageNUM=<%=pageNUM%>'">
					<input type="button" value="글 삭제" onclick="location.href='delete.jsp?b_id=<%=b_id%>&pageNUM=<%=pageNUM%>'">
					<input type="button" value="글 목록" onclick="location.href='list.jsp?&pageNUM=<%=pageNUM%>'">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>