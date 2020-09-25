<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="magic.board.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	String pageNUM = request.getParameter("pageNUM");
	if(pageNUM == null){
		pageNUM = "1";
	}
	
	String currentPage = request.getParameter("currentPage");
	if(currentPage == null){
		currentPage = "1";
	}
	
	BoardDBBean db = BoardDBBean.getinstance();
	ArrayList<BoardBean> boardList = db.listBoard(pageNUM);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String b_name, b_email, b_title, b_content, b_date2;
	int b_id=0, b_hit=0, b_level=0;
	Timestamp b_date;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
	</head>
	<body>
		<h1 align="center">게시판에 등록된 글 목록 보기</h1>			
		<table align="center" width="600">
			<tr>
				<td align="right">
					<a href="write.jsp?currentPage=<%=currentPage%>">
<%-- 					<a href="write.jsp?pageNUM=<%=pageNUM%>"> --%>
						<button type="button" value="글쓰기">글쓰기</button>
					</a>
				</td>
			</tr>
		</table>
		<table align="center" width="800" border="1">
			<tr height="25">
				<th width="40">번호</th>
				<th width="450">글제목</th>
				<th width="120">작성자</th>
				<th width="150">작성일</th>
				<th width="50">조회수</th>
			</tr>
			<%
				for(int i=0; i<boardList.size(); i++){
					BoardBean board = boardList.get(i);
					
					b_id = board.getB_id();
					b_title = board.getB_title();
					b_name = board.getB_name();
					b_email = board.getB_email();
					b_content = board.getB_content();
					b_date = board.getB_date();
					b_date2 = board.getDate2();
					b_hit = board.getB_hit();
					b_level = board.getB_level();
			%>
			<tr onmouseover="this.style.background='#ccc'" 
				onmouseout="this.style.background='#fff'">
				<td align="center"><%=b_id%></td>
				<td>
					<% 
						if(b_level>0){
							for(int k=0; k<b_level; k++){
								%>&nbsp;<%
							}
							%><img src="../images/AnswerLine.gif" width="16" height="16" boarder="0"><%
						}
					%>
					<a href="show.jsp?b_id=<%=b_id%>&currentPage=<%=currentPage%>">
<%-- 					<a href="show.jsp?b_id=<%=b_id%>&pageNUM=<%=pageNUM%>"> --%>
						<%=b_title%>
					</a>
				</td>
				<td align="center"><a href="mailto:<%=b_email%>"><%=b_name %></a></td>
				<td align="center"><%-- <%= sdf.format(b_date) %> --%><%= b_date2 %></td>
				<td align="center"><%=b_hit %></td>
			</tr>
			<%
				} 
			%>
		</table>
		<br><br>
		<div align="center">		
			<%= BoardBean.pageNumber1(5) %>
		</div>
		<table align="center" width="800">
			<tr>
				<td align="right">현재시각 : <%= new java.util.Date() %></td>
			</tr>
		</table>
	</body>
</html>