function check_ok() {
	if(document.form.b_name.value.length==0){
		alert("작성자를 입력해 주세요.");
		form.b_name.focus();
		return false;
	}
	if(document.form.b_title.value.length == 0){
		alert("제목을 입력해 주세요.");
		form.b_title.focus();
		return false;
	}
	if(document.form.b_content.value.length == 0){
		alert('내용을 입력해 주세요.');
		form.b_content.focus();
		return false;
	}
	if(document.form.b_pwd.value.length==0){
		alert('비밀번호를 입력해 주세요.');
		form.b_pwd.focus();
		return false;
	}
	document.form.submit();
}

function delete_ok(){
	if(document.form.chk_pwd.value.length==0){
		alert('비밀번호를 입력해 주세요.');
		form.chk_pwd.focus();
		return false;
	}
	document.form.submit();
}