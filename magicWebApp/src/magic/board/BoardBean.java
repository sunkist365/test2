package magic.board;

import java.sql.Timestamp;

public class BoardBean {
	private int b_id;
	private String b_name;
	private String b_email;
	private String b_title;
	private String b_content;
	private Timestamp b_date;
	private String date2;
	private int b_hit;
	private String b_pwd;
	private String b_ip;
	private int b_ref=0;
	private int b_step=0;
	private int b_level=0;
	
	public static int dataPerPage = 10; //한 페이지에 보일 게시물 수
	public static int totalPage = 1;	//총 페이지 수 (총 데이터 수 / dataPerPage)
	public static int currentPage = 1;	//현재 페이지 
	
	//리스트 하단에 보여질 페이지이동 만들기
	//block : 하단에 보여질 페이지 갯수
	public static String pageNumber1(int block) {
		StringBuffer stringBuffer = new StringBuffer();
		
		//하단에 보여질 페이지의 첫번째 숫자 구하기 (block을 5로 했을때, 1,6,11...)
		int temp = ()
	}
	
	public static int pagesize=10; //한 페이지에 보일 게시물갯수
	public static int pagecount=1;	//총 페이지 수
	public static int pageNUM=1;	//현재페이지 번호
	
	public static String pageNumber(int limit) { //limit는 보여질 페이지 갯수
		String str="";
		int temp=(pageNUM-1)%limit;
		int startPage = pageNUM - temp; //보여질 처음 페이지 숫자
		
		if((startPage -limit) > 0) {
			str = "<a href='list.jsp?pageNUM="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if(i == pageNUM) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='list.jsp?pageNUM="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			
			if(i>=pagecount) break;
		}
		
		if((startPage + limit) <= pagecount) {
			str += "<a href='list.jsp?pageNUM="+(startPage+limit)+"'>[다음]</a>";
		}
		return str;
	}
	

	public int getB_ref() {
		return b_ref;
	}
	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}
	public int getB_step() {
		return b_step;
	}
	public void setB_step(int b_step) {
		this.b_step = b_step;
	}
	public int getB_level() {
		return b_level;
	}
	public void setB_level(int b_level) {
		this.b_level = b_level;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public Timestamp getB_date() {
		return b_date;
	}
	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	

}
