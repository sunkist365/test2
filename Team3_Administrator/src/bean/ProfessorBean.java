package bean;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Blob;

public class ProfessorBean {
	int pro_id; // 교수번호
	String pro_name; // 이름
	String pro_eng_name; // 영문이름
	String pro_jumin; // 주민등록번호
	String pro_department; // 소속학부
	String pro_major; // 소속학과
	String pro_tel; // 전화번호
	String pro_addr; // 주소
	String pro_email; //이메일
	Blob pro_img;
	
	File file;
	FileInputStream fis;
	
	int pro_departmentCode;
	int pro_majorCode;
	
	public ProfessorBean(){	}
	
	public ProfessorBean(int pro_id, String pro_name, String pro_eng_name, String pro_jumin, int pro_majorCode, String pro_tel, String pro_addr, String pro_email, File file, FileInputStream fis) {
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.pro_eng_name = pro_eng_name;
		this.pro_jumin = pro_jumin;
		this.pro_majorCode = pro_majorCode;
		this.pro_tel = pro_tel;
		this.pro_addr = pro_addr;
		this.pro_email = pro_email;
		this.file = file;
		this.fis = fis;
	}
	
	public ProfessorBean(int pro_id, String pro_name, int pro_departmentCode, String pro_department, int pro_majorCode, String pro_major) {
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.pro_departmentCode = pro_departmentCode;
		this.pro_department = pro_department;
		this.pro_majorCode = pro_majorCode;
		this.pro_major = pro_major;
	}

	public ProfessorBean(int pro_id, String pro_name, String pro_eng_name, String pro_jumin, String pro_department, String pro_major,
			String pro_tel, String pro_addr, String pro_email) {
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.pro_eng_name = pro_eng_name;
		this.pro_jumin = pro_jumin;
		this.pro_department = pro_department;
		this.pro_major = pro_major;
		this.pro_tel = pro_tel;
		this.pro_addr = pro_addr;
		this.pro_email = pro_email;
	}

	public ProfessorBean(int pro_id, String pro_name, String pro_eng_name, String pro_jumin, String pro_department, String pro_major,
			String pro_tel, String pro_addr, String pro_email, Blob pro_img) {
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.pro_eng_name = pro_eng_name;
		this.pro_jumin = pro_jumin;
		this.pro_department = pro_department;
		this.pro_major = pro_major;
		this.pro_tel = pro_tel;
		this.pro_addr = pro_addr;
		this.pro_email = pro_email;
		this.pro_img = pro_img;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_eng_name() {
		return pro_eng_name;
	}

	public void setPro_eng_name(String pro_eng_name) {
		this.pro_eng_name = pro_eng_name;
	}

	public String getPro_jumin() {
		return pro_jumin;
	}

	public void setPro_jumin(String pro_jumin) {
		this.pro_jumin = pro_jumin;
	}

	public String getPro_department() {
		return pro_department;
	}

	public void setPro_department(String pro_department) {
		this.pro_department = pro_department;
	}

	public String getPro_major() {
		return pro_major;
	}

	public void setPro_major(String pro_major) {
		this.pro_major = pro_major;
	}

	public String getPro_tel() {
		return pro_tel;
	}

	public void setPro_tel(String pro_tel) {
		this.pro_tel = pro_tel;
	}

	public String getPro_addr() {
		return pro_addr;
	}

	public void setPro_addr(String pro_addr) {
		this.pro_addr = pro_addr;
	}

	public String getPro_email() {
		return pro_email;
	}

	public void setPro_email(String pro_email) {
		this.pro_email = pro_email;
	}

	public Blob getPro_img() {
		return pro_img;
	}

	public void setPro_img(Blob pro_img) {
		this.pro_img = pro_img;
	}

	public int getPro_departmentCode() {
		return pro_departmentCode;
	}

	public void setPro_departmentCode(int pro_departmentCode) {
		this.pro_departmentCode = pro_departmentCode;
	}

	public int getPro_majorCode() {
		return pro_majorCode;
	}

	public void setPro_majorCode(int pro_majorCode) {
		this.pro_majorCode = pro_majorCode;
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
}
