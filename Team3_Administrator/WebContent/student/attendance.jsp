<%@page import="bean.StudentBean"%>
<%@page import="bean.AttendBean"%>
<%@page import="bean.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="stuQuery" class="db.StudentQuery"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="../css/common.css" />
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <style>
      .stu_info {
        margin: 10px;
      }
      .attend_info {
        margin: 10px;
      }

      .detail_search {
        margin: 10px 0;
      }
      .class_list {
        display: inline-block;
        width: 600px;
        height: 100px;
      }

      .attend_list {
        display: inline-block;
        width: 500px;
        height: 100px;
      }
      .class_item:hover {
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="title">과목 출결조회</div>
    <form class="search" action="searchClass.jsp">
      <span>조회할 학번</span> : <input type="text" name="stuNumber" />
      <input type="submit" value="검색"/>
      <input type="hidden" value="3" name="num"/>
    </form>
    <%
    	StudentBean s = null;
    	if(request.getParameter("searchStudent_result") != null){
    		int stu_id = Integer.parseInt(request.getParameter("id"));
    		s = stuQuery.getStudent(stu_id);
    %>
    <div class="stu_info">
      <table class="border_table_1000">
        <tr>
          <td class="table_col">학번</td>
          <td class="table_data"><%=s.getStu_id()%></td>
          <td class="table_col">성명</td>
          <td class="table_data"><%=s.getStu_name()%></td>
          <td class="table_col">학년</td>
          <td class="table_data"><%=s.getStu_grade()%></td>
        </tr>
        <tr>
          <td class="table_col">학부</td>
          <td class="table_data"><%=s.getStu_department()%></td>
          <td class="table_col">전공</td>
          <td class="table_data"><%=s.getStu_major()%></td>
          <td class="table_col">학적상태</td>
          <td class="table_data"><%=s.getStu_state()%></td>
        </tr>
      </table>
    </div>

    <div class="attend_info">
      <div class="detail_search">
        년도 : <select name="year">
        <%
        	ArrayList<Integer> yearArr = stuQuery.getYear(stu_id);
        	for(int i=0; i<yearArr.size(); i++){
        		out.println("<option value='"+yearArr.get(i)+"'>"+yearArr.get(i)+"</option>");
        	}
        %></select>
		학기 : <select name="semester">
          <option value="1" selected>1학기</option>
          <option value="2">2학기</option>
        </select>	
        <input type="button" value="조회" onclick="getClassInfo(<%=stu_id%>)"/>
      </div>
      <div class="class_list">
        <table class="border_table_600">
          <thead>
            <td>이수구분</td>
            <td>교과목번호</td>
            <td>교과목명</td>
            <td>학점</td>
            <td>담당교수</td>
          </thead>
          <tbody id="tableId">
			<form action='searchClass.jsp' id="test" name='classRow' >
	<%
	 // 수업리스트 출력
		if(request.getParameter("searchClass_result") != null){
			ArrayList<ClassBean> classBean = null;
			int id = Integer.parseInt(request.getParameter("id"));
			int year = Integer.parseInt(request.getParameter("year"));
			int semester = Integer.parseInt(request.getParameter("semester"));
			classBean = stuQuery.getClassInfo(id, year, semester);
			for(int i=0; i<classBean.size(); i++){
				int subjCode = classBean.get(i).getSubjCode();		
	%>
			<tr class="class_item" onclick="HighlightRow(this, '<%=id%>', '<%=year%>', '<%=semester%>', '<%=subjCode%>')">
              <td><%=classBean.get(i).getSubjState()%></td>
              <td><%=subjCode%></td>
              <td><%=classBean.get(i).getSubjName()%></td>
              <td><%=classBean.get(i).getSubjHakjum()%></td>
              <td><%=classBean.get(i).getProName()%></td>
            </tr>
	<%
			}
		}	
	%>
			</form>
          </tbody>
        </table>
      </div>
      <div class="attend_list">
        <table class="border_table_600">
          <thead>
            <td>일자</td>
            <td>시간</td>
            <td>출결내용</td>
            <td>비고</td>
          </thead>
          <tbody>
	<%
		// 출석리스트 출력
		if(request.getParameter("searchAttend_result") != null){
			int id = Integer.parseInt(request.getParameter("id"));
			int year = Integer.parseInt(request.getParameter("year"));
			int semester = Integer.parseInt(request.getParameter("semester"));
			int subjCode = Integer.parseInt(request.getParameter("subjCode"));
			
			int cnt_atd = 0;
			int cnt_abs = 0;
			int cnt_lat = 0;
			int cnt_erl = 0;
			
			ArrayList<AttendBean> attendBean = stuQuery.getAttendInfo(id, year, semester, subjCode);
			for(int i=0; i<attendBean.size(); i++){
				String state = attendBean.get(i).getAtt_state();
				if(state.equals("출석"))
					cnt_atd++;
				else if(state.equals("결석"))
					cnt_abs++;
				else if(state.equals("지각"))
					cnt_lat++;
				else if(state.equals("조퇴"))
					cnt_erl++;
	%>
			<tr class="class_item">
              <td><%=attendBean.get(i).getAtt_date()%></td>
              <td><%=attendBean.get(i).getAtt_state()%></td>
              <td></td>
              <td></td>
            </tr>
		<%}%>
          </tbody>
        </table>
        <table class="border_table_600" style="margin-top: 10px">
          <tfoot>
            <tr>
              <td class="table_col_100">출석</td>
              <td class="table_col_50"><%=cnt_atd %></td>
              <td class="table_col_100">결석</td>
              <td class="table_col_50"><%=cnt_abs %></td>
              <td class="table_col_100">지각</td>
              <td class="table_col_50"><%=cnt_lat %></td>
              <td class="table_col_100">조퇴</td>
              <td class="table_col_50"><%=cnt_erl %></td>
            </tr>
          </tfoot>
        </table>
        <%} %>
      </div>
    </div>
    <%} %>
  </body>
  <script>
    
    function HighlightRow(obj, id, year, semester, subjCode) {
 		var table = document.getElementById("tableId");
	      var tr = table.getElementsByTagName("tr");
	      for (var i = 0; i < tr.length; i++) {
	        tr[i].style.background = "white";
	      }
	      obj.style.backgroundColor = "#FCE6E0";
	      getClassInfo(id);
	      location.href='searchClass.jsp?num=2&id='+id +'&year='+year+'&semester='+semester+'&subjCode='+subjCode;   	
    }
    
    function getClassInfo(id){
    	var year = $("select[name=year]").val();
    	var semester = $("select[name=semester]").val();
    	location.href='searchClass.jsp?num=1&id='+id +'&year='+year+'&semester='+semester;
    }
    
  </script>
</html>
