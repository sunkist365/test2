package bean;

import java.sql.Date;

public class CommunityBean {
	private int comm_index;
	private int comm_num; // 글번호
	private int comm_groupN; // 글분류
	private Date comm_date; // 작성일자
	private String comm_title; // 제목
	private String comm_content; // 내용
	private int comm_hits; // 조회수
	private String comm_writer; // 작성자
	private int comm_id; 
	private String comm_originFileName;
	private String comm_systemFileName;
	private int comm_ref;
	private int comm_step;
	private int comm_level;
	private int comm_cmtNum;
	
	public static int pagesize = 20;

	public static int pagecountF = 1;
	public static int pageNUMF = 1;

	public static int pagecountQ = 1;
	public static int pageNUMQ = 1;

	public static int pagecountN = 1;
	public static int pageNUMN = 1;

	public static String pageNumberFree(int limit) {
		String str="";
		int temp=(pageNUMF-1) % limit;
		int startPage = pageNUMF - temp;
		
		if((startPage - limit) > 0) {
			str = "<a href='free_Board.jsp?pageNUMF="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if(i == pageNUMF) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='free_Board.jsp?pageNUMF="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			
			if(i >= pagecountF) break;
		}
		
		if ((startPage+limit) <= pagecountF) {
			str += "<a href='free_Board.jsp?pageNUMF="+(startPage+limit)
					+"'>[다음]</a>";
		}
		return str;
	}
	
	public static String pageNumberqANDa(int limit) {
		String str="";
		int temp=(pageNUMQ-1) % limit;
		int startPage = pageNUMQ - temp;

		if((startPage - limit) > 0) {
			str = "<a href='q_And_a.jsp?pageNUMQ="+(startPage-1)
				+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if(i == pageNUMQ) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='q_And_a.jsp?pageNUMQ="+i
						+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			
			if(i >= pagecountQ) break;
		}
		
		if ((startPage+limit) <= pagecountQ) {
			str += "<a href='q_And_a.jsp?pageNUMQ="+(startPage+limit)
					+"'>[다음]</a>";
		}
		return str;
	}
	
	public static String pageNumberNotice(int limit) {
		String str="";
		int temp=(pageNUMN-1) % limit;
		int startPage = pageNUMN - temp;
	
		if((startPage - limit) > 0) {
			str = "<a href='notice.jsp?pageNUMN="+(startPage-1)
				+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if(i == pageNUMN) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='notice.jsp?pageNUMN="+i
						+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			
			if(i >= pagecountN) break;
		}
		
		if ((startPage+limit) <= pagecountN) {
			str += "<a href='notice.jsp?pageNUMN="+(startPage+limit)
					+"'>[다음]</a>";
		}
		return str;
	}
	
	public CommunityBean() {}
	
	public CommunityBean(String comm_originFileName, String comm_systemFileName) {
		this.comm_originFileName = comm_originFileName;
		this.comm_systemFileName = comm_systemFileName;
	}

	public CommunityBean(int comm_num, int comm_groupN, String comm_title, String comm_content) {
		this.comm_num = comm_num;
		this.comm_groupN = comm_groupN;
		this.comm_title = comm_title;
		this.comm_content = comm_content;
	}
	
	public CommunityBean(int comm_index, int comm_num, int comm_groupN, Date comm_date, String comm_title, String comm_content, int comm_hits, String comm_writer, String comm_originFileName, String comm_systemFileName, int comm_ref, int comm_step, int comm_level, int comm_cmtNum) {
		this.comm_index = comm_index;
		this.comm_num = comm_num;
		this.comm_groupN = comm_groupN;
		this.comm_date = comm_date;
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.comm_hits = comm_hits;
		this.comm_writer = comm_writer;
		this.comm_originFileName  = comm_originFileName;
		this.comm_systemFileName = comm_systemFileName;
		this.comm_ref = comm_ref;
		this.comm_step = comm_step;
		this.comm_level = comm_level;
		this.comm_cmtNum = comm_cmtNum;
	}
	
	public int getComm_index() {
		return comm_index;
	}

	public void setComm_index(int comm_index) {
		this.comm_index = comm_index;
	}

	public int getComm_num() {
		return comm_num;
	}

	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}

	public int getComm_groupN() {
		return comm_groupN;
	}

	public void setComm_groupN(int comm_groupN) {
		this.comm_groupN = comm_groupN;
	}

	public Date getComm_date() {
		return comm_date;
	}

	public void setComm_date(Date comm_date) {
		this.comm_date = comm_date;
	}

	public String getComm_title() {
		return comm_title;
	}

	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public int getComm_hits() {
		return comm_hits;
	}

	public void setComm_hits(int comm_hits) {
		this.comm_hits = comm_hits;
	}

	public String getComm_writer() {
		return comm_writer;
	}

	public void setComm_writer(String comm_writer) {
		this.comm_writer = comm_writer;
	}

	public String getComm_originFileName() {
		return comm_originFileName;
	}

	public void setComm_originFileName(String comm_originFileName) {
		this.comm_originFileName = comm_originFileName;
	}

	public String getComm_systemFileName() {
		return comm_systemFileName;
	}

	public void setComm_systemFileName(String comm_systemFileName) {
		this.comm_systemFileName = comm_systemFileName;
	}

	public int getComm_ref() {
		return comm_ref;
	}

	public void setComm_ref(int comm_ref) {
		this.comm_ref = comm_ref;
	}

	public int getComm_step() {
		return comm_step;
	}

	public void setComm_step(int comm_step) {
		this.comm_step = comm_step;
	}

	public int getComm_level() {
		return comm_level;
	}

	public void setComm_level(int comm_level) {
		this.comm_level = comm_level;
	}

	public int getComm_cmtNum() {
		return comm_cmtNum;
	}

	public void setComm_cmtNum(int comm_cmtNum) {
		this.comm_cmtNum = comm_cmtNum;
	}

	public int getComm_id() {
		return comm_id;
	}

	public void setComm_id(int comm_id) {
		this.comm_id = comm_id;
	}
}
