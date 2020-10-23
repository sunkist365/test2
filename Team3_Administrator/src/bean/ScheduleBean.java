package bean;

public class ScheduleBean {
	private int sche_num;
	private String sche_content;
	private int sche_sYear;
	private int sche_sMonth;
	private int sche_sDay;
	private int sche_eYear;
	private int sche_eMonth;
	private int sche_eDay;
	private boolean sche_holiday;
	
	public ScheduleBean(String sche_content, int sche_sYear, int sche_sMonth, int sche_sDay,
			int sche_eYear, int sche_eMonth, int sche_eDay, boolean sche_holiday) {
		this.sche_content = sche_content;
		this.sche_sYear = sche_sYear;
		this.sche_sMonth = sche_sMonth;
		this.sche_sDay = sche_sDay;
		this.sche_eYear = sche_eYear;
		this.sche_eMonth = sche_eMonth;
		this.sche_eDay = sche_eDay;
		this.sche_holiday = sche_holiday;
	}
	
	public ScheduleBean(int sche_num, String sche_content, int sche_sYear, int sche_sMonth, int sche_sDay,
			int sche_eYear, int sche_eMonth, int sche_eDay, boolean sche_holiday) {
		this.sche_num = sche_num;
		this.sche_content = sche_content;
		this.sche_sYear = sche_sYear;
		this.sche_sMonth = sche_sMonth;
		this.sche_sDay = sche_sDay;
		this.sche_eYear = sche_eYear;
		this.sche_eMonth = sche_eMonth;
		this.sche_eDay = sche_eDay;
		this.sche_holiday = sche_holiday;
	}
	
	public int getSche_num() {
		return sche_num;
	}
	public void setSche_num(int sche_num) {
		this.sche_num = sche_num;
	}
	public String getSche_content() {
		return sche_content;
	}
	public void setSche_content(String sche_content) {
		this.sche_content = sche_content;
	}
	public int getSche_sYear() {
		return sche_sYear;
	}
	public void setSche_sYear(int sche_sYear) {
		this.sche_sYear = sche_sYear;
	}
	public int getSche_sMonth() {
		return sche_sMonth;
	}
	public void setSche_sMonth(int sche_sMonth) {
		this.sche_sMonth = sche_sMonth;
	}
	public int getSche_sDay() {
		return sche_sDay;
	}
	public void setSche_sDay(int sche_sDay) {
		this.sche_sDay = sche_sDay;
	}
	public int getSche_eYear() {
		return sche_eYear;
	}
	public void setSche_eYear(int sche_eYear) {
		this.sche_eYear = sche_eYear;
	}
	public int getSche_eMonth() {
		return sche_eMonth;
	}
	public void setSche_eMonth(int sche_eMonth) {
		this.sche_eMonth = sche_eMonth;
	}
	public int getSche_eDay() {
		return sche_eDay;
	}
	public void setSche_eDay(int sche_eDay) {
		this.sche_eDay = sche_eDay;
	}
	public boolean isSche_holiday() {
		return sche_holiday;
	}
	public void setSche_holiday(boolean sche_holiday) {
		this.sche_holiday = sche_holiday;
	}
}
