<%@page import="bean.StudentBean"%>
<%@page import="bean.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="stuQuery" class="db.StudentQuery"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/common.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <style>
        .stu_info{
             margin: 10px;
         } 
         .detail_search{
            margin: 10px;
        }
        .total_grade{
        	margin:10px;
        }
        .score_table{
        	height:300px;
        	overflow: auto;
        }
    </style>
</head>
<body>
    <div class="title">������ȸ</div>
   
    <form class="search" action="searchScore.jsp">
      <span>��ȸ�� �й�</span> : <input type="text" name="stuNumber" />
      <input type="submit" value="�˻�"/>
      <input type="hidden" value="3" name="num"/>
    </form>
    <div class="stu_info">
    <%
    	StudentBean s = null;
    	if(request.getParameter("searchStudent_result") != null){
    		int stu_id = Integer.parseInt(request.getParameter("id"));
    		s = stuQuery.getStudent(stu_id);
    		int totalAcquired = 0;
    		int totalHakjum = 0;
    		double totalAvg = 0;
    		double totalPercentage = 0; 
    		
    		int currentAcquired = 0;
    		int currentTotal = 0;
    		double currentAvg = 0;
    		double currentPercentage = 0;
    		
    		ArrayList<ClassBean> totalGrade = stuQuery.getTotalScore(stu_id);
    		for(int i=0; i<totalGrade.size(); i++){
    			totalAcquired += totalGrade.get(i).getAcquired();
				totalHakjum += totalGrade.get(i).getTotal();
				totalAvg += totalGrade.get(i).getAvg();
				totalPercentage += totalGrade.get(i).getPercentage();
    		}
    		totalAvg = totalAvg/totalGrade.size();
    		totalPercentage = totalPercentage/totalGrade.size();

    %>
        <table  class="border_table_1000">
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
    <div style="margin: 10px;">
        <table  class="border_table_1000">
            <tr>
                <td class="table_col">�� ��û����</td>
                <td><%=totalHakjum %></td>
                <td class="table_col">�� �������</td>
                <td><%=totalAcquired %></td>
                <td class="table_col">�� �������</td>
                <td><%=String.format("%.2f", totalAvg)%></td>
                <td class="table_col">�� �����</td>
                <td><%=String.format("%.2f", totalPercentage) %></td>
            </tr>
        </table>
    </div>
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
        <input type="button" value="��ȸ" onclick="getClassInfo(<%=stu_id%>)">
    </div>
    <div class="search_grade" style="height: 400px; margin:10px;">
    	<%
		if(request.getParameter("searchClass_result") != null){ 
			ArrayList<ClassBean> classBean = null;
			int id = Integer.parseInt(request.getParameter("id"));
			int year = Integer.parseInt(request.getParameter("year"));
			int semester = Integer.parseInt(request.getParameter("semester"));
			classBean = stuQuery.getGradeInfo(id, year, semester);
	%>
        <p>�� <%=year %>�⵵ <%=semester %>�б� ����</p>
        <div class="score_table">
        <table class="border_table_1000">
            <thead>
                <td>No.</td>
                <td>�⵵</td>
                <td>�б�</td>
                <td>������ȣ</td>
                <td>�������</td>
                <td>�̼�����</td>
                <td>����</td>
                <td>����</td>
            </thead>
            <tbody>
	<%
			for(int i=0; i<classBean.size(); i++){
				double dScore = classBean.get(i).getScScore();
				String score = dScore == 4.5? "A+": dScore == 4? "A": dScore == 3.5? 
						"B+": dScore == 3.0? "B": dScore == 2.5? "C+": dScore == 2.0? "C+": "F";
	%>
				<tr>
                    <td><%=i+1 %></td>
                    <td><%=classBean.get(i).getYear() %></td>
                    <td><%=classBean.get(i).getSemester() %></td>
                    <td><%=classBean.get(i).getSubjCode() %></td>
                    <td><%=classBean.get(i).getSubjName() %></td>
                    <td><%=classBean.get(i).getSubjState() %></td>
                    <td><%=classBean.get(i).getSubjHakjum() %></td>
                    <td><%=score %></td>
                </tr>          
	<%		
			}
			for(int i=0; i<totalGrade.size(); i++){
				if(year == totalGrade.get(i).getYear() && semester == totalGrade.get(i).getSemester()){
					currentAvg = totalGrade.get(i).getAvg();
					currentAcquired = totalGrade.get(i).getAcquired();
					currentTotal = totalGrade.get(i).getTotal();
					currentPercentage = totalGrade.get(i).getPercentage();
				}
			}
	%>
		</tbody>
        </table>
        </div>
        <table class="border_table_1000" style="margin-top: 10px;">
            <tfoot>
                <td class="table_col">��û����</td>
                <td><%=currentTotal %></td>
                <td class="table_col">�������</td>
                <td><%=currentAcquired %></td>
                <td class="table_col">�������</td>
                <td><%=currentAvg %></td>
                <td class="table_col">�����</td>
                <td><%=currentPercentage %></td>
            </thead>
        </table>
        <%}	%>
    </div>
	
    <div class="total_grade">
        <table class="border_table_1000">
            <thead>
                <td>No.</td>
                <td>�⵵</td>
                <td>�б�</td>
                <td>��û����</td>
                <td>�������</td>
                <td>�������</td>
                <td>�����</td>
                <td>���</td>
            </thead>
            <tbody>
	<%		for(int i=0; i<totalGrade.size(); i++){%>
			 	<tr>
                    <td><%=(i+1) %></td>
                    <td><%=totalGrade.get(i).getYear()%></td>
                    <td><%=totalGrade.get(i).getSemester()%></td>
                    <td><%=totalGrade.get(i).getAcquired()%></td>
                    <td><%=totalGrade.get(i).getTotal()%></td>
                    <td><%=totalGrade.get(i).getAvg()%></td>
                    <td><%=totalGrade.get(i).getPercentage() %></td>
                    <td></td>
                </tr>		
	<%		}%>
            </tbody>
        </table>
    </div>
    <%} %>
</body>
<script>
function getClassInfo(id){
	var year = $("select[name=year]").val();
	var semester = $("select[name=semester]").val();
	location.href='searchScore.jsp?num=1&id='+id +'&year='+year+'&semester='+semester;
}
</script>
</html>