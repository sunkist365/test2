<%@page import="bean.DepartmentBean"%>
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
	<style>
		form{
			margin:10px;
		}
		
		tbody td:nth-child(2) {
			text-align: left;
			padding-left: 10px;
		}

		.number{
			width: 40px;
		}
	</style>
</head>
<body>
	  <div class="title">�������</div>
	  <%
	  ArrayList<DepartmentBean> majorList = subQuery.getDepartmentList();
	  %>
	  <div>
	  	<div>
	  		<form action="subjectEnroll_ok.jsp">
		  		<table>
		  		<tbody>
		  			<tr>
		  				<td>�����ڵ�</td>
		  				<td><input type="text" name="subj_code"></td>
		  			<tr>
		  			<tr>
		  				<td>�̼�����</td>
		  				<td>
			  				<select style="width: 100%" name="subj_state">
				  				<option value="�����ʼ�">�����ʼ�</option>
				  				<option value="��������">��������</option>
				  				<option value="������å">������å</option>
				  				<option value="����">����</option>
			  				</select>
		  				</td>
		  				<td></td>
		  			<tr>
		  			<tr>
		  				<td>�������</td>
		  				<td><input type="text" name="subj_name"></td>
		  				<td></td>
		  			<tr>
		  			<tr>
		  				<td>����</td>
		  				<td><input type="text" name="subj_hakjum"></td>
		  				<td></td>
		  			<tr>
		  			<tr>
		  				<td>�������</td>
		  				<td><input type="text" name="subj_room"></td>
		  				<td></td>
		  			<tr>
		  			<tr>
		  				<td>��米��</td>
		  				<td><input type="text" name="stu_pro" id="stu_pro" readonly="readonly"></td>
		  				<td><input type="button" value="�˻�" name="search" onclick="searchPro()"></td>
		  			<tr>
		  			<tr>
		  				<td>��������а�</td>
		  				<td><input type="text" name="stu_major" id="stu_major" readonly="readonly"></td>
		  				<td></td>
		  			<tr>
		  			<tr id="day1">
		  				<td>���� 
			  				<select name="day1_day">
			  					<option value="��">��</option>	
			  					<option value="ȭ">ȭ</option>	
			  					<option value="��">��</option>	
			  					<option value="��">��</option>	
			  					<option value="��">��</option>	
			  				</select>
			  			</td>
						<td>���� <input type="text" maxlength="1" class="number" name="day1_stime">~<input type="text" maxlength="1" class="number" name="day1_etime"></td>
		  				<td><input id="showBtn" type="button" value="+" style="width:100%" id="showBtn" onclick="dayShow()"></td>
		  			<tr>
		  			<tr id="day2" style="display:none;">
		  				<td>���� 
			  				<select name="day2_day">
			  					<option value="��">��</option>	
			  					<option value="ȭ">ȭ</option>	
			  					<option value="��">��</option>	
			  					<option value="��">��</option>	
			  					<option value="��">��</option>
			  				</select>
			  			</td>
						<td>���� <input type="text" maxlength="1" class="number" name="day2_stime">~<input type="text" maxlength="1" class="number" name="day2_etime"></td>
		  				<td><input type="button" value="-" style="width:100%" id="hideBtn" onclick="dayHide()"></td>
		  			<tr>
		  			</tbody>
		  			<tr>
		  				<td colspan="2" align="right">
		  					<input type="submit" value="�Ϸ�">
		  					<input type="reset" value="���ۼ�">
		  				<td>
		  				<td></td>
		  			<tr>
		  		</table>
		  		<input type="hidden" name="stu_majorCode" id="stu_majorCode">
				<input type="hidden" name="stu_proId" id="stu_proId">
				<input type="hidden" name="stu_proId" id="stu_department">
	  		</form>
	  	</div>
	  </div>
</body>
<script>

function searchPro(){
    var options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
    window.open('../student/searchProfessor.jsp', '������ �˻�', options);
}

function dayShow(){
	$("#day2").show();
	$("#showBtn").hide();
	
}

function dayHide(){
	$("#day2").hide();
	$("#showBtn").show();	
}
</script>
</html>