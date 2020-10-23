<%@page import="bean.ProfessorBean"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="bean.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="proQuery" class="db.ProfessorQuery"></jsp:useBean>
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
		
		int pro_id = Integer.parseInt(multi.getParameter("pro_id"));
		String pro_name = multi.getParameter("pro_name");
		String pro_eng_name = multi.getParameter("pro_eng_name");
		String pro_jumin = multi.getParameter("pro_jumin");
		int pro_major = Integer.parseInt(multi.getParameter("pro_majorCode"));

		String pro_tel = multi.getParameter("pro_tel");
		String pro_addr = multi.getParameter("pro_addr");
		String pro_email = multi.getParameter("pro_email");
		
		ProfessorBean enrollProfessor = new ProfessorBean(pro_id, pro_name, pro_eng_name, pro_jumin, pro_major, pro_tel, pro_addr, pro_email, file, fis);
		int result = proQuery.enrollProfessor(enrollProfessor);
		if(result != -1){
	%>
		<script>
			alert('등록 성공');
			location.href='professorlist.jsp';
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