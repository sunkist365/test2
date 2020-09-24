package magic.member;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean();
	
	//인스턴스
	public static MemberDBBean getInstance() { 
		return instance;
	}
	
	//DBCP 연결
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//DB에 입력(id,pw,name,email,regdate,address)
	public int insertMember(MemberBean member) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into memberT values(?,?,?,?,?,?)";
		int re = -1;
		
		try {
			con=getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMem_uid());
			pstmt.setString(2, member.getMem_pwd());
			pstmt.setString(3, member.getMem_name());
			pstmt.setString(4, member.getMem_email());
			pstmt.setTimestamp(5, member.getMem_regdate());
			pstmt.setString(6, member.getMem_addr());
			
			pstmt.executeUpdate();
			re=1;
			
			pstmt.close();
			con.close();
		}catch(Exception e) {
			System.out.println("입력 실패");
			e.printStackTrace();
		}
		return re;	//re = 1이면 정상
	}
	
	//중복된 id가 있는지 확인.
	public int confirmID(String id) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null; //select문을 쓸땐 resultset이 있어야함.
		
		String sql ="select mem_uid from memberT where mem_uid=?";
		int re=-1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re = 1;		//1이면 중복된 id 존재
			}else {
				re = -1;	//-1이면 새로운 id 생성
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	//id와 pwd를 입력받아 로그인체크
	public int userCheck(String id, String pwd) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql ="select mem_pwd from memberT where mem_uid=?";
		String db_mem_pwd;
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	//입력받은 id가 있을때
				db_mem_pwd = rs.getString("mem_pwd");
				if(db_mem_pwd.equals(pwd)) { //id에 해당하는 pwd가 맞을때
					re = 1;	
				}else { //id에 해당하는 pwd가 다를때
					re = 0;	
				}
			}else { //입력받은 idrk
				re = -1;	
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	//id를 입력받으면 그에 해당하는 MemberBean이 나옴.
	public MemberBean getMember(String id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from memberT where mem_uid = ?";
		MemberBean member = null;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberBean();
				member.setMem_uid(rs.getString("mem_uid"));
				member.setMem_pwd(rs.getString("mem_pwd"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_email(rs.getString("mem_email"));
				member.setMem_regdate(rs.getTimestamp("mem_regdate"));
				member.setMem_addr(rs.getString("mem_address"));
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	// MemberBean 입력받아서 DB업데이트.
	public int updateMember(MemberBean member) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update memberT set mem_pwd=?, mem_email=?, mem_address=? where mem_uid=?";
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMem_pwd());
			pstmt.setString(2, member.getMem_email());
			pstmt.setString(3, member.getMem_addr());
			pstmt.setString(4, member.getMem_uid());
			re = pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			System.out.println("변경성공");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("변경실패");
		}
		return re;
	}
	
//	public int deleteMember(MemberBean member)	throws Exception{
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = "delete memberT where mem_uid=? and mem_pwd=?";
//		return 1;
//	}
}
