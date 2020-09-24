<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="magic.board.BoardBean">
	<jsp:setProperty property="*" name="board"/>    
</jsp:useBean>

<%
	String pageNUM = request.getParameter("pageNUM");	
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	board.setB_id(b_id);
	
	BoardDBBean db = BoardDBBean.getinstance();
	int re = db.editBoard(board);
	
	if(re == 1){
		response.sendRedirect("list.jsp?pageNUM="+pageNUM);
	}else if(re == 0){
%>
		<script>
			alert('비밀번호가 틀렸습니다.');
			history.go(-1);
		</script>
<%
	}else{
%>
		<script>
			alert('수정실패');
			history.go(-1);
		</script>
<%
	}
	
%>
