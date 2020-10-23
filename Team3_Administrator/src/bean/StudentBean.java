package bean;

import java.io.File;
import java.io.FileInputStream;

import javax.websocket.Decoder.BinaryStream;

public class StudentBean {
	int stu_id; // 학번
	String stu_name; // 이름
	String stu_eng_name; // 영문이름
	String stu_jumin; //주민등록번호
	int stu_state; // 학적구분 1:재학, 2:졸업, 3:휴학, 4:자퇴
	String stu_department; // 소속학부
	String stu_major; // 소속학과
	int stu_major_int;
	int stu_grade; // 학년
	String stu_pro; // 지도교수
	int stu_pro_int;
	String stu_tel; // 전화번호
	String stu_emgTel; // 비상연락망
	String stu_addr; // 주소
	String stu_email; // 이메일
	File file;
	FileInputStream fis;
	
	public StudentBean() {}
	
	public StudentBean(int stu_id, String stu_name, int stu_grade, String stu_department, String stu_major, int stu_state) {
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_grade = stu_grade;
		this.stu_department = stu_department;
		this.stu_major = stu_major;
		this.stu_state = stu_state;
	}
	
	public StudentBean(int stu_id, String stu_name, String stu_eng_name, String stu_jumin, int stu_state, 
			int stu_major_int, int stu_grade, int stu_pro_int, String tel, String stu_emgTel, String stu_addr,
			String stu_email, File file, FileInputStream fis) {
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_eng_name = stu_eng_name;
		this.stu_jumin = stu_jumin;
		this.stu_state = stu_state;
		this.stu_major_int = stu_major_int;
		this.stu_grade = stu_grade;
		this.stu_pro_int = stu_pro_int;
		this.stu_tel = tel;
		this.stu_emgTel = stu_emgTel;
		this.stu_addr = stu_addr;
		this.stu_email = stu_email;
		this.file = file;
		this.fis = fis;
	}
	
	public StudentBean(int stu_id, String stu_name, String stu_eng_name, String stu_jumin, int stu_state, String department,
			String stu_major, int stu_grade, String stu_pro, String tel, String stu_emgTel, String stu_addr,
			String stu_email) {
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_eng_name = stu_eng_name;
		this.stu_jumin = stu_jumin;
		this.stu_state = stu_state;
		this.stu_department = department;
		this.stu_major = stu_major;
		this.stu_grade = stu_grade;
		this.stu_pro = stu_pro;
		this.stu_tel = tel;
		this.stu_emgTel = stu_emgTel;
		this.stu_addr = stu_addr;
		this.stu_email = stu_email;
	}
	
	public StudentBean(int stu_id, String stu_name, String stu_eng_name, String stu_jumin, int stu_state, String stu_department,
			String stu_major, int stu_grade, String stu_pro, String tel, String stu_emgTel, String stu_addr,
			String stu_email, File file, FileInputStream fis) {
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_eng_name = stu_eng_name;
		this.stu_jumin = stu_jumin;
		this.stu_state = stu_state;
		this.stu_department = stu_department;
		this.stu_major = stu_major;
		this.stu_grade = stu_grade;
		this.stu_pro = stu_pro;
		this.stu_tel = tel;
		this.stu_emgTel = stu_emgTel;
		this.stu_addr = stu_addr;
		this.stu_email = stu_email;
		this.file = file;
		this.fis = fis;
	}
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_eng_name() {
		return stu_eng_name;
	}
	public void setStu_eng_name(String stu_eng_name) {
		this.stu_eng_name = stu_eng_name;
	}
	public String getStu_jumin() {
		return stu_jumin;
	}
	public void setStu_jumin(String stu_jumin) {
		this.stu_jumin = stu_jumin;
	}
	public int getStu_state() {
		return stu_state;
	}
	public void setStu_state(int stu_state) {
		this.stu_state = stu_state;
	}
	public String getStu_major() {
		return stu_major;
	}
	public String getStu_department() {
		return stu_department;
	}
	public void setStu_department(String stu_department) {
		this.stu_department = stu_department;
	}
	public void setStu_major(String stu_major) {
		this.stu_major = stu_major;
	}
	public int getStu_grade() {
		return stu_grade;
	}
	public void setStu_grade(int stu_grade) {
		this.stu_grade = stu_grade;
	}
	public String getStu_pro() {
		return stu_pro;
	}
	public void setStu_pro(String stu_pro) {
		this.stu_pro = stu_pro;
	}
	public String getStu_tel() {
		return stu_tel;
	}
	public void setStu_tel(String stu_tel) {
		this.stu_tel = stu_tel;
	}
	public String getStu_emgTel() {
		return stu_emgTel;
	}
	public void setStu_emgTel(String stu_emgTel) {
		this.stu_emgTel = stu_emgTel;
	}
	public String getStu_addr() {
		return stu_addr;
	}
	public void setStu_addr(String stu_addr) {
		this.stu_addr = stu_addr;
	}
	public String getStu_email() {
		return stu_email;
	}
	public void setStu_email(String stu_email) {
		this.stu_email = stu_email;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public FileInputStream getFis() {
		return fis;
	}
	public void setFis(FileInputStream fis) {
		this.fis = fis;
	}

	public int getStu_major_int() {
		return stu_major_int;
	}

	public void setStu_major_int(int stu_major_int) {
		this.stu_major_int = stu_major_int;
	}

	public int getStu_pro_int() {
		return stu_pro_int;
	}

	public void setStu_pro_int(int stu_pro_int) {
		this.stu_pro_int = stu_pro_int;
	}
	
}
