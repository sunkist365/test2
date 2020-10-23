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
</head>
<%
	String pageNUM = request.getParameter("pageNUMN");
	if(pageNUM == null){
		pageNUM="1";
	}
%>
<body>
    <div class="title">�л����</div>
    <div class="search">
    	<form action="searchBoard.jsp" name="searchBoard">
    		<select name="searchType">
    			<option value="1">����</option>
    			<option value="2">����</option>
    		</select>
	        <input type="text" placeholder="�˻��� ����" name="searchContent">
	        <input type="button" value="�˻�" onclick="document.searchBoard.submit()"> 
	        <input type="button" value="��ü����" onclick="location.href='notice.jsp'">
	        <input type="hidden" value="4" name="groupn">
        </form>
    </div>
    <div class="write">
        ��ü���� <input type="checkbox" class="check-all"> <input type="button" value="����" id="deleteBtn" onclick="deletePost()"> 
        <input type="button" value="�۾���" id="writeBtn" onclick="location.href='write.jsp'"> 
    </div>
    <div class="table_div">
        <table class="border_table_1000 width1">
            <thead>
                <tr>
                    <td style="width:50px;">����</td>
                    <td style="width:50px;">��ȣ</td>
                    <td>����</td>
                    <td style="width:100px;">�ۼ���</td>
                    <td style="width:100px;">�ۼ���</td>
                    <td style="width:70px;">��ȸ��</td>
                </tr>
            </thead>
            <tbody>
             <%
             ArrayList<CommunityBean> community = null;
             if(request.getParameter("searchContent") != null){
            	 int searchType= Integer.parseInt(request.getParameter("searchType"));
            	 String searchContent = request.getParameter("searchContent");
            	 community = commQuery.getCommunityList(4, pageNUM, searchType, searchContent);
             }else{
            	 community = commQuery.getCommunityList(4, pageNUM, 2, "");            	 
             }
             if(community.size() != 0){
	             for(int i=0; i<community.size(); i++){
					int index = community.get(i).getComm_num();
					out.println("<tr>");
					out.println("<td><input type='checkbox' name='ch' value="+index+"></td>");
					out.println("<td>"+index+"</td>");
					out.println("<td>");
					
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
             }
        	%>
            </tbody>
        </table>
        <div class="page">
        	<%= CommunityBean.pageNumberNotice(4) %>
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

        function deletePost(){ /*�Խñ� ����*/
            var arr = $('input[name=ch]:checked').serializeArray().map(function(item) { return item.value });
            if(confirm('�����Ͻðڽ��ϱ�?')){
                if(arr.length != 0){
                    for(var i=$("[name='ch']:checked").length-1; i>-1; i--){ 
                        $("[name='ch']:checked").eq(i).closest("tr").remove(); 
                    }
                    location.href="delete.jsp?index=" + arr +"&groupN="+<%=community.get(0).getComm_groupN()%>;
                }else{
                    alert('���õ� �Խñ��� �����ϴ�.');
                }
            }
            $('.check-all').prop('checked', false);
        }
        <%}%>
    </script>
</html>