<%@page import="bean.ProfessorBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="proQuery" class="db.ProfessorQuery"></jsp:useBean>
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
    <div class="title">교수목록관리(조회/수정)</div>
    <form class="search" action="searchProfessor.jsp" name="proSearch">
      <span>조회할 교수번호</span> : <input type="text" name="proID" />
      <input type="button" value="검색" onclick="document.proSearch.submit();"/>
      <input type="button" onclick="location.href='professorlist.jsp'" value="전체조회"/>
    </form>
    <div class="list">
      <table class="border_table_1000">
        <thead>
          <td>교수번호</td>
          <td>이름</td>
          <td>주민등록번호</td>
          <td>소속학부</td>
          <td>소속학과</td>
          <td>이메일</td>
        </thead>
        <tbody id="list">
        <%
        	ArrayList<ProfessorBean> professor = null;
        	if(request.getParameter("proID") != null)
		        professor = proQuery.getProfessorList(request.getParameter("proID"));
        	else
        		professor = proQuery.getProfessorList("");        		
			for(int i=0; i<professor.size(); i++){
				int proId = professor.get(i).getPro_id();
				String proName = professor.get(i).getPro_name();
				String proJumin = professor.get(i).getPro_jumin();
				String proDepartment = professor.get(i).getPro_department();
				String proMajor = professor.get(i).getPro_major();
				/* basic info */
				String proTel = professor.get(i).getPro_tel();
				String proAddr = professor.get(i).getPro_addr();
				String proEmail = professor.get(i).getPro_email();
				
				out.println("<tr onclick=\"showinfo('"+proId+"', '"+proName+"', '"+ proJumin+"', '"+proDepartment+"', '"+proMajor+"', '"+proTel+"','"+proAddr+"','"+proEmail+"')\";>");
				out.println("<td>"+proId+"</td>");
				out.println("<td>"+proName+"</td>");
				out.println("<td>"+proJumin+"</td>");
				out.println("<td>"+proDepartment+"</td>");
				out.println("<td>"+proMajor+"</td>");
				out.println("<td>"+proEmail+"</td>");
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
          <td style="width:140px;">교수번호</td>
          <td id="proId"></td>
        </tr>
        <tr>
          <td>이름</td>
          <td id="proName"></td>
        </tr>
        <tr>
          <td>주민등록번호</td>
          <td id="proJumin"></td>
        </tr>
        <tr>
          <td>소속학부</td>
          <td id="proDepartment"></td>
        </tr>
        <tr>
          <td>소속학과</td>
          <td id="proMajor"></td>
        </tr>
        <tr>
          <td>연락처</td>
          <td id="proTel"></td>
        </tr>
        <tr>
          <td>주소</td>
          <td id="proAddr"></td>
        </tr>
        <tr>
          <td>메일주소</td>
          <td id="proEmail"></td>
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
	  
	  function showinfo(proid, name, jumin, department, major, tel, addr, email){
		  document.getElementById("proId").innerHTML = proid;
		  document.getElementById("proName").innerHTML = name;
		  document.getElementById("proJumin").innerHTML = jumin;
		  document.getElementById("proDepartment").innerHTML = department;
		  document.getElementById("proMajor").innerHTML = major;
		  document.getElementById("proTel").innerHTML = tel;
		  document.getElementById("proAddr").innerHTML = addr;
		  document.getElementById("proEmail").innerHTML = email;
		  document.getElementById("img").src = "../util/image_read.jsp?group=1&id=" + proid;
	  }
  </script>
</html>
