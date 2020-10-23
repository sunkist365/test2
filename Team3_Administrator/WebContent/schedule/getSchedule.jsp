<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="schedule.jsp" name="hiddenForm">
		<input type="hidden" name="year" value="<%=request.getParameter("year")%>">
	</form>
	<script>
		document.hiddenForm.submit();
	</script>
</body>
</html>