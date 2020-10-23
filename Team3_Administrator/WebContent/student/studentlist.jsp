<%@page import="bean.StudentBean"%>
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
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="../css/common.css" />
    <link rel="stylesheet" href="../css/pro_stu.css" />
  </head>
  <body>
    <div class="title">�л���ϰ���(��ȸ/����)</div>
    <form class="search" action="searchStudent.jsp" name="stuSearch">
      <span>��ȸ�� �й�</span> : <input type="text" name="stuID" />
      <input type="button" value="�˻�" onclick="document.stuSearch.submit()"/>
      <input type="button" onclick="location.href='studentlist.jsp'" value="��ü��ȸ"/>
    </form>
    <div class="list">
      <table class="border_table_1000">
        <thead>
          <td>�й�</td>
          <td>�̸�</td>
          <td>�ֹε�Ϲ�ȣ</td>
          <td>�Ҽ��к�</td>
          <td>�Ҽ��а�</td>
          <td>�г�</td>
          <td>��������</td>
          <td>��������</td>
        </thead>
        <tbody id="list">
        <%	
	        ArrayList<StudentBean> student = null;
        	if(request.getParameter("stuID") != null)
        		student = stuQuery.getStudentList(request.getParameter("stuID"));
        	else
        		student = stuQuery.getStudentList("");
        		
			for(int i=0; i<student.size(); i++){
				int stuId = student.get(i).getStu_id();
				String stuName = student.get(i).getStu_name();
				String stuJumin = student.get(i).getStu_jumin();
				String stuDept = student.get(i).getStu_department();
				String stuMajor = student.get(i).getStu_major();
				int stuGrade = student.get(i).getStu_grade();
				String stuPro = student.get(i).getStu_pro();
				int stateI = student.get(i).getStu_state();
				String stuState = stateI == 1 ? "����" : stateI == 2 ? "����" : stateI == 3 ? "����" : "����";
				/* basic info */
				String stuTel = student.get(i).getStu_tel();
				String stuEmgtel = student.get(i).getStu_emgTel();
				String stuAddr = student.get(i).getStu_addr();
				String stuEmail = student.get(i).getStu_email();
				
				out.println("<tr onclick=\"showinfo('"+stuId+"', '"+stuName+"', '"+ stuJumin+"', '"+stuDept+"','"+stuMajor+"', '"+stuGrade+"', '"+stuPro+"', '"+stuState+"','"+stuTel+"','"+stuEmgtel+"','"+stuAddr+"','"+stuEmail+"')\";>");
				out.println("<td>"+stuId+"</td>");
				out.println("<td>"+stuName+"</td>");
				out.println("<td>"+stuJumin+"</td>");
				out.println("<td>"+stuDept+"</td>");
				out.println("<td>"+stuMajor+"</td>");
				out.println("<td>"+stuGrade+"</td>");
				out.println("<td>"+stuPro+"</td>");
				out.println("<td>"+ stuState +"</td>");
				out.println("</tr>");
			}
        %>
        </tbody>
      </table>
    </div>
    <div class="detail_info">
      <table class="detail_info_table">
        <tr>
          <td rowspan="8" style="width: 140px; height: 192px; padding-left: 0;"><img id="img" src="" style="width:100%; height:192px;" onerror="this.src='../img/noimg.png';"></td>
          <td>�й�</td>
          <td id="stuId"></td>
        </tr>
        <tr>
          <td>�̸�</td>
          <td id="stuName"></td>
        </tr>
        <tr>
          <td>�ֹε�Ϲ�ȣ</td>
          <td id="stuJumin"></td>
        </tr>
        <tr>
          <td>�Ҽ��к�</td>
          <td id="stuDept"></td>
        </tr>
        <tr>
          <td>�Ҽ��а�</td>
          <td id="stuMajor"></td>
        </tr>
        <tr>
          <td>�г�</td>
          <td id="stuGrade"></td>
        </tr>
        <tr>
          <td>��������</td>
          <td id="stuPro"></td>
        </tr>	
        <tr>
          <td>��������</td>
          <td id="stuState"></td>
        </tr>
        <tr>
          <td>����ó</td>
          <td colspan="2" id="stuTel"></td>
        </tr>
        <tr>
          <td>��󿬶�ó</td>
          <td colspan="2" id="stuEmgtel"></td>
        </tr>
        <tr>
          <td>�ּ�</td>
          <td colspan="2" id="stuAddr"></td>
        </tr>
        <tr>
          <td>�����ּ�</td>
          <td colspan="2" id="stuEmail"></td>
        </tr>
      </table>
    </div>
  </body>
  <script>
	  $("#list").on("click", "tr", function(e) {     
	      $(this)
	      .toggleClass("selected")
	      .siblings(".selected")
	      .removeClass("selected");
	  });
	  
	  function showinfo(stuid, name, jumin, dept, major, grade, pro, state, tel, emgTel, addr, email){
		  document.getElementById("stuId").innerHTML = stuid;
		  document.getElementById("stuName").innerHTML = name;
		  document.getElementById("stuJumin").innerHTML = jumin;
		  document.getElementById("stuDept").innerHTML = dept;
		  document.getElementById("stuMajor").innerHTML = major;
		  document.getElementById("stuGrade").innerHTML = grade;
		  document.getElementById("stuPro").innerHTML = pro;
		  document.getElementById("stuState").innerHTML = state;
		  document.getElementById("stuTel").innerHTML = tel;
		  document.getElementById("stuEmgtel").innerHTML = emgTel;
		  document.getElementById("stuAddr").innerHTML = addr;
		  document.getElementById("stuEmail").innerHTML = email;
		  document.getElementById("img").src = "../util/image_read.jsp?group=2&id=" + stuid;
	  }
  </script>
</html>
