<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<%session.invalidate(); %>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/login.css">
<title>BIT Administrator Login</title>
</head>
<body class="login_body">
  <div class="login_wrap">
    <form class="login" action="login_ok.jsp" name="login">
      <h1>BIT 학사시스템 [관리자]</h1> 
      <br />
      <input type="text" placeholder="아이디" name="id"/>
      <br />
      <input type="password" placeholder="비밀번호"  name="pwd"/>
      <br />
      <input type="button" value="로그인" class="loginBtn" onclick="login_check();"/>
      <br />
      <a href="#" onclick="find_id_pwd(1)">아이디찾기</a>
      <a href="#" onclick="find_id_pwd(2)">비밀번호찾기</a>
    </form>
  </div>
</body>
<script>
  	function login_check(){
  		if(document.login.id.value.length == 0){
  			alert('아이디를 입력해주세요');
  			return;
  		}
  		if(document.login.pwd.value.length == 0){
  			alert('비밀번호를 입력해주세요');
  			return;
  		}
  		document.login.submit();
  	}
  	
  	 function find_id_pwd(num){
  		 var popupWidth = 500;
  		 var popupHeight = 220;
  		 var popupX = (window.screen.width/2)-(popupWidth/2);
  		 var popupY= (window.screen.height/2)-(popupHeight/2);
  		 var options = 'top='+popupY+', left='+popupX+', width='+popupWidth+', height='+popupHeight+', status=no, menubar=no, toolbar=no, resizable=no';
  		 if(num == 1){
  			 window.open('find_id_pwd.jsp?no=1', '아이디 찾기', options);
  		 }else{
  			 window.open('find_id_pwd.jsp?no=2', '비밀번호 찾기', options);
  		 }
  	  }
  </script>
</html>