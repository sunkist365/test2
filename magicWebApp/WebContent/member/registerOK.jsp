<%@page import="java.sql.Timestamp"%>
<%@ page import="magic.member.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%	request.setCharacterEncoding("utf-8"); %>    
<jsp:useBean id="mb" class="magic.member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<%
	mb.setMem_regdate(new Timestamp(System.currentTimeMillis()));
	MemberDBBean manager = MemberDBBean.getInstance();
	
	if(manager.confirmID(mb.getMem_uid()) == 1){
%>
	<script language=javascript>
		alert("중복된 아이디가 존재합니다.");
		history.back(); //이전페이지로 이동
	</script>		
<%
	}else{
		int re = manager.insertMember(mb);
		
		if(re == 1){
%>
			<script language=javascript>
				alert("회원가입을 축하드립니다.\n회원으로 로그인 해주세요.");
				location.href="login.jsp";
			</script>		

<%
		}else{
%>
			<script language=javascript>
				alert("회원가입에 실패했습니다.");
			</script>		
<%
		}
	}
	//Servers - server.xml 에서 context jdbc추가해줘야 함.
	//<Resource auth="Container" driverClassName="oracle.jdbc.driver.OracleDriver" maxActive="100" maxIdle="30" maxWait="10000" name="jdbc/oracle" password="tiger" type="javax.sql.DataSource" url="jdbc:oracle:thin:@localhost:1521:orcl" username="scott"/>
%>