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
  	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/board.css">
</head>
<body>
	<%
		CommunityBean comm = null;
		int index = 0;
		int comm_index = 0, comm_num = 0;
		int groupn = 0;
		int ref=1, step=0, level=0;
		if(request.getParameter("index") != null){ // 답글
			index = Integer.parseInt(request.getParameter("index"));
			comm = commQuery.getCommunity().get(index);
			groupn = comm.getComm_groupN();
			if(groupn == 1){
				out.println("<div class='title'>자유게시판 - 답글</div>");
			}else if(groupn == 2 || groupn == 3){
				out.println("<div class='title'>학사관련문의 - 답글</div>");		
			}
			comm_index = comm.getComm_index();
			comm_num = comm.getComm_num();
			ref = comm.getComm_ref();
			step = comm.getComm_step();
			level = comm.getComm_level();
		}else{ // 학사공지 글쓰기
			out.println("<div class='title'>학사공지 - 글작성</div>");
			groupn = 4;
		}
	%>
    <form action="write_ok.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="comm_index" value="<%=comm_index%>">
		<input type="hidden" name="comm_num" value="<%=comm_num%>">
		<input type="hidden" name="groupn" value="<%=groupn%>">
		<input type="hidden" name="ref" value="<%=ref%>">
		<input type="hidden" name="step" value="<%=step%>">
		<input type="hidden" name="level" value="<%=level%>">
		<div class="write-content">
        	<%if(comm != null){ %>
            <input type="text" placeholder="제목을 입력해주세요" name="title" value="[Re]<%=comm.getComm_title()%>">
			<%}else{ %>
            <input type="text" placeholder="제목을 입력해주세요" name="title">
            <%}%>
            <input type="file" id="file" name="uploads" multiple/>
            <div id="selectedFileListWrap">
	            <table id="selectedFileList">
				</table>
			</div>
            <textarea placeholder="내용을 입력해주세요" name="content" class="write_textarea"></textarea>
        </div>
        <div class="write-btn">
            <input type="submit" value="완료">
            <input type="reset"" value="다시쓰기">
            <input type="button" value="취소" onclick="history.back()">
        </div>
    </form>
</body>
<script>
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
        	cell.innerHTML = "첨부파일 " + cnt + " <input type='text' readonly value='"+file.name+"'>";
       		cnt++;
    	}
    });
});
</script>
</html>