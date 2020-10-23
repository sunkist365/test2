<%@page import="bean.ScheduleBean"%>
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
		String start = request.getParameter("start-date");
		String end = request.getParameter("end-date");
		boolean holiyday = request.getParameter("holiday") != null ? true : false;
		String content = request.getParameter("content");
		
		int sYear = Integer.parseInt(start.substring(0, 4));
		int sMonth = Integer.parseInt(start.substring(5, 7));
		int sDay = Integer.parseInt(start.substring(8, 10));

		int eYear = Integer.parseInt(end.substring(0, 4));
		int eMonth = Integer.parseInt(end.substring(5, 7));
		int eDay = Integer.parseInt(end.substring(8, 10));
		
		int result = scheQuery.addSchedule(new ScheduleBean(content, sYear, sMonth, sDay, eYear, eMonth, eDay, holiyday));
		out.println("<script>");
		if(result != -1){
			out.println("alert('일정이 추가 되었습니다')");
			out.println("location.href='schedule.jsp'");	
		}else{
			out.println("alert('일정이 추가 되지 않았습니다.');");
			out.println("history.back();");
		}
		out.println("</script>");
		
	%>
</body>
</html>