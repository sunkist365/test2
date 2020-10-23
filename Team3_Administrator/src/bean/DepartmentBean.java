package bean;

public class DepartmentBean {
	private int dept_code;
	private String dept_name;
	private int major_code;
	private String major_name;

	public DepartmentBean() {
		
	}
	
	public DepartmentBean(int dept_code, String dept_name, int major_code, String major_name) {
		this.dept_code = dept_code;
		this.dept_name = dept_name;
		this.major_code = major_code;
		this.major_name = major_name;
	}
	
	public int getDept_code() {
		return dept_code;
	}
	public void setDept_code(int dept_code) {
		this.dept_code = dept_code;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getMajor_code() {
		return major_code;
	}
	public void setMajor_code(int major_code) {
		this.major_code = major_code;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
}
