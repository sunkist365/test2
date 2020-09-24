function check_ok(){
	if(document.reg_frm.mem_uid.value.length==0){
//		jsp파일     폼 이름    인풋이름     값        길이
		alert("아이디를 써주세요");
		reg_frm.mem_uid.focus();
		return;
	}
	if(document.reg_frm.mem_uid.value.length<4){
		alert("아이디는 4글자 이상이어야 합니다.");
		reg_frm.mem_uid.focus();
		return;
	}
	if(document.reg_frm.mem_pwd.value.length==0){
		alert("패스워드는 반드시 입력해야 합니다.");
		reg_frm.mem_pwd.focus();
		return;
	}
	if(document.reg_frm.mem_pwd.value != document.reg_frm.pwd_check.value){
		alert("패스워드가 일치하지 않습니다.");
		reg_frm.mem_pwd.focus();
		return;
	}
	if(document.reg_frm.mem_name.value.length==0){
		alert("이름을 써주세요.");
		reg_frm.mem_pwd.focus();
		return;
	}
	if(document.reg_frm.mem_email.value.length==0){
		alert("E-mail을 써주세요.");
		reg_frm.mem_email.focus();
		return;
	}
	document.reg_frm.submit();
}

function check_ok1() {
		var form = document.reg_frm
		
		if(form.mem_uid.value == ""){
			alert("아아디를 써주세요.");
			form.mem_uid.focus();
			return;
		}else if(form.mem_uid.value.length < 4){
			alert("아이디는 4글자 이상이어야 합니다.")
			form.mem_uid.focus();
			return;
		}else if(form.mem_pwd.value==""){
			alert("패스워드는 반드시 입력해야 합니다.");
			form.mem_pwd.focus();
			return;
		}else if(form.mem_pwd.value != form.pwd_check.value){
			alert("패스워드가 일치하지 않습니다.")
			form.mem_pwd.focus();
			return;
		}else if(form.mem_name.value==""){
			alert("이름을 써주세요.");
			form.mem_name.focus();
			return;
		}else if(form.mem_email.value==""){
			alert("E-mail을 써주세요.");
			form.mem_email.focus();
			return;
		}
		
}

function update_check_ok(){
	var form = document.update_frm
	
	if(form.mem_pwd.value.length==0){
		alert("패스워드는 반드시 입력해야 합니다.");
		form.mem_pwd.focus();
		return;
	}
	if(form.mem_pwd.value != form.pwd_check.value){
		alert("패스워드가 일치하지 않습니다.");
		form.mem_pwd.focus();
		return;
	}
	if(form.mem_email.value.length==0){
		alert("E-mail을 써주세요.");
		form.mem_email.focus();
		return;
	}
	form.submit();
}

function delete_check(){
	if(confirm("삭제하시겠습니까?")){
		location.href="memberDelete.jsp";
	}else{
		alert("삭제를 취소합니다.");
		return;
	}	
}