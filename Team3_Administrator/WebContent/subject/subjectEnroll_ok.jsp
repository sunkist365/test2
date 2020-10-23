<%@page import="bean.SubjectBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="subQuery" class="db.SubjectQuery"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int subj_code = Integer.parseInt(request.getParameter("subj_code"));
		String subj_state = request.getParameter("subj_state");
		int subj_majorcode = Integer.parseInt(request.getParameter("stu_majorCode"));
		String subj_name = request.getParameter("subj_name");
		int subj_hakjum = Integer.parseInt(request.getParameter("subj_hakjum"));
		int subj_pro = Integer.parseInt(request.getParameter("stu_proId"));
		String subj_room = request.getParameter("subj_room");

		String day1 = request.getParameter("day1_day") + "," + request.getParameter("day1_stime") + "," +request.getParameter("day1_etime");
		String day2 = null;
		if(request.getParameter("day2_day") != null)
			day2 = request.getParameter("day2_day") + "," + request.getParameter("day2_stime") + "," +request.getParameter("day2_etime");
		
		SubjectBean sb = new SubjectBean();
		sb.setSubj_code(subj_code);
		sb.setSubj_state(subj_state);
		sb.setSubj_majorcode(subj_majorcode);
		sb.setSubj_name(subj_name);
		sb.setSubj_hakjum(subj_hakjum);
		sb.setSubj_pro(subj_pro);
		sb.setSubj_room(subj_room);
		sb.setSubj_day1(day1);
		sb.setSubj_day2(day2);
		
		int result = subQuery.enrollSubject(sb);
		if(result != -1){
	%>
		<script>
			alert('등록 성공');
			location.href='subjectEnroll.jsp';
		</script>
	<%
		}else{
	%>
		<script>
			alert('등록 실패');
			history.back();
		</script>
	<%
		}
	%>
</body>
</html>