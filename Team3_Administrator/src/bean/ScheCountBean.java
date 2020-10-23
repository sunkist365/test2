package bean;

public class ScheCountBean {
	private int sche_startyear;
	private int sche_startmonth;
	private int cnt;
		
	public ScheCountBean(int sche_startyear, int sche_startmonth, int cnt) {
		this.sche_startyear = sche_startyear;
		this.sche_startmonth = sche_startmonth;
		this.cnt = cnt;
	}
	public int getSche_startyear() {
		return sche_startyear;
	}
	public void setSche_startyear(int sche_startyear) {
		this.sche_startyear = sche_startyear;
	}
	public int getSche_startmonth() {
		return sche_startmonth;
	}
	public void setSche_startmonth(int sche_startmonth) {
		this.sche_startmonth = sche_startmonth;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
