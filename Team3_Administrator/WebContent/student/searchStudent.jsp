<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String stuID = request.getParameter("stuID");
	%>
	<form action="studentlist.jsp" name="hiddenForm">
		<input type="hidden" value="<%=stuID%>" name="stuID">
	</form>
	
	<script>
		document.hiddenForm.submit();
	</script>
</body>
</html>