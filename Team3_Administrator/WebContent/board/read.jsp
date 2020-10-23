<%@page import="bean.Comment"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="bean.CommunityBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="commQuery" class="db.CommunityQuery"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/board.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	.attachedTable{
		border-bottom: 1px solid #ddd;
		text-align: left;
		padding: 10px;
	}
	
	.cmt{
		border-bottom: 1px solid #ddd;
		text-align: left;
		padding:10px;
	}
	.cmt p{
		margin: 2px;
	}
</style>
</head>
<body>
<%
	int index = Integer.parseInt(request.getParameter("index"));
	CommunityBean comm = commQuery.getCommunity().get(index);	
	int groupN = comm.getComm_groupN();	
	String forwardFile = "";
	if(groupN == 1){
		out.println("<div class='title'>�����Խ���</div>");
		forwardFile = "free_Board.jsp";
	}else if(groupN == 4){
		out.println("<div class='title'>�л����</div>");		
		forwardFile = "notice.jsp";
	}else{
		out.println("<div class='title'>�л���ù���</div>");
		forwardFile = "q_And_a.jsp";
	}
	
	ArrayList<CommunityBean> files = null;

	if(comm.getComm_originFileName() != null){
		files = new ArrayList<CommunityBean>();
		StringTokenizer orgTokenizer = new StringTokenizer(comm.getComm_originFileName(), ",");
		StringTokenizer sysTokenizer = new StringTokenizer(comm.getComm_systemFileName(), ",");
	
		while(orgTokenizer.hasMoreTokens()){
			files.add(new CommunityBean(orgTokenizer.nextToken(), sysTokenizer.nextToken()));	
		}
	}
%>
	<table class="read_table">
		<thead>
			<tr>
				<td rowspan="3" style="width:700px;">
					<h2 class="read_title"><%=comm.getComm_title()%></h2>
				</td>
				<td style="width:150px;">�ۼ���</td>
				<td style="width:150px;"><%=comm.getComm_writer()%></td>
			</tr>
			<tr>
				<td>�ۼ�����</td>
				<td><%=comm.getComm_date() %></td>
			</tr>
			<tr>
				<td>��ȸ��</td>
				<td><%=comm.getComm_hits() %></td>
			</tr>
		</thead>
		<tbody>
		
			<%	if(files != null){ %>
			<tr>
				<td colspan="3" class="attachedTable">
					<%
						for(int i=0; i<files.size(); i++){
							String orgName = files.get(i).getComm_originFileName();
							String sysName = files.get(i).getComm_systemFileName();
							out.println("<p>÷������ " + (i+1) + " <a href='FileDownload.jsp?fileN="+sysName+"&orgN="+orgName+"'>"+orgName+"</a></p>");
						}
					%>
				</td>
			</tr>
			<%} %>
			<tr>
				<td colspan="3">
					<div class="read_content">
						<%=comm.getComm_content() %>
					</div>
				</td>
			</tr>
		</tbody>
		<tfoot>
        <tr>
          <td class="read_button" colspan="3">
		<% if(groupN == 4) {%>
            <input type="button" value="����" onclick="location.href='edit.jsp?index=<%=index%>'"/>
		<%} %>

            <input type="button" value="����"/>
		<% if(groupN != 4) {%>
            <input type="button" value="���" onclick="location.href='write.jsp?index=<%=index%>'"/>
		<%} %>
            <input type="button" value="�۸��" onclick="location.href='<%=forwardFile%>'"/>
          </td>
        </tr>
        <%
        	ArrayList<Comment> comment = commQuery.getComments(comm.getComm_index());
    		if(comment.size() != 0){
        %>
        <tr>
        	<td colspan="3" style="padding:10px; text-align: left; border-bottom: 1px solid #ddd;">
        		<h3>���</h3>
        	</td>
        </tr>
        <%
				for(int i=0; i<comment.size(); i++){
    	%>
        		<tr>
        			<td class="cmt" colspan="3">
						<p><b><%=comment.get(i).getCmt_writer() %></b> <%=comment.get(i).getCmt_date() %> <br></p>
						<p><%=comment.get(i).getCmt_content() %></p>
        			</td>
        		</tr>
        <%
				}
        	}
        %>
      </tfoot>
	</table>
	
</body>
<script>
	var title = document.querySelector(".read_title");
	$(document).ready(function () {
          title.setAttribute("data-content", "No."+<%=comm.getComm_num()%>);
    });
</script>

</html>