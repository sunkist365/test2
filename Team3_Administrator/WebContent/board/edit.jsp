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
	#selectedFileList tr, #selectedFileList td{
		border:none;
		padding: 0;
	}
</style>
</head>
<body>
<%
	int index = Integer.parseInt(request.getParameter("index"));
	CommunityBean comm = commQuery.getCommunity().get(index);	
%>
	<div class='title'>�л���� - �ۼ���</div>
	<form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="comm_index" value="<%=comm.getComm_index()%>">
		<table class="read_table">
			<thead>
				<tr>
					<td rowspan="3" style="width:700px;">
						<h2 class="read_title"><input type="text" name="comm_title" value="<%=comm.getComm_title()%>"></h2>
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
				<tr>
					<td colspan="3" style="padding:10px;">
					  <input type="file" id="file" name="uploads" multiple/>
					  <div id="selectedFileListWrap">
					  	<table id="selectedFileList">	
					  	</table>
					  </div>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3">
						<div class="read_content">
							<textarea name="comm_content"><%=comm.getComm_content().replace("<br>", "\n")%></textarea>
						</div>
					</td>
				</tr>
			</tbody>
			<tfoot>
	        <tr>
	          <td class="read_button" colspan="3">
	            <input type="submit" value="�����Ϸ�" />
	            <input type="reset" value="�ٽþ���" />
	            <input type="button" value="�۸��" onclick="location.href='notice.jsp'"/>
	          </td>
	        </tr>
	      </tfoot>
		</table>
	</form>
</body>
<script>
	var title = document.querySelector(".read_title");
	$(document).ready(function () {
          title.setAttribute("data-content", "No."+<%=comm.getComm_num()%>);
    });
	
	$("#selectedFileListWrap").hide();
	$(document).ready(function(){
	    $('input[type="file"]').change(function(e){
	    	$("#selectedFileListWrap").show();
	    	const input = document.querySelector('#file');
	    	const selectedFiles = input.files;
			var cnt = 1;
			var Parent = document.getElementById("selectedFileList");
			while(Parent.hasChildNodes()){
				Parent.removeChild(Parent.firstChild);		
			}

	    	for(const file of selectedFiles) {
	    		var tableData = document.getElementById("selectedFileList");
	    		var row = tableData.insertRow(tableData.rows.length);
	    		var cell = row.insertCell(0);
	        	cell.innerHTML = "÷������ " + cnt + " <input type='text' readonly value='"+file.name+"'>";
	       		cnt++;
	    	}
	    });
	});
</script>

</html>