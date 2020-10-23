<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="bean.StudentBean"%>
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
		String path = application.getRealPath("/upload/");
		int size = 1024 * 1024 * 10; // 파일 크기
		String encoding = "euc-kr";
		MultipartRequest multi = new MultipartRequest(request, path, size, encoding, new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		
		String name1 = (String)files.nextElement();
		String name = multi.getFilesystemName(name1);
		File file = null;
		FileInputStream fis = null;
		if(name != null){
			file = new File(path+"/"+name);
			fis = new FileInputStream(file);
		}
		
		int stu_id = Integer.parseInt(multi.getParameter("stu_id"));
		String stu_name = multi.getParameter("stu_name");
		String stu_eng_name = multi.getParameter("stu_eng_name");
		String stu_jumin = multi.getParameter("stu_jumin");
		String state = multi.getParameter("stu_state");
		int stu_state = state.equals("재학") ? 1 : state.equals("졸업") ? 2 : state.equals("휴학") ? 3 : 4;
		int stu_major = Integer.parseInt(multi.getParameter("stu_majorCode"));
		int stu_grade = Integer.parseInt(multi.getParameter("stu_grade"));
		int stu_pro= Integer.parseInt(multi.getParameter("stu_proId"));

		String stu_tel = multi.getParameter("stu_tel");
		String stu_emgTel = multi.getParameter("stu_emgTel");
		String stu_addr = multi.getParameter("stu_addr");
		String stu_email = multi.getParameter("stu_email");
		
		StudentBean enrollStudent = new StudentBean(stu_id, stu_name, stu_eng_name, stu_jumin, stu_state, stu_major, stu_grade, stu_pro, stu_tel, stu_emgTel, stu_addr, stu_email, file, fis);
		int result = stuQuery.enrollStudent(enrollStudent);
		if(result != -1){
	%>
		<script>
			alert('등록 성공');
			location.href='studentlist.jsp';
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