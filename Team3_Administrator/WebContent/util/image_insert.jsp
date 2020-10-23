<%@page import="javax.sql.rowset.serial.SerialBlob"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
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
		Connection conn = null;
		DataSource ds = null;

	try {
		Context ctx = new InitialContext();
		ds = ((DataSource) ctx.lookup("java:comp/env/jdbc/oracle"));
		conn = ds.getConnection();

		String path = application.getRealPath("/upload/");
		int size = 1024 * 1024 * 10; // 파일 크기
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, path, size, encoding, new DefaultFileRenamePolicy());
	       
		
		Enumeration files = mr.getFileNames();
		String name1 = (String)files.nextElement();
		String name = mr.getFilesystemName(name1);
		
		File file = new File(path+"/"+name);
		FileInputStream fis = new FileInputStream(file);
		int stu_id = Integer.parseInt(mr.getParameter("stu_id"));
		PreparedStatement ps = conn.prepareStatement("update student set stu_img=? where stu_id=?");
		ps.setBinaryStream(1, fis, (int) file.length());
		ps.setInt(2, stu_id);
		ps.executeUpdate();

		out.println("사진 저장 성공");
		if (conn != null)
			conn.close();
		if (ps != null)
			ps.close();
		if (fis != null)
			fis.close();

	} catch (Exception e) {
		out.println("사진 저장 실패");
		e.printStackTrace();
	}

	out.println("<a href='image.jsp'>돌아가기</a>");
	%>
</body>
</html>