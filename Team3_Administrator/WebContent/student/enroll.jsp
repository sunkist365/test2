<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
    <link rel="stylesheet" href="../css/common.css" />
    <link rel="stylesheet" href="../css/pro_stu.css" />
    <style>      
      img {
        width: 120px;
        max-height: 122px;
      }
      .btn-file {
        position: relative;
        text-align: center;
        overflow: hidden;
        border: 1px #333 solid;
        box-sizing: border-box;
        background-color: #eee;
        border-radius: 3px;
      }
      .btn-file span {
        width: inherit;
        cursor: pointer;
        z-index: 3;
      }

      .btn-file input[type="file"] {
        width: 100px;
        float: left;
        position: absolute;
        left: 0;
        opacity: 0;
        outline: none;
        z-index: 5;
        background: white;
        cursor: pointer;
      }
    </style>
    </head>
    <body>
    <div class="title">학생등록</div>
    <form action="enroll_ok.jsp" name="form" method="post" enctype="multipart/form-data">
        <table class="enroll-table">
            <tr>
                <td colspan="5" class="col0">학적정보</td>
            </tr>
            <tr>
                <td rowspan="4" class="col1" style="height: 127px;"><img src="" alt="" id="preview" /></td>
                <td class="col1">성명</td>
                <td class="col2"><input type="text" class="short-input" name="stu_name"></td>
                <td class="col1">영문성명</td>
                <td class="col3"><input type="text" class="short-input" name="stu_eng_name"></td>
            </tr>
            <tr>
                <td class="col1" class="long-input">주민등록번호</td>
                <td colspan="3"><input type="text" class="long-input" name="stu_jumin"></td>
            </tr>
            <tr>
                <td class="col1">학번</td>
                <td><input type="text" class="short-input" name="stu_id"></td>
                <td class="col1">지도교수</td>
                <td><input type="text" class="short-input" name="stu_pro" id="stu_pro" readonly><input type="button" value="검색" name="search" onclick="searchPro()"></td>
            </tr>
            <tr>
                <td class="col1">소속학부</td>
                <td><input type="text" class="short-input" name="stu_department" id="stu_department" readonly></td>
                <td class="col1">소속학과</td>
                <td><input type="text" class="short-input" name="stu_major" id="stu_major" readonly></td>
            </tr>
            <tr>
                <td class="col1">
                <!--  	<input type="button" value="사진추가" name="add-img"> -->
                	<div class="btn-file">
	          			<span onclick="">사진추가</span>
	          			<input type="file" id="upload" name="upload" />
	        		</div>
                </td>
                <td class="col1">학적구분</td>
                <td><input type="text" value="재학" class="short-input" name="stu_state"></td>
                <td class="col1">학년</td>
                <td><input type="text" value="1" class="short-input" name="stu_grade"></td>
            </tr>
            <tr>
                <td colspan="5" class="col0">기본정보</td>
            </tr>
            <tr>
                <td rowspan="3"></td>
                <td class="col1">연락처</td>
                <td class="col2"><input type="text" class="short-input" name="stu_tel"></td>
                <td class="col1">비상연락망</td>
                <td class="col3"><input type="text" class="short-input" name="stu_emgTel"></td>
            </tr>
            <tr>
                <td class="col1">주소</td>
                <td colspan="3"><input type="text" class="long-input" id="stu_addr" name="stu_addr"><input type="button" value="검색" name="search" onclick="execPostCode()"></td>
            </tr>
            <tr>
                <td class="col1">메일주소</td>
                <td colspan="3"><input type="text" class="short-input" name="stu_email"></td>
            </tr>
        </table>
        <div class="btn-div">
            <input type="button" value="등록" onclick="document.form.submit()">
            <input type="reset" value="재작성">
            <input type="button" value="취소" onclick="location.href='studentlist.jsp'">
        </div>
		<input type="hidden" name="stu_majorCode" id="stu_majorCode">
		<input type="hidden" name="stu_proId" id="stu_proId">
    </form>
	
  </body>
  <script>
  function execPostCode() {
	   daum.postcode.load(function() {
	      new daum.Postcode({
	         oncomplete : function(data) {
	            var addr = '';

	            if (data.userSelectedType === 'R') {
	               addr = data.roadAddress;
	            } else {
	               addr = data.jibunAddress;

	            }
	            document.getElementById('stu_addr').value = addr;
	            document.getElementById('stu_addr').focus();
	         }
	      }).open();
	   })
	}

  function searchPro(){
      var options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
      window.open('searchProfessor.jsp', '교수님 검색', options);
  }
  
  var upload = document.querySelector("#upload");
  var preview = document.querySelector("#preview");

  upload.addEventListener("change", function (e) {
    var get_file = e.target.files;
    var reader = new FileReader();

    reader.onload = (function (aImg) {
      return function (e) {
        aImg.src = e.target.result;
      };
    })(preview);

    if (get_file) {
      reader.readAsDataURL(get_file[0]);
    }
  });
  </script>
</html>
