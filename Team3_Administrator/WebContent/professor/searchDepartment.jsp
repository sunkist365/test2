<%@page import="bean.DepartmentBean"%>
<%@page import="bean.ProfessorBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="deptQuery" class="db.ProfessorQuery"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Search Department</title>
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
	<div class="title">교수등록</div>
	
	<form name="form">
		<input type="text" placeholder="전공으로 검색" name="name" class="searchPro-input">
	</form>
	<div class="searchTable-wrap">
		<table id="list" class="searchTable">
		<%
			if(request.getParameter("name") != null){
				ArrayList<DepartmentBean> d = deptQuery.getDepartment(request.getParameter("name"));
				if(d.size() != 0){
					for(int i=0; i<d.size(); i++){
						int dcode = d.get(i).getDept_code();
						String department = d.get(i).getDept_name();
						int mcode = d.get(i).getMajor_code();
						String major =d.get(i).getMajor_name();
						out.println("<tr onclick=\"selectPro(\'"+dcode+"\', \'"+department+"\', \'"+mcode+"\', \'"+major+"\')\">");						
						out.println("<td><p>[" + mcode+ "] " + department + ", " + major + "</p>");
						out.println("</tr>");
					}
				}else{
					out.println("<tr><td style='padding:20px 0; cursor:default;'><h4 style='text-align:center;'>잘못된 전공명입니다.</h4></td></tr>");
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
var setDept;
var setMajor;

$("#list").on("click", "tr", function(e) {     
    $(this)
    .toggleClass("selected")
    .siblings(".selected")
    .removeClass("selected");
});
function selectPro(dcode, department, mcode, major){
	setDept = department;
	setMajor = major;
	opener.document.getElementById("pro_majorCode").value = mcode;
}

function setValue(){
	opener.document.getElementById("pro_department").value = setDept;
	opener.document.getElementById("pro_major").value = setMajor;
	window.close();
}

</script>
</html>