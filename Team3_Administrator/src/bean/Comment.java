package bean;

public class Comment {
	private int cmt_index;
	private int cmt_num;
	private String cmt_writer;
	private String cmt_content;
	private String cmt_date;
	private int cmt_id;

	public Comment() {
	}

	public Comment(int cmt_index, int cmt_num, String cmt_writer, String cmt_content, int cmt_id) {
		this.cmt_index = cmt_index;
		this.cmt_num = cmt_num;
		this.cmt_writer = cmt_writer;
		this.cmt_content = cmt_content;
		this.cmt_id = cmt_id;
	}
	
	public Comment(int cmt_index, int cmt_num, String cmt_writer, String cmt_content, String cmt_date, int cmt_id) {
		this.cmt_index = cmt_index;
		this.cmt_num = cmt_num;
		this.cmt_writer = cmt_writer;
		this.cmt_content = cmt_content;
		this.cmt_date = cmt_date;
		this.cmt_id = cmt_id;
	}
	
	public int getCmt_index() {
		return cmt_index;
	}
	public void setCmt_index(int cmt_index) {
		this.cmt_index = cmt_index;
	}
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}
	public String getCmt_writer() {
		return cmt_writer;
	}
	public void setCmt_writer(String cmt_writer) {
		this.cmt_writer = cmt_writer;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(String cmt_date) {
		this.cmt_date = cmt_date;
	}
	public int getCmt_id() {
		return cmt_id;
	}
	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
	}
}
