<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNUM = request.getParameter("pageNUM");
	String chk_pwd = request.getParameter("chk_pwd");
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	
	BoardDBBean db = BoardDBBean.getinstance();
	int re = db.deleteBoard(b_id, chk_pwd);
	
	if(re == 1){
%>
		<script>
			alert('삭제가 완료되었습니다.');
		</script>
<%
		response.sendRedirect("list.jsp?pageNUM="+pageNUM);
	}else if(re == 0){
%>
		<script>
			alert('비밀번호가 틀렸습니다.');
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script>
			alert('삭제 실패');
			history.go(-1);
		</script>
<%
	}
%>