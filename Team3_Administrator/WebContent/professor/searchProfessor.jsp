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
		String proID = request.getParameter("proID");
	%>
	<form action="professorlist.jsp" name="hiddenForm">
		<input type="hidden" value="<%=proID%>" name="proID">
	</form>
	
	<script>
		document.hiddenForm.submit();
	</script>
</body>
</html>