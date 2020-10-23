package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Comment;
import bean.CommunityBean;
import bean.ProfessorBean;

public class CommunityQuery extends DBConnection{
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static CommunityQuery commQuery;
	public static ArrayList<CommunityBean> community;
	
	public static CommunityQuery getInstance() {
		if( commQuery == null)
			commQuery = new CommunityQuery();
		return commQuery;
	}

	public ArrayList<CommunityBean> getCommunity() {
		return community;
	}

	public void setCommunity(ArrayList<CommunityBean> community) {
		this.community = community;
	}
	
	public ArrayList<CommunityBean> getCommunityList(int num, String pageNumber, int searchType, String searchContent) {
		community = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet pageset = null;
		
		int absolutepage=1;
		int dbcount=0;
		
		String sql = "";
		
		if(searchType == 1) { // 제목
			searchContent = " AND COMM_TITLE LIKE '%"+searchContent+"%'";
		}else if(searchType == 2) { // 내용
			searchContent = " AND COMM_CONTENT LIKE '%"+searchContent+"%'";			
		}
		
		try {
			stmt = getConnect().createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			if(num==2) {
				pageset=stmt.executeQuery("SELECT COUNT(*) FROM COMMUNITY WHERE COMM_GROUPN IN (2,3)" + searchContent);
			}else {
				pageset=stmt.executeQuery("SELECT COUNT(*) FROM COMMUNITY WHERE COMM_GROUPN=" + num + searchContent);
			}
			
			if(pageset.next()) {
				dbcount=pageset.getInt(1);
				pageset.close();
			}
			
			if(dbcount % CommunityBean.pagesize == 0) {
				if(num == 1)
					CommunityBean.pagecountF = dbcount / (CommunityBean.pagesize);
				else if(num == 2 || num == 3)
					CommunityBean.pagecountQ = dbcount / (CommunityBean.pagesize);				
				else if(num == 4)
					CommunityBean.pagecountN = dbcount / (CommunityBean.pagesize);
			}else {
				if(num == 1)
					CommunityBean.pagecountF = dbcount / (CommunityBean.pagesize)+1;
				else if(num == 2 || num == 3)
					CommunityBean.pagecountQ = dbcount / (CommunityBean.pagesize)+1;				
				else if(num == 4)
					CommunityBean.pagecountN = dbcount / (CommunityBean.pagesize)+1;
			}
			
			if(pageNumber != null) {
				if(num == 1) {
					CommunityBean.pageNUMF = Integer.parseInt(pageNumber);
					absolutepage=(CommunityBean.pageNUMF-1) 
							* CommunityBean.pagesize+1;
				}else if(num == 2 || num == 3) {
					CommunityBean.pageNUMQ = Integer.parseInt(pageNumber);
					absolutepage=(CommunityBean.pageNUMQ-1) 
							* CommunityBean.pagesize+1;
				}else if(num == 4) {
					CommunityBean.pageNUMN = Integer.parseInt(pageNumber);
					absolutepage=(CommunityBean.pageNUMN-1) 
							* CommunityBean.pagesize+1;
				}
			}

			if(num==2) {
				sql = "SELECT C.*, CNT.CONT FROM COMMUNITY C LEFT JOIN (SELECT CMT_INDEX, COUNT(*) CONT FROM COMMENTS GROUP BY CMT_INDEX) CNT ON CNT.CMT_INDEX = C.COMM_INDEX WHERE C.COMM_GROUPN IN (2,3)"+ searchContent +" ORDER BY COMM_REF DESC, COMM_STEP ASC";
			}else {
				sql = "SELECT C.*, CNT.CONT FROM COMMUNITY C LEFT JOIN (SELECT CMT_INDEX, COUNT(*) CONT FROM COMMENTS GROUP BY CMT_INDEX) CNT ON CNT.CMT_INDEX = C.COMM_INDEX WHERE C.COMM_GROUPN = " + num + searchContent + " ORDER BY COMM_REF DESC, COMM_STEP ASC";
			}

			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				rs.absolute(absolutepage);
				int count=0;
				while (count < CommunityBean.pagesize) {
					community.add(new CommunityBean(
							rs.getInt("COMM_INDEX"),
							rs.getInt("COMM_NUM"),
							rs.getInt("COMM_GROUPN"),
							rs.getDate("COMM_DATE"), 
							rs.getString("COMM_TITLE"),
							rs.getString("COMM_CONTENT"), 
							rs.getInt("COMM_HITS"),
							rs.getString("COMM_WRITER"),
							rs.getString("COMM_ORIGINFILENAME"),
							rs.getString("COMM_SYSTEMFILENAME"),
							rs.getInt("COMM_REF"),
							rs.getInt("COMM_STEP"),
							rs.getInt("COMM_LEVEL"),
							rs.getInt("CONT")));
					if(rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					count++;
				}
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		setCommunity(community);
		return community;
	}
	
	public int insertCommunity(CommunityBean c) {
		int result = -1;
		int index_max = 1;
		int max = 1;
		
		int comm_index = c.getComm_index();
		int ref = c.getComm_ref();
		int step = c.getComm_step();
		int level = c.getComm_level();
		int groupn = c.getComm_groupN();
		try {
			ps = getConnect().prepareStatement("SELECT MAX(COMM_INDEX)+1 MAX FROM COMMUNITY");
			rs = ps.executeQuery();
			if(rs.next()) {
				index_max = rs.getInt("MAX");
			}
			if(groupn == 2 || groupn == 3)
				ps = conn.prepareStatement("SELECT MAX(COMM_NUM)+1 MAX FROM COMMUNITY WHERE COMM_GROUPN IN (2,3)");
			else
				ps = conn.prepareStatement("SELECT MAX(COMM_NUM)+1 MAX FROM COMMUNITY WHERE COMM_GROUPN IN ("+groupn+")");
			rs = ps.executeQuery();
			if(rs.next()) {
				max = rs.getInt("MAX");
				max = max == 0? 1 : max;
			}

			if(comm_index != 0) {
				ps=conn.prepareStatement("UPDATE COMMUNITY SET COMM_STEP = COMM_STEP+1 WHERE COMM_REF=? AND COMM_STEP > ?");
				ps.setInt(1, ref);
				ps.setInt(2, step);
				ps.executeUpdate();
				step=step+1;
				level=level+1;
			}else {
				ref=index_max;
				step=0;
				level=0;
			}
			
			ps = conn.prepareStatement("INSERT INTO COMMUNITY (COMM_INDEX, COMM_NUM, COMM_GROUPN, COMM_TITLE, COMM_CONTENT, COMM_WRITER, COMM_STU_ID, COMM_STEP, COMM_LEVEL, COMM_REF, COMM_ORIGINFILENAME, COMM_SYSTEMFILENAME) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, index_max);
			ps.setInt(2, max);
			ps.setInt(3, c.getComm_groupN());
			ps.setString(4, c.getComm_title());
			ps.setString(5, c.getComm_content());
			ps.setString(6, c.getComm_writer());
			ps.setInt(7, c.getComm_id());
			ps.setInt(8, step);
			ps.setInt(9, level);
			ps.setInt(10, ref);
			ps.setString(11, c.getComm_originFileName());
			ps.setString(12, c.getComm_systemFileName());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public int[] getMaxCommIndex(int groupn) {
		int max[] = new int[2];
		try {
			ps = getConnect().prepareStatement("SELECT MAX(COMM_INDEX)+1 MAX FROM COMMUNITY");
			rs = ps.executeQuery();
			if(rs.next()) {
				max[0] = rs.getInt("MAX");
			}
			if(groupn == 1)
				ps = conn.prepareStatement("SELECT MAX(COMM_NUM)+1 MAX FROM COMMUNITY WHERE COMM_GROUPN = 1");
			else if(groupn == 2 || groupn == 3)
				ps = conn.prepareStatement("SELECT MAX(COMM_NUM)+1 MAX FROM COMMUNITY WHERE COMM_GROUPN IN (2,3)");
			
			rs = ps.executeQuery();
			if(rs.next()) {
				max[1] = rs.getInt("MAX");
				max[1] = max[1] == 0? 1 : max[1];
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return max;
	}
	
	
	public int deleteCommunity(String index, int groupN) {
		int result = -1;
		try {
			if(groupN == 2 || groupN == 3)
				ps = getConnect().prepareStatement("DELETE FROM COMMUNITY WHERE COMM_NUM IN " + index + "AND COMM_GROUPN IN (2, 3)");
			else
				ps = getConnect().prepareStatement("DELETE FROM COMMUNITY WHERE COMM_NUM IN " + index + "AND COMM_GROUPN = " + groupN);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public int updateCommunity(int index, String title, String content, String orgName, String sysName) {
		int result = -1;
		try {
			ps = getConnect().prepareStatement("UPDATE COMMUNITY SET COMM_TITLE = ?, COMM_CONTENT = ?, COMM_ORIGINFILENAME = ?, COMM_SYSTEMFILENAME = ? WHERE COMM_GROUPN = 4 AND COMM_INDEX= ?");
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, orgName);
			ps.setString(4, sysName);
			ps.setInt(5, index);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public int writeComment(Comment c) {
		int result = -1;
		int max = 1;
		try {
			ps = getConnect().prepareStatement("SELECT MAX(CMT_NUM) MAX FROM COMMENTS WHERE CMT_INDEX = " + c.getCmt_index());
			rs = ps.executeQuery();
			if(rs.next()) {
				max = rs.getInt("MAX")+1;
			}
			ps = conn.prepareStatement("INSERT INTO COMMENTS (CMT_INDEX, CMT_NUM, CMT_GROUPN, CMT_REF, CMT_WRITER, CMT_CONTENT, CMT_STU_ID) VALUES (?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, c.getCmt_index());
			ps.setInt(2, max);
			ps.setString(3, c.getCmt_writer());
			ps.setString(4, c.getCmt_content());
			ps.setInt(5, c.getCmt_id());
			
			result = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public ArrayList<Comment> getComments(int cmt_index){
		ArrayList<Comment> comment = new ArrayList<Comment>();
		
		try {
			ps = getConnect().prepareStatement("SELECT * FROM COMMENTS WHERE CMT_INDEX = " + cmt_index + "  ORDER BY CMT_NUM DESC");
			rs = ps.executeQuery();
			while(rs.next()) {
				Comment c = new Comment();
				c.setCmt_index(rs.getInt("CMT_INDEX"));
				c.setCmt_num(rs.getInt("CMT_NUM"));
				c.setCmt_writer(rs.getString("CMT_WRITER"));
				c.setCmt_content(rs.getString("CMT_CONTENT"));
				c.setCmt_date(rs.getString("CMT_DATE"));
				comment.add(c);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return comment;
	}
	
	
	public void close() {
		try {
			dbClose();
			if (ps != null)
				ps.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
