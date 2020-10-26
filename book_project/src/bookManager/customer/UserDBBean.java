package bookManager.customer;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDBBean {
	private static UserDBBean instance = new UserDBBean();
	
	public static UserDBBean getinstance() {
		return instance;
	}
	
	public Connection getMySQLConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	//id를 넣어 유저정보를 가져온다.
	public UserBean getUser(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from Customer where cs_id = ?";
		UserBean user = null;
		
		try {
			conn = getMySQLConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserBean();
				user.setCs_id(rs.getString("cs_id"));
				user.setCs_pwd(rs.getString("cs_pwd"));
				user.setCs_name(rs.getString("cs_name"));
				user.setCs_tel(rs.getString("cs_tel"));
				user.setCs_address(rs.getString("cs_address"));
				user.setCs_email(rs.getString("cs_email"));
				user.setCs_favorite(rs.getString("cs_favorite"));
				user.setCs_grade(rs.getString("cs_grade"));
				user.setCs_point(rs.getInt("cs_point"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, null, pstmt, rs);
		}
		return user;
	}

	//로그인
	//id와 pwd를 입력받아 db에 입력된 정보와맞는지 확인
	public int userCheck(String id, String pwd) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql ="select cs_pwd from Customer where cs_id=?";
		String db_cs_pwd;
		int re = -1;
		
		try {
			conn = getMySQLConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	//입력받은 id가 있을때
				db_cs_pwd = rs.getString("cs_pwd");
				if(db_cs_pwd.equals(pwd)) { //id에 해당하는 pwd가 맞을때
					re = 1;	
				}else { //id에 해당하는 pwd가 다를때
					re = 0;	
				}
			}else { //입력받은 id가 없을때
				re = -1;	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, null, pstmt, rs);
		}
		return re;
	}
	
	//회원가입
	//유저 입력
	public int insertUser(UserBean user) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="";
		
		try {
			conn = getMySQLConnection();
			
			sql = "insert into Customer(cs_id,cs_pwd,cs_name,cs_tel,cs_address,cs_email) "
					+ "values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getCs_id());
			pstmt.setString(2, user.getCs_pwd());
			pstmt.setString(3, user.getCs_name());
			pstmt.setString(4, user.getCs_tel());
			pstmt.setString(5, user.getCs_address());
			pstmt.setString(6, user.getCs_email());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, null, pstmt, rs);
		}
		return 1;
	}

	//회원가입
	//중복id 확인
	public int confirmID(String id) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null; 
		
		String sql ="select cs_id from Customer where cs_id=?";
		int re=-1;
		
		try {
			conn = getMySQLConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re = 1;		//1이면 중복된 id 존재
			}else {
				re = -1;	//-1이면 새로운 id 생성
			}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, null, pstmt, rs);
		}
		return re;
	}
	
	public static void close(Connection conn, Statement stmt, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(stmt !=null) stmt.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}



