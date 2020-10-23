package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginQuery extends DBConnection{
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public String login(String id, String pwd) {
		String result = null;
		String sql = "SELECT * FROM ADMININFO WHERE ADMIN_ID = ? AND ADMIN_PWD = ?";
		try {
			ps = getConnect().prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getString("ADMIN_NAME");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public int updatePwd(String id, String pwd) {
		int result = -1;
		try {
			ps = getConnect().prepareStatement("UPDATE ADMININFO SET ADMIN_PWD = '" + pwd + "' WHERE ADMIN_ID = '" + id + "'" );
			result = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return result;
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
