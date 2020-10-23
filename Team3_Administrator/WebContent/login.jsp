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
      <h1>BIT �л�ý��� [������]</h1> 
      <br />
      <input type="text" placeholder="���̵�" name="id"/>
      <br />
      <input type="password" placeholder="��й�ȣ"  name="pwd"/>
      <br />
      <input type="button" value="�α���" class="loginBtn" onclick="login_check();"/>
      <br />
      <a href="#" onclick="find_id_pwd(1)">���̵�ã��</a>
      <a href="#" onclick="find_id_pwd(2)">��й�ȣã��</a>
    </form>
  </div>
</body>
<script>
  	function login_check(){
  		if(document.login.id.value.length == 0){
  			alert('���̵� �Է����ּ���');
  			return;
  		}
  		if(document.login.pwd.value.length == 0){
  			alert('��й�ȣ�� �Է����ּ���');
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
  			 window.open('find_id_pwd.jsp?no=1', '���̵� ã��', options);
  		 }else{
  			 window.open('find_id_pwd.jsp?no=2', '��й�ȣ ã��', options);
  		 }
  	  }
  </script>
</html>