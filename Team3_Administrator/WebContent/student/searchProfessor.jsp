<%@page import="bean.ProfessorBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="proQuery" class="db.ProfessorQuery"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Search Professor</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" href="../css/pro_stu.css" />
<style>
	table {
		border-collapse: collapse;
		width: calc(100% - 20px);
		margin:10px;
		max-height: 400px;
	}
	tr {
		border-top: 2px solid #ccc;
		border-bottom: 2px solid #ccc;
	}
	td {
		text-align: left;
		padding: 5px;
	}
</style>	<%// width=500, height=600 %>
</head>
<body>
	<div class="title">교직원 검색</div>
	
	<form name="form">
		<input type="text" placeholder="이름으로 검색" name="name" class="searchPro-input">
	</form>
	<div class="searchTable-wrap">
		<table id="list" class="searchTable">
		<%
			if(request.getParameter("name") != null){
				ArrayList<ProfessorBean> p = proQuery.getProfessor(request.getParameter("name"));
				if(p.size() != 0){
					for(int i=0; i<p.size(); i++){
						int pid = p.get(i).getPro_id();
						String pname = p.get(i).getPro_name();
						String department = p.get(i).getPro_department();
						String major = p.get(i).getPro_major();
						int dcode = p.get(i).getPro_departmentCode();
						int mcode = p.get(i).getPro_majorCode();
						out.println("<tr onclick=\"selectPro(\'"+i+"\', \'"+pname+"\', \'"+department+"\', \'"+major+"\', \'"+mcode+"\', \'"+pid+"\')\">");						
						out.println("<td><img style='width:70px; height:90px;' src='../util/image_read.jsp?group=1&id="+pid+"' onerror=\"this.src=\'../img/noimg.png\'\"></td>");
						out.println("<td><p>[" + pid + "] " + pname + "</p>");
						out.println("<p>" + department + ", " + major + "</p></td>");
						out.println("</tr>");
					}
				}else{
					out.println("<tr><td style='padding:20px 0; cursor:default;'><h4 style='text-align:center;'>존재하지 않는 이름입니다.</h4></td></tr>");
				}
		%>
		</table>
		
	</div>
	<div class="search_btn">
		<input type="button" value="선택" onclick="setValue()">
		<input type="button" value="취소" onclick="javascript:window.close()">
	</div>
		<%
			}
		%>
</body>
<script>
var setName;
var setDept;
var setMajor;

$("#list").on("click", "tr", function(e) {     
    $(this)
    .toggleClass("selected")
    .siblings(".selected")
    .removeClass("selected");
});
function selectPro(i, name, department, major, mcode, pid){
	setName = name;
	setDept = department;
	setMajor = major;
	opener.document.getElementById("stu_majorCode").value = mcode;
	opener.document.getElementById("stu_proId").value =	pid;
}

function setValue(){
	opener.document.getElementById("stu_pro").value = setName;
	opener.document.getElementById("stu_department").value = setDept;
	opener.document.getElementById("stu_major").value = setMajor;
	window.close();
}

</script>
</html>