/**
 * 화면 임포트 스크립트
 */

function content(i) {
	if (i == 1) {
		// 학생등록
		document.getElementById("section").innerHTML = '<object type="text/html" data="student/enroll.jsp"></object>';
	} else if (i == 2) {
		//학생목록관리(수정/삭제)
		document.getElementById("section").innerHTML = '<object type="text/html" data="student/studentlist.jsp"></object>';
	} else if (i == 3) {
		// 성적조회	  
		document.getElementById("section").innerHTML = '<object type="text/html" data="student/grade.jsp"></object>';
	} else if (i == 4) {
		// 과목출결조회
		document.getElementById("section").innerHTML = '<object type="text/html" data="student/attendance.jsp"></object>';
	} else if (i == 5) {
		// 교수 등록
		document.getElementById("section").innerHTML = '<object type="text/html" data="professor/enroll.jsp"></object>';
	} else if (i == 6) {
		// 교수목록관리
		document.getElementById("section").innerHTML = '<object type="text/html" data="professor/professorlist.jsp"></object>';
	} else if (i == 7) {
		// 수강등록
		document.getElementById("section").innerHTML = '<object type="text/html" data="subject/subjectEnroll.jsp"></object>';
		} else if (i == 8) {
		// 개설과목조회
		document.getElementById("section").innerHTML = '<object type="text/html" data="subject/subjectList.jsp"></object>';
	} else if (i == 9) {
		// 학사일정관리
		document.getElementById("section").innerHTML = '<object type="text/html" data="schedule/schedule.jsp"></object>';
	} else if (i == 10) {
		// 학사공지
		document.getElementById("section").innerHTML = '<object type="text/html" data="board/notice.jsp"></object>';
	} else if (i == 11) {
		// 학사관련문의
		document.getElementById("section").innerHTML = '<object type="text/html" data="board/q_And_a.jsp"></object>';
	} else if (i == 12) {
		// 자유게시판
		document.getElementById("section").innerHTML = '<object type="text/html" data="board/free_Board.jsp"></object>';
	}
}
