<%@page import="java.io.File"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNUM = request.getParameter("pageNUM");
	String chk_pwd = request.getParameter("chk_pwd");
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	
	BoardDBBean db = BoardDBBean.getinstance();
	BoardBean board = db.getBoard(b_id, false);
	String fname = board.getB_fname(); //파일삭제를 위해 파일이름 가져온다.
	String up="C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\magicWebApp\\reBoard\\upload\\";//파일 경로
	
	int re = db.deleteBoard(b_id, chk_pwd);
	
	if(re == 1){
		//파일삭제
		if(fname != null){
			File file = new File(up+fname);//java.io
			file.delete();
		}
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