<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/main.css" />
    <title>Team3 - Administrator</title>
    <script src="js/include.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <style>
    	.loginInfo{
    		width:200px;
    		height: 70px;
    		background-color: #fff;
    		align-content: center;
    		border-radius: 5px;
    		margin: 20px auto;
    		color: black;
    		text-align: center;
    		line-height: 35px;
    	}
    </style>
  </head>
  <body>
    <nav>
    	<div class="loginInfo">
    		<b><u><%=session.getAttribute("username") %></u> ȯ���մϴ�.</b><br>
    		<a href='login.jsp'>�α׾ƿ�</a>
    	</div>
      <ul>
        <li class="list hasS">
          <a value="1">�л���������</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(1)">�л����</a></li>
            <li class="item"><a onclick="content(2)">�л���ϰ���(��ȸ/����)</a></li>
            <li class="item"><a onclick="content(3)">������ȸ</a></li>
            <li class="item"><a onclick="content(4)">���� �����ȸ</a></li>
          </ul>
        </li>
        <li class="list hasS">
          <a value="2">������������</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(5)">�������</a></li>
            <li class="item"><a onclick="content(6)">������ϰ���(��ȸ/����)</a></li>
          </ul>
        </li>
        <li class="list hasS">
          <a value="3">�����ý���</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(7)">�������</a></li>
            <li class="item"><a onclick="content(8)">����������ȸ</a></li>
          </ul>
        </li>
        <li class="list hasS">
          <a value="4">�л���������</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(9)">��������</a></li>
          </ul>
        </li>
        <li class="list hasS">
          <a value="5">�������װ���</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(10)">�л����</a></li>
            <li class="item"><a onclick="content(11)">�л���ù���</a></li>
            <li class="item"><a onclick="content(12)">�����Խ���</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <section id="section">
      <object type="text/html" data="board/notice.jsp"></object>
    </section>
  </body>
  <script>
    
    var a = document.querySelectorAll(".hasS>a");
    for(var i = 0; i<a.length; i++){
    	a[i].dataset.content = '+';
    }
    
    // ���� ����Ʈ ���
    $(document).ready(function () {
      $(".list>a").click(function () {
        var submenu = $(this).next("ul");
        var index = parseInt($(this).attr('value'));
        if (submenu.is(":visible")) {
          submenu.slideUp();
          a[index-1].dataset.content = "+";
        } else {
          submenu.slideDown();
          a[index-1].dataset.content = "-";
        }
      });
    });    
  </script>
</html>
