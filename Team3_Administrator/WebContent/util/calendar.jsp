<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="bean.ScheCountBean"%>
<%@page import="bean.ScheduleBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<jsp:useBean id="scheQuery" class="db.ScheduleQuery"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
/* 달력 */
#cal {
   width: 15%;
   height: 80vh;
   margin: auto;
   float: left;
}

table {
   width: 100%;
   border-collapse: collapse;
}

.cth {
   width: 40px;
   height: 40px;
   background-color: rgb(173, 201, 245);
   text-align: center;
}

.ctd {
   width: 40px;
   height: 40px;
   text-align: center;
}

.calendar {
   width: 280px;
}

#month {
   padding: 5px;
   background-color: rgb(173, 201, 245);
   font-weight: bold;
   height: 40px;
   line-height: 40px;
   font-size: 30px;
   padding-left: 10px;
   margin-bottom: 0;
}

.today {
   background-color: rgb(67, 126, 216);
   border-radius: 50px;
   color: white;
   font-weight: bold;
}
</style>
</head>
<body>
	<%
	ArrayList<ScheduleBean> schedule = new ArrayList<ScheduleBean>();
	Connection conn = null;
	try {
		Context ctx = new InitialContext();
		DataSource ds = ((DataSource) ctx.lookup("java:comp/env/jdbc/oracle"));
		conn = ds.getConnection();
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM SCHEDULE WHERE SCHE_STARTYEAR = 2020 AND SCHE_STARTMONTH = 10 ORDER BY SCHE_STARTYEAR, SCHE_STARTMONTH, SCHE_STARTDAY");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			boolean bol = rs.getInt("SCHE_HOLIDAY") == 1 ? true : false; 
			schedule.add(new ScheduleBean(rs.getInt("SCHE_NUM"), 
					rs.getString("SCHE_CONTENT"),
					rs.getInt("SCHE_STARTYEAR"), 
					rs.getInt("SCHE_STARTMONTH"),
					rs.getInt("SCHE_STARTDAY"),
					rs.getInt("SCHE_ENDYEAR"), 
					rs.getInt("SCHE_ENDMONTH"), 
					rs.getInt("SCHE_ENDDAY"), 
					bol));
		}
	} catch (Exception e) {
		System.out.println(getClass() + " >> getScheduleList() >> " + e.getMessage());
	} finally {
		conn.close();
	}
	%>

   <div id="cal">
      <div class="calendar">
         <h3 id="month"></h3>
         <table>
            <thead>
               <tr>
                  <th class="cth">일</th>
                  <th class="cth">월</th>
                  <th class="cth">화</th>
                  <th class="cth">수</th>
                  <th class="cth">목</th>
                  <th class="cth">금</th>
                  <th class="cth">토</th>
               </tr>
            </thead>
            <tbody id="calendar-body"></tbody>
         </table>
      </div>
      <!-- calendar END -->
   </div>

</body>
<script>
   monthAndYear = document.getElementById("month");
   showCalendar();

   function showCalendar() {
      let today = new Date();
      let year = today.getFullYear(); // 년도
      let month = today.getMonth(); // 월
      let firstDay = new Date(year, month).getDay();

      tbl = document.getElementById("calendar-body");

      tbl.innerHTML = "";

      // 달력위에 년도, 월 표시
      monthAndYear.innerHTML = year + "." + (month + 1);

      // 달력 테이블 생성
      let date = 1;
      for (let i = 0; i < 6; i++) {
         let row = document.createElement("tr");

         for (let j = 0; j < 7; j++) {
            if (i === 0 && j < firstDay) {
               cell = document.createElement("td");
               cellText = document.createTextNode("");
               cell.classList.add("ctd");
               cell.appendChild(cellText);
               row.appendChild(cell);
            } else if (date > daysInMonth(month, year)) {
               break;
            } else {
               cell = document.createElement("td");
               cellText = document.createTextNode(date);
               <%for(int i=0; i<schedule.size(); i++){%>
	               if (date >= <%=schedule.get(i).getSche_sDay()%> && date <= <%=schedule.get(i).getSche_eDay()%>) {
	                  <%if(schedule.get(i).isSche_holiday()){%>
	            	   cell.style.color = "red";
	            	   <%}else{%>
	            	   cell.style.color = "blue";
	            	   <%}%>
	                  cell.style.fontWeight = "bold";
	               }
               <%}%>
               
               if (date === today.getDate()
                     && year === today.getFullYear()
                     && month === today.getMonth()) {
                  cell.classList.add("today");
               }
               cell.classList.add("ctd");
               cell.appendChild(cellText);
               row.appendChild(cell);
               date++;
            }
         }
         tbl.appendChild(row);
      }
   }
   function daysInMonth(iMonth, iYear) {
      return 32 - new Date(iYear, iMonth, 32).getDate();
   }
</script>
</html>