<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookManager.customer.*" %>
<%
   	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="bookManager.customer.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>

<%
	UserDBBean db = UserDBBean.getinstance();

	if(db.confirmID(user.getCs_id()) == 1){
%>
	<script>
		alert("중복된 아이디가 존재합니다.");
		history.back(); //이전페이지로 이동
	</script>		
<%
	}else{
		int re = db.insertUser(user);
		
		if(re == 1){
%>
			<script>
				alert("회원가입을 축하드립니다.\n회원으로 로그인 해주세요.");
				location.href="login.jsp";
			</script>		

<%
		}else{
%>
			<script>
				alert("회원가입에 실패했습니다.");
			</script>		
<%
		}
	}
%>