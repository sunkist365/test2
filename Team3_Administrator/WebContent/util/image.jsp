<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="image_insert.jsp" method="post" enctype="multipart/form-data"> <!-- 수정 -->
		<img src="" alt="" id="preview" /> 
		<input type="text" name="stu_id" />		
		<input type="file" id="upload" name="upload" />
		<input type="submit" value="저장">
		<input type="button" value="가져오기" onclick="image()">
	</form>
</body>
<script>
	var upload = document.querySelector("#upload");
	var preview = document.querySelector("#preview");

	upload.addEventListener("change", function(e) {
		var get_file = e.target.files;
		var reader = new FileReader();

		reader.onload = (function(aImg) {
			return function(e) {
				aImg.src = e.target.result;
			};
		})(preview);
	});

	function image(num){
		location.href='image_read.jsp';
	}
</script>
</html>