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
		String subjectName = request.getParameter("majorName");
	%>
	<form action="subjectList.jsp" name="hiddenForm">
		<input type="hidden" value="<%=subjectName%>" name="majorName">
	</form>
	
	<script>
		document.hiddenForm.submit();
	</script>
</body>
</html>