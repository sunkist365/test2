<%@page import="bean.StudentBean"%>
<%@page import="bean.ProfessorBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="stuQuery" class="db.StudentQuery"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
		int num = Integer.parseInt(request.getParameter("num"));
		int id  = 0;
		int year = 0;
		int semester = 0;
		if(num != 3){
			id = Integer.parseInt(request.getParameter("id"));
			year = Integer.parseInt(request.getParameter("year"));
			semester = Integer.parseInt(request.getParameter("semester"));
			%>	
			<form action="attendance.jsp" name="hiddenForm">
				<input type="hidden" name="id" value="<%=id%>">
				<input type="hidden" name="year" value="<%=year%>">
				<input type="hidden" name="semester" value="<%=semester%>">
			<%	
			if(num == 1){ // 수강정보
			%>	
				<input type="hidden" name="searchClass_result" value="1">
				<input type="hidden" name="searchStudent_result" value="1">
			<%			
				}else if(num == 2){ // 출석정보
					int subjCode = Integer.parseInt(request.getParameter("subjCode"));
			%>	
				<input type="hidden" name="subjCode" value="<%=subjCode%>">
				<input type="hidden" name="searchAttend_result" value="1">
				<input type="hidden" name="searchClass_result" value="1">
				<input type="hidden" name="searchStudent_result" value="1">
			<% }%>
			</form>
			<%
		}else if(num == 3){
			int stu_id = Integer.parseInt(request.getParameter("stuNumber"));
		%>
			<form action="attendance.jsp" name="hiddenForm">
				<input type="hidden" name="id" value="<%=stu_id%>">
				<input type="hidden" name="searchStudent_result" value="1">
			</form>
		<%
		}
	%>
	<script>
		document.hiddenForm.submit();
	</script>
</body>
</html>