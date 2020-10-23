<%@page import="bean.CommunityBean"%>
<%@page import="util.HanConv"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.Date"%>
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
		String title = "";
		String content = "";
		String originName = "";
		String systemName = "";
		
		int comm_index = 0, comm_num = 0;
		int groupn = 0;
		int ref=1, step=0, level=0;
		
		Date date = new Date();
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = upload.parseRequest(request);

		String uploadPath = application.getRealPath("/upload/");
		
		Iterator itr = items.iterator();
	     while (itr.hasNext()) {
	          FileItem item = (FileItem) itr.next();
	          if (item.isFormField()) {
	        	  if(item.getFieldName().equals("title")){
		        	  title = HanConv.toKor(item.getString());
	        	  }else if(item.getFieldName().equals("content")){
		        	  content = HanConv.toKor(item.getString());
		        	  content = content.replace("\n", "<br>");
	        	  }else if(item.getFieldName().equals("comm_index")){
	        		  comm_index = Integer.parseInt(item.getString());	
	        	  }else if(item.getFieldName().equals("comm_num")){
	        		  comm_num = Integer.parseInt(item.getString());	        		  
	        	  }else if(item.getFieldName().equals("groupn")){
	        		  groupn = Integer.parseInt(item.getString());	        		  
	        	  }else if(item.getFieldName().equals("ref")){
	        		  ref = Integer.parseInt(item.getString());
	        	  }else if(item.getFieldName().equals("step")){
	        		  step = Integer.parseInt(item.getString());	        		  
	        	  }else if(item.getFieldName().equals("level")){
	        		  level = Integer.parseInt(item.getString());	        		  
	        	  }
	          }else {
	        	 String time = Long.toString(date.getTime());
	             String itemName = item.getName();
	             if(itemName.length() != 0){
	             	originName += itemName + ",";
	             	systemName += time + "_" + itemName + ",";
	             	File savedFile = new File(uploadPath + "/" + time + "_" +itemName);
	             	item.write(savedFile);	
	             //	System.out.println(savedFile.getPath());
	             }
	          }
	     }
		
		if(originName.length() == 0){
			originName = null;
			systemName = null;
		}
	    
		CommunityBean cb = new CommunityBean();
		cb.setComm_index(comm_index);
		cb.setComm_num(comm_num);
		cb.setComm_groupN(groupn);
		cb.setComm_title(title);
		cb.setComm_content(content);
		cb.setComm_writer(session.getAttribute("username").toString());
		cb.setComm_id(Integer.parseInt(session.getAttribute("userid").toString()));
		cb.setComm_ref(ref);
		cb.setComm_step(step);
		cb.setComm_level(level);
		cb.setComm_originFileName(originName);
		cb.setComm_systemFileName(systemName);
		
		int result = commQuery.insertCommunity(cb);
		
		out.println("<script>");
		if(result != -1){
			out.println("alert('작성 되었습니다')");
			if(groupn == 1)
				out.println("location.href='free_Board.jsp'");
			else if(groupn == 2 || groupn == 3)
				out.println("location.href='q_And_a.jsp'");
			else if(groupn == 4)
				out.println("location.href='notice.jsp'");
		}else{
			out.println("alert('작성 되지 않았습니다.');");
			out.println("history.back();");
		}
		out.println("</script>");
		
	%>
</body>
</html>