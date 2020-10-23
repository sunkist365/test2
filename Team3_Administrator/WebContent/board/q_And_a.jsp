<%@page import="bean.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="commQuery" class="db.CommunityQuery"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/board.css">
    <style>
    	tr, td{
    	padding:5px;
    	}
    </style>
</head>
<%
	String pageNUM = request.getParameter("pageNUMQ");
	if(pageNUM == null){
		pageNUM="1";
	}
%>
<body>
    <div class="title">학사관련문의</div>
  <div class="search">
        <form action="searchBoard.jsp" name="searchBoard">
    		<select name="searchType">
    			<option value="1">제목</option>
    			<option value="2">내용</option>
    		</select>
	        <input type="text" placeholder="검색할 내용" name="searchContent">
	        <input type="button" value="검색" onclick="document.searchBoard.submit()"> 
	        <input type="button" value="전체보기" onclick="location.href='q_And_a.jsp'">
	        <input type="hidden" value="2" name="groupn">
        </form>
    </div>
    <div class="write">
        전체선택 <input type="checkbox" class="check-all"> <input type="button" value="삭제" id="deleteBtn" onclick="deletePost()"> 
    </div>
    <div class="table_div">
        <table class="border_table_1000 width2">
            <thead>
                <tr>
                    <td style="width:50px;">선택</td>
                    <td style="width:50px;">번호</td>
                    <td style="width:70px; text-align: center;">분류</td>
                    <td style="padding-left:10px;">제목</td>
                    <td style="width:100px;">작성자</td>
                    <td style="width:100px;">작성일</td>
                    <td style="width:70px;">조회수</td>
                </tr>
            </thead>
            <tbody>
             <%
	             ArrayList<CommunityBean> community = null;
	             if(request.getParameter("searchContent") != null){
	            	 int searchType= Integer.parseInt(request.getParameter("searchType"));
	            	 String searchContent = request.getParameter("searchContent");
	            	 community = commQuery.getCommunityList(2, pageNUM, searchType, searchContent);
	             }else{
	            	 community = commQuery.getCommunityList(2, pageNUM, 2, "");            	 
	             }
				for(int i=0; i<community.size(); i++){
					int index = community.get(i).getComm_num();
					out.println("<tr>");
					out.println("<td><input type='checkbox' name='ch' value="+index+"></td>");
					out.println("<td>"+index+"</td>");
					String groupName = community.get(i).getComm_groupN() == 2? "[학사]" : "[학적]";
					out.println("<td>" + groupName + "</td>");
					out.println("<td>");
					if(community.get(i).getComm_level() > 0){
						for(int k=0; k<community.get(i).getComm_level(); k++){
							out.println("&nbsp");
						}
						out.println("<img src='../img/AnswerLine.gif' width='16' height='16' border=0>");
					}
					if(community.get(i).getComm_originFileName() != null)
						out.println("<a href='read.jsp?index="+i+"'>"+community.get(i).getComm_title() + " <img src='../img/attachedfile.png' width='16' height='16' border=0>");
					else
						out.println("<a href='read.jsp?index="+i+"'>"+community.get(i).getComm_title());

					if(community.get(i).getComm_cmtNum() == 0)
						out.println("</a></td>");
					else
						out.println(" <font color='red'>["+community.get(i).getComm_cmtNum()+"]</font>"+"</a></td>");
					out.println("<td>"+community.get(i).getComm_writer()+"</td>");
					out.println("<td>"+community.get(i).getComm_date().toString()+"</td>");
					out.println("<td>"+community.get(i).getComm_hits()+"</td>");
					out.println("</tr>");
				}
        	%>
            </tbody>
        </table>
        <div class="page">
        	<%= CommunityBean.pageNumberqANDa(4) %>
        </div>
    </div>
</body>
    <script>
    <% if(community.size() != 0){ %>
        $(document).ready( function() {
            $('.check-all').click( function() {
                $('input[name=ch]').prop('checked', this.checked);
            });
        });

        function deletePost(){ /*게시글 삭제*/
            var arr = $('input[name=ch]:checked').serializeArray().map(function(item) { return item.value });
            if(confirm('삭제하시겠습니까?')){
                if(arr.length != 0){
                    for(var i=$("[name='ch']:checked").length-1; i>-1; i--){ 
                        $("[name='ch']:checked").eq(i).closest("tr").remove(); 
                    }
                    location.href="delete.jsp?index=" + arr +"&groupN="+<%=community.get(0).getComm_groupN()%>;
                }else{
                    alert('선택된 게시글이 없습니다.');
                }
            }
            $('.check-all').prop('checked', false);
        }
        <%}%>
    </script>
</html>