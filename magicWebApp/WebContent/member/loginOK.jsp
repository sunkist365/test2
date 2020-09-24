<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="magic.member.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("mem_uid");
	String pwd = request.getParameter("mem_pwd");
	
	MemberDBBean manager = MemberDBBean.getInstance();
	
	int check = manager.userCheck(id, pwd); // 패스워드 일치=1, 불일치=0, 존재x=-1
	MemberBean mb = manager.getMember(id); // id에 맞는 MemberBean이 mb에 들어감.		
	
	//id에 맞는 멤버가 null이면 존재하지 않는 회원이라고 출력.
	if(mb == null){
%>
		<script>
			alert("존재하지 않는 회원");
			history.back();
		</script>
		
<%
	//id에 맞는 멤버는 있다.
	}else{ 
		String name = mb.getMem_name();
		
		if(check == 1){ //id에 맞는 pw가 일치 
			session.setAttribute("uid", id);
			session.setAttribute("name", name);
			session.setAttribute("Member", "yes");

			response.sendRedirect("main.jsp");
		}else if(check == 0){	//id에 맞는 pw가 불일치
%>
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다.");
				history.go(-1); //(=history.back();)
			</script>
		
<%
		}else{
%>
			<script type="text/javascript">
				alret("아이디가 맞지 않습니다.");
				history.go(-1);
			</script>
<%		
		}
	}		
%>
