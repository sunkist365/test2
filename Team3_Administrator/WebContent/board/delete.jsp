<%@page import="java.util.StringTokenizer"%>
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
		int groupN = Integer.parseInt(request.getParameter("groupN"));
		String index_s = request.getParameter("index");
		String index = "(";
		StringTokenizer tokenizer = new StringTokenizer(index_s, ",");
		while(tokenizer.hasMoreTokens()){
			if(tokenizer.countTokens() == 1)
				index += (tokenizer.nextToken() + ")");
			else
				index += (tokenizer.nextToken() + ", ");
		}
		int result = commQuery.deleteCommunity(index, groupN);
		out.println("<script>");
		if(result != -1){
			out.println("alert('삭제되었습니다')");
		}else{
			out.println("alert('삭제 되지 않았습니다.')");
		}
		
		if(groupN == 1){
			out.println("location.href='free_Board.jsp'");			
		}else if(groupN == 4){
			out.println("location.href='notice.jsp'");						
		}else{
			out.println("location.href='q_And_a.jsp'");									
		}
		out.println("</script>");
	%>
</body>
</html>