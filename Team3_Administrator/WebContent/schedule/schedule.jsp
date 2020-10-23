<%@page import="java.util.Calendar"%>
<%@page import="bean.ScheCountBean"%>
<%@page import="bean.ScheduleBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="scheQuery" class="db.ScheduleQuery"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/schedule.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>
    <div class="title">학사일정</div>
    <div>
        <div class="add-schedule">
            <h3>일정추가</h3>
            <form action="addSchedule_ok.jsp" name="schedule">
                기간 : <input type="date" id="start-date" name="start-date"> - <input type="date" id="end-date" name="end-date"> <span>공휴일 여부 <input type="checkbox" name="holiday" value="1"></span><br>
                내용 : <input type="text" id="content" name="content"><input type="button" value="추가" onclick="document.schedule.submit()"><input type="button" value="다시작성" onclick="doReset()">
            </form>
        </div>
        <div class="year-btn">
<%
			Calendar c = Calendar.getInstance();
			int year = 0;
			if(request.getParameter("year") != null){
				year = Integer.parseInt(request.getParameter("year"));
			}else{
				year = c.get(Calendar.YEAR);
			}
%>
		<form name='form'>
            <input type="button" value="◀" onclick="setYear(1)">
            <h3 id="year"><%=year%>년</h3>
            <input type="button" value="▶" onclick="setYear(2)">
		</form>
        </div>
        <table class="sche-table">
            <colgroup>
                <col width="70px"/>
                <col width="150px"/>
              </colgroup>
            <thead>
                <tr>
                    <td colspan="4" style="text-align: right; padding-bottom: 5px;">
                        전체선택 <input type="checkbox" class="check-all"> <input type="button" value="삭제" onclick="deleteSchedule()">
                    </td>
                </tr>
            </thead>
<%
			ArrayList<ScheduleBean> schedule = scheQuery.getScheduleList(year);
			ArrayList<ScheCountBean> scheCnt = scheQuery.getCount(year);
			
			int cnt = 0;
			boolean bol = false;
			
			if(scheCnt.size() != 0){
				for(int i=0; i<scheCnt.size(); i++){
					bol = true;
					out.println("<tbody>");
					for(int j=0; j<scheCnt.get(i).getCnt(); j++){
						String start = String.format("%02d", schedule.get(cnt).getSche_sMonth())+"."+String.format("%02d", schedule.get(cnt).getSche_sDay());
						String end = String.format("%02d", schedule.get(cnt).getSche_eMonth())+"."+String.format("%02d", schedule.get(cnt).getSche_eDay());
						out.println("<tr>");
						if(j == 0){
							out.println("<td rowspan='"+scheCnt.get(i).getCnt()+"' style='text-align:center;'>"+schedule.get(cnt).getSche_sMonth()+"월</td>");
						}
						if(start.equals(end)){
							if(schedule.get(cnt).isSche_holiday())
								out.println("<td><font color='red'>"+start+"</font></td>");
							else
								out.println("<td>"+start+"</td>");								
						}else{
							if(schedule.get(cnt).isSche_holiday())
								out.println("<td><font color='red'>"+start+"~"+end+"</font></td>");
							else
								out.println("<td>"+start+"~"+end+"</td>");							
						}
						if(schedule.get(cnt).isSche_holiday())
							out.println("<td style='text-align:left;'><font color='red'>"+schedule.get(cnt).getSche_content()+"</font></td>");
						else
							out.println("<td style='text-align:left;'>"+schedule.get(cnt).getSche_content()+"</td>");							
						out.println("<td><input type='checkbox' name='ch' value="+schedule.get(cnt).getSche_num()+"></td>");
						out.println("</tr>");
						cnt++;
					}
					out.println("</tbody>");
				}
			}
			
			if(!bol)
				out.println("<tr><td rowspan='4' style='padding:30px 0;'><h3>일정이 존재하지 않습니다.</h3></td></tr>");
			
%>
       </table>
    </div>
</body>
<script>
	$(document).ready( function() {
	    $('.check-all').click( function() {
	        $('input[name=ch]').prop('checked', this.checked);
	    });
	});

	function deleteSchedule(){
    	var arr = $('input[name=ch]:checked').serializeArray().map(function(item) { return item.value });
    	if(confirm('삭제하시겠습니까?')){
    	    if(arr.length != 0){
    	        for(var i=$("[name='ch']:checked").length-1; i>-1; i--){ 
    	            $("[name='ch']:checked").eq(i).closest("tr").remove(); 
    	        }
   	        location.href="delete.jsp?index=" + arr;
    	    }else{
    	        alert('선택된 일정 없습니다.');
        }
    }
	    $('.check-all').prop('checked', false);
	}

	function setYear(num){
		var year = parseInt(document.getElementById("year").innerHTML.substring(0,4));
		if(num == 1){
			document.getElementById("year").innerHTML = (year-1)+'년';
			year = year - 1;
		}else{
			document.getElementById("year").innerHTML = (year+1)+'년';
			year = year + 1;
		}
		console.log(year);
		location.href='getSchedule.jsp?year='+year;
	}
	
    function doReset(){
        var day = new Date().toISOString().substring(0, 10);
        document.getElementById('start-date').value = day;
        document.getElementById('end-date').value = day;
        document.getElementById('content').value = "";
        $("input:checkbox[name='holiday']").prop("checked", false);
    }
     window.onload=doReset;

</script>
</html>