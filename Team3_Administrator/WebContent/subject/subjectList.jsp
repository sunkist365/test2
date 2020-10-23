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
	<div class="title">���������ȸ</div>
	<form class="search" action="subjectSearch.jsp" name="subjSearch">
		<span>������ ���� ��ȸ</span> : 
		<input type="text" name="majorName" /> 
		<input type="button" value="�˻�" onclick="document.subjSearch.submit()"/>
		<input type="button" value="��ü��ȸ" onclick="location.href='subjectList.jsp'"/>
	</form>
	<div style="margin:10px;">
		��ü���� <input type="checkbox" class="check-all"> <input type="button" value="����" id="deleteBtn" onclick="deleteSubject()"> 
	</div>
    <div class="list" style="margin:10px;">
		<table class="border_table_1000">
			<thead>
				<td>����</td>
				<td>�����ڵ�</td>	
				<td>�̼�����</td>
				<td>��������а�</td>
				<td>�������</td>
				<td>����</td>
				<td>�������</td>
				<td>��米��</td>
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

function deleteSubject(){ /*�Խñ� ����*/
    var arr = $('input[name=ch]:checked').serializeArray().map(function(item) { return item.value });
    if(confirm('�����Ͻðڽ��ϱ�?')){
        if(arr.length != 0){
            for(var i=$("[name='ch']:checked").length-1; i>-1; i--){ 
                $("[name='ch']:checked").eq(i).closest("tr").remove(); 
            }
            location.href="delete.jsp?index=" + arr;
        }else{
            alert('���õ� �Խñ��� �����ϴ�.');
        }
    }
    $('.check-all').prop('checked', false);
}
</script>
</html>