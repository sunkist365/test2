<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="magic.member.*" %>
<% request.setCharacterEncoding("utf-8"); %> <!-- 이걸 먼저 하고 값을 받아야한다. 안그럼 한글깨짐 ㅋ -->
<jsp:useBean id="mb" class="magic.member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>

<%
	String uid = (String)session.getAttribute("uid");
	mb.setMem_uid(uid);
	
	MemberDBBean manager = MemberDBBean.getInstance();
	int re = manager.updateMember(mb);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	if(re == 1){
%>
		<script type="text/javascript">
			alert("입력하신대로 회원 정보가 수정되었습니다.");
			location.href="login.jsp";
		</script>			
<%
	}else{
%>
		<script type="text/javascript">
			alert("수정이 실패하였습니다.");
			history.back();
		</script>			
<%		
	}
%>	
</body>
</html>