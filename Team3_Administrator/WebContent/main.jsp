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
    		<b><u><%=session.getAttribute("username") %></u> 환영합니다.</b><br>
    		<a href='login.jsp'>로그아웃</a>
    	</div>
      <ul>
        <li class="list hasS">
          <a value="1">학생정보관리</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(1)">학생등록</a></li>
            <li class="item"><a onclick="content(2)">학생목록관리(조회/수정)</a></li>
            <li class="item"><a onclick="content(3)">성적조회</a></li>
            <li class="item"><a onclick="content(4)">과목 출결조회</a></li>
          </ul>
        </li>
        <li class="list hasS">
          <a value="2">교수정보관리</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(5)">교수등록</a></li>
            <li class="item"><a onclick="content(6)">교수목록관리(조회/수정)</a></li>
          </ul>
        </li>
        <li class="list hasS">
          <a value="3">수강시스템</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(7)">수강등록</a></li>
            <li class="item"><a onclick="content(8)">개설과목조회</a></li>
          </ul>
        </li>
        <li class="list hasS">
          <a value="4">학사일정관리</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(9)">일정관리</a></li>
          </ul>
        </li>
        <li class="list hasS">
          <a value="5">공지사항관리</a>
          <ul class="sub_list">
            <li class="item"><a onclick="content(10)">학사공지</a></li>
            <li class="item"><a onclick="content(11)">학사관련문의</a></li>
            <li class="item"><a onclick="content(12)">자유게시판</a></li>
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
    
    // 왼쪽 리스트 드롭
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
