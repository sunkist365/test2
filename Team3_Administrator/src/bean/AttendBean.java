package bean;

public class AttendBean {
	private String att_date;
	private String att_state;
	private String remark;

	public AttendBean(String att_date, String att_state, String remark) {
		this.att_date = att_date;
		this.att_state = att_state;
		this.remark = remark;
	}
	public String getAtt_date() {
		return att_date;
	}
	public void setAtt_date(String att_date) {
		this.att_date = att_date;
	}
	public String getAtt_state() {
		return att_state;
	}
	public void setAtt_state(String att_state) {
		this.att_state = att_state;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
