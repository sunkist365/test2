<%@page import="bean.SubjectBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="subQuery" class="db.SubjectQuery"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/common.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<div class="title">수강목록조회</div>
	<form class="search" action="subjectSearch.jsp" name="subjSearch">
		<span>전공별 수강 조회</span> : 
		<input type="text" name="majorName" /> 
		<input type="button" value="검색" onclick="document.subjSearch.submit()"/>
		<input type="button" value="전체조회" onclick="location.href='subjectList.jsp'"/>
	</form>
	<div style="margin:10px;">
		전체선택 <input type="checkbox" class="check-all"> <input type="button" value="삭제" id="deleteBtn" onclick="deleteSubject()"> 
	</div>
    <div class="list" style="margin:10px;">
		<table class="border_table_1000">
			<thead>
				<td>선택</td>
				<td>과목코드</td>	
				<td>이수구분</td>
				<td>수강대상학과</td>
				<td>교과목명</td>
				<td>학점</td>
				<td>수업장소</td>
				<td>담당교수</td>
			</thead>
			<tbody id="list">
				<%
        	ArrayList<SubjectBean> subject = null;
			if(request.getParameter("majorName") != null){
				subject = subQuery.getSubjectList(request.getParameter("majorName"));
			}else{
				subject = subQuery.getSubjectList("");
			}
			for(int i=0; i<subject.size(); i++){
				int subj_code = subject.get(i).getSubj_code();
				String subj_state = subject.get(i).getSubj_state();
				String subj_majorname = subject.get(i).getSubj_majorname();
				String subj_name = subject.get(i).getSubj_name();
				int subj_hakjum = subject.get(i).getSubj_hakjum();
				String subj_proname = subject.get(i).getSubj_proname();
				String subj_room = subject.get(i).getSubj_room();
				out.println("<tr>");
				out.println("<td><input type='checkbox' name='ch' value="+subj_code+"></td>");				
				out.println("<td>"+subj_code+"</td>");
				out.println("<td>"+subj_state+"</td>");
				out.println("<td>"+subj_majorname+"</td>");
				out.println("<td>"+subj_name+"</td>");
				out.println("<td>"+subj_hakjum+"</td>");
				out.println("<td>"+subj_proname+"</td>");
				out.println("<td>"+subj_room+"</td>");
				out.println("</tr>");
			}
        %>
			</tbody>
		</table>
	</div>
</body>
<script>
$(document).ready( function() {
    $('.check-all').click( function() {
        $('input[name=ch]').prop('checked', this.checked);
    });
});

function deleteSubject(){ /*게시글 삭제*/
    var arr = $('input[name=ch]:checked').serializeArray().map(function(item) { return item.value });
    if(confirm('삭제하시겠습니까?')){
        if(arr.length != 0){
            for(var i=$("[name='ch']:checked").length-1; i>-1; i--){ 
                $("[name='ch']:checked").eq(i).closest("tr").remove(); 
            }
            location.href="delete.jsp?index=" + arr;
        }else{
            alert('선택된 게시글이 없습니다.');
        }
    }
    $('.check-all').prop('checked', false);
}
</script>
</html>