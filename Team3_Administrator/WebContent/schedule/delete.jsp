<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="scheQuery" class="db.ScheduleQuery"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String index_s = request.getParameter("index");
		String index = "(";
		StringTokenizer tokenizer = new StringTokenizer(index_s, ",");
		while(tokenizer.hasMoreTokens()){
			if(tokenizer.countTokens() == 1)
				index += (tokenizer.nextToken() + ")");
			else
				index += (tokenizer.nextToken() + ", ");
		}
		int result = scheQuery.deleteSchedule(index);
		
		out.println("<script>");
		if(result != -1){
			out.println("alert('삭제되었습니다')");
		}else{
			out.println("alert('삭제 되지 않았습니다.')");
		}		
		out.println("location.href='schedule.jsp'");			
		out.println("</script>");
	%>
</body>
</html>