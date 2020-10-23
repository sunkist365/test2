package bean;

public class ClassBean {
	int subjCode;
	String subjState;
	String subjName;
	int subjHakjum;
	String proName;
	String scRetake;
	double scScore;
	
	int year;
	int semester;
	int stu_id;
	
	int acquired;
	int total;
	double avg;
	double percentage;
	
	public ClassBean() {}
	
	public ClassBean(int stu_id, int year, int semester, int acquired, int total, double avg, double percentage) {
		this.stu_id = stu_id;
		this.year = year;
		this.semester = semester;
		this.acquired = acquired;
		this.total = total;
		this.avg = avg;
		this.percentage = percentage;
	}
	
	public ClassBean(int stu_id, int subjCode, String subjState, String subjName, int subjHakjum, int year, int semester, double scScore, String scRetake) {
		this.stu_id = stu_id;
		this.subjCode = subjCode;
		this.subjState = subjState;
		this.subjName = subjName;
		this.subjHakjum = subjHakjum;
		this.year = year;
		this.semester = semester;
		this.scScore = scScore;
		this.scRetake = scRetake;
	}
	
	public ClassBean(int stu_id, int semester, int year, int subjCode, String subjState, String subjName, int subjHakjum, String proName) {
		this.stu_id = stu_id;
		this.semester = semester;
		this.year = year;
		this.subjCode = subjCode;
		this.subjState = subjState;
		this.subjName = subjName;
		this.subjHakjum = subjHakjum;
		this.proName = proName;
	}
	
	public ClassBean(int subjCode, String subjState, String subjName, int subjHakjum, String proName) {
		this.subjCode = subjCode;
		this.subjState = subjState;
		this.subjName = subjName;
		this.subjHakjum = subjHakjum;
		this.proName = proName;
	}

	public int getSubjCode() {
		return subjCode;
	}

	public void setSubjCode(int subjCode) {
		this.subjCode = subjCode;
	}

	public String getSubjState() {
		return subjState;
	}

	public void setSubjState(String subjState) {
		this.subjState = subjState;
	}

	public String getSubjName() {
		return subjName;
	}

	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}

	public int getSubjHakjum() {
		return subjHakjum;
	}

	public void setSubjHakjum(int subjHakjum) {
		this.subjHakjum = subjHakjum;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public int getStu_id() {
		return stu_id;
	}

	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	
	public double getScScore() {
		return scScore;
	}

	public void setScScore(double scScore) {
		this.scScore = scScore;
	}

	public String getScRetake() {
		return scRetake;
	}

	public void setScRetake(String scRetake) {
		this.scRetake = scRetake;
	}

	public int getAcquired() {
		return acquired;
	}

	public void setAcquired(int acquired) {
		this.acquired = acquired;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public double getPercentage() {
		return percentage;
	}

	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
}
