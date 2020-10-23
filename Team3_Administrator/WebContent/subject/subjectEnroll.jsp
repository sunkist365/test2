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
	  <div class="title">수강등록</div>
	  <%
	  ArrayList<DepartmentBean> majorList = subQuery.getDepartmentList();
	  %>
	  <div>
	  	<div>
	  		<form action="subjectEnroll_ok.jsp">
		  		<table>
		  		<tbody>
		  			<tr>
		  				<td>과목코드</td>
		  				<td><input type="text" name="subj_code"></td>
		  			<tr>
		  			<tr>
		  				<td>이수구분</td>
		  				<td>
			  				<select style="width: 100%" name="subj_state">
				  				<option value="전공필수">전공필수</option>
				  				<option value="전공선택">전공선택</option>
				  				<option value="대학정책">대학정책</option>
				  				<option value="교양">교양</option>
			  				</select>
		  				</td>
		  				<td></td>
		  			<tr>
		  			<tr>
		  				<td>교과목명</td>
		  				<td><input type="text" name="subj_name"></td>
		  				<td></td>
		  			<tr>
		  			<tr>
		  				<td>학점</td>
		  				<td><input type="text" name="subj_hakjum"></td>
		  				<td></td>
		  			<tr>
		  			<tr>
		  				<td>수업장소</td>
		  				<td><input type="text" name="subj_room"></td>
		  				<td></td>
		  			<tr>
		  			<tr>
		  				<td>담당교수</td>
		  				<td><input type="text" name="stu_pro" id="stu_pro" readonly="readonly"></td>
		  				<td><input type="button" value="검색" name="search" onclick="searchPro()"></td>
		  			<tr>
		  			<tr>
		  				<td>수강대상학과</td>
		  				<td><input type="text" name="stu_major" id="stu_major" readonly="readonly"></td>
		  				<td></td>
		  			<tr>
		  			<tr id="day1">
		  				<td>요일 
			  				<select name="day1_day">
			  					<option value="월">월</option>	
			  					<option value="화">화</option>	
			  					<option value="수">수</option>	
			  					<option value="목">목</option>	
			  					<option value="금">금</option>	
			  				</select>
			  			</td>
						<td>교시 <input type="text" maxlength="1" class="number" name="day1_stime">~<input type="text" maxlength="1" class="number" name="day1_etime"></td>
		  				<td><input id="showBtn" type="button" value="+" style="width:100%" id="showBtn" onclick="dayShow()"></td>
		  			<tr>
		  			<tr id="day2" style="display:none;">
		  				<td>요일 
			  				<select name="day2_day">
			  					<option value="월">월</option>	
			  					<option value="화">화</option>	
			  					<option value="수">수</option>	
			  					<option value="목">목</option>	
			  					<option value="금">금</option>
			  				</select>
			  			</td>
						<td>교시 <input type="text" maxlength="1" class="number" name="day2_stime">~<input type="text" maxlength="1" class="number" name="day2_etime"></td>
		  				<td><input type="button" value="-" style="width:100%" id="hideBtn" onclick="dayHide()"></td>
		  			<tr>
		  			</tbody>
		  			<tr>
		  				<td colspan="2" align="right">
		  					<input type="submit" value="완료">
		  					<input type="reset" value="재작성">
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
    window.open('../student/searchProfessor.jsp', '교수님 검색', options);
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