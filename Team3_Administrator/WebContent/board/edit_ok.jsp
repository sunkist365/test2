<%@page import="java.io.File"%>
<%@page import="util.HanConv"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.Date"%>
<%@page import="bean.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="commQuery" class="db.CommunityQuery"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%	
		int index = 0;
		String title = "";
		String content = "";
		String originName = "";
		String systemName = "";
		
		Date date = new Date();
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = upload.parseRequest(request);
		
		String uploadPath = application.getRealPath("/upload/");
		
		Iterator itr = items.iterator();
	     while (itr.hasNext()) {
	          FileItem item = (FileItem) itr.next();
	          if (item.isFormField()) {
	        	  if(item.getFieldName().equals("comm_index")){
	        		  index = Integer.parseInt(item.getString());
	        	  }else if(item.getFieldName().equals("comm_title")){
		        	  title = HanConv.toKor(item.getString());
	        	  }else if(item.getFieldName().equals("comm_content")){
		        	  content = HanConv.toKor(item.getString());
		        	  content = content.replace("\n", "<br>");
	        	  }
	          }else {
	        	 String time = Long.toString(date.getTime());
	             String itemName = item.getName();
	             if(itemName.length() != 0){
	             	originName += itemName + ",";
	             	systemName += time + "_" + itemName + ",";
	             	File savedFile = new File(uploadPath + "/" + time + "_" +itemName);
	             	item.write(savedFile);
	             }
	          }
	     }
	    
	    if(originName.length() == 0){
				originName = null;
				systemName = null;
		}
	     
		int result = -1; 
		result = commQuery.updateCommunity(index, title, content, originName, systemName);
		if(result != -1){
	%>
		<script>
			alert('수정되었습니다.')
			location.href='notice.jsp';
		</script>
	<%		
		}else{
	%>
		<script>
			alert('수정 되지 않았습니다.')
			history.back();
		</script>
	<%					
		}	
	%>
</body>
</html>