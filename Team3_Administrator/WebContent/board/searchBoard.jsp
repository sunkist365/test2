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
		String searchContent = request.getParameter("searchContent");
		String searchType = request.getParameter("searchType");
		int groupn = Integer.parseInt(request.getParameter("groupn"));

		String forward = groupn == 1? "free_Board.jsp" : groupn == 4? "notice.jsp" : "q_And_a.jsp";	
	%>
	<form action="<%=forward %>" name="hiddenForm">
		<input type="hidden" value="<%=searchContent %>" name="searchContent">
		<input type="hidden" value="<%=searchType %>" name="searchType">
	</form>
	
	<script>
		document.hiddenForm.submit();
	</script>
</body>
</html>