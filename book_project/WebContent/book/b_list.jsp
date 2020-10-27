<%@page import="bookManager.book.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookManager.book.BookManageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	//select옵션
	String ch1 = request.getParameter("ch1");
	//검색어
	String ch2 = request.getParameter("ch2");
	int count = 0;
	
	String currentPage = request.getParameter("currentPage");
	if(currentPage == null){
		currentPage = "1";
	}
	
	BookManageBean manager = BookManageBean.getinstance();
	ArrayList<BookBean> booklist = manager.listManageBoard(ch1, ch2);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>책 목록</title>
		<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
	</head>
	<body>
		<%@ include file="../admin_top.jsp"%>
		<section>
		<div class="container" align="center">
			<br>
			<div>
				<h2>도서 정보 관리</h2>
			<div align="right">	
				<table border="1" title="장르 범례">
					<tr>
						<th>소설</th>
						<th>역사</th>
						<th>정치</th>
						<th>예술</th>
						<th>과학</th>
						<th>경제</th>
					</tr>
					<tr>
						<th>01</th>
						<th>02</th>
						<th>03</th>
						<th>04</th>
						<th>05</th>
						<th>06</th>
					</tr>
				</table>
			</div>
			</div>
			
			<table class="table table-hover table-striped">
			<thead>
				<tr>
			        <th>도서번호</th>
		            <th>제목</th>
		            <th>작가</th>
		            <th>가격</th>
		            <th>장르</th>
		            <th>출판년도</th>
		           <!--  <th>수량</th> -->
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0; i<booklist.size(); i++){
						BookBean book = booklist.get(i);
						count++;
				%>
				<tr align=center>
					<td>
						<a href='b_content.jsp?book_no=<%=book.getB_no()%>'> <%=book.getB_no()%></a>
					</td>
					<td><%=book.getB_title()%></td>
					<td><%=book.getB_author()%></td>
					<td><%=book.getB_price()%></td>
					<td><%=book.getB_genre()%></td>
					<td><%=book.getB_year()%></td>
					<%-- <td><%=book.getB_amount()%></td> --%>
				</tr>
				<%
					}
				%>
				</tbody>
			</table>
			
			<form name=f2 action=b_list.jsp>
				<select name="ch1">
					<option value="b_title">제목</option>
					<option value="b_author">작가번호</option>
					<option value="b_year">출판년도</option>
				</select> 
				<input type="text" name="ch2"> 
				<input type="submit" value="검색">
			</form>
			</div>		
		</section>
	</body>
</html>
