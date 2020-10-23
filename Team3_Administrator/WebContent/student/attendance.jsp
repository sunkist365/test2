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
    <div class="title">���� �����ȸ</div>
    <form class="search" action="searchClass.jsp">
      <span>��ȸ�� �й�</span> : <input type="text" name="stuNumber" />
      <input type="submit" value="�˻�"/>
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
          <td class="table_col">�й�</td>
          <td class="table_data"><%=s.getStu_id()%></td>
          <td class="table_col">����</td>
          <td class="table_data"><%=s.getStu_name()%></td>
          <td class="table_col">�г�</td>
          <td class="table_data"><%=s.getStu_grade()%></td>
        </tr>
        <tr>
          <td class="table_col">�к�</td>
          <td class="table_data"><%=s.getStu_department()%></td>
          <td class="table_col">����</td>
          <td class="table_data"><%=s.getStu_major()%></td>
          <td class="table_col">��������</td>
          <td class="table_data"><%=s.getStu_state()%></td>
        </tr>
      </table>
    </div>

    <div class="attend_info">
      <div class="detail_search">
        �⵵ : <select name="year">
        <%
        	ArrayList<Integer> yearArr = stuQuery.getYear(stu_id);
        	for(int i=0; i<yearArr.size(); i++){
        		out.println("<option value='"+yearArr.get(i)+"'>"+yearArr.get(i)+"</option>");
        	}
        %></select>
		�б� : <select name="semester">
          <option value="1" selected>1�б�</option>
          <option value="2">2�б�</option>
        </select>	
        <input type="button" value="��ȸ" onclick="getClassInfo(<%=stu_id%>)"/>
      </div>
      <div class="class_list">
        <table class="border_table_600">
          <thead>
            <td>�̼�����</td>
            <td>�������ȣ</td>
            <td>�������</td>
            <td>����</td>
            <td>��米��</td>
          </thead>
          <tbody id="tableId">
			<form action='searchClass.jsp' id="test" name='classRow' >
	<%
	 // ��������Ʈ ���
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
            <td>����</td>
            <td>�ð�</td>
            <td>��᳻��</td>
            <td>���</td>
          </thead>
          <tbody>
	<%
		// �⼮����Ʈ ���
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
				if(state.equals("�⼮"))
					cnt_atd++;
				else if(state.equals("�Ἦ"))
					cnt_abs++;
				else if(state.equals("����"))
					cnt_lat++;
				else if(state.equals("����"))
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
              <td class="table_col_100">�⼮</td>
              <td class="table_col_50"><%=cnt_atd %></td>
              <td class="table_col_100">�Ἦ</td>
              <td class="table_col_50"><%=cnt_abs %></td>
              <td class="table_col_100">����</td>
              <td class="table_col_50"><%=cnt_lat %></td>
              <td class="table_col_100">����</td>
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
