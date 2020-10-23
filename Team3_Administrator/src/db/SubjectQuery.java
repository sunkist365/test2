package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.DepartmentBean;
import bean.StudentBean;
import bean.SubjectBean;

public class SubjectQuery extends DBConnection {
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ArrayList<SubjectBean> getSubjectList(String subj_name) {
		ArrayList<SubjectBean> subject = new ArrayList<>();
		try {
			ps = getConnect().prepareStatement("SELECT S.*, P.PRO_NAME, D.DEPT_MAJORNAME FROM SUBJECT S, PROFESSOR P, DEPARTMENT D WHERE S.SUBJ_PRO = P.PRO_ID AND S.SUBJ_MAJORCODE = D.DEPT_MAJORCODE AND DEPT_MAJORNAME LIKE '%" + subj_name+ "%'");
			rs = ps.executeQuery();
			while (rs.next()) {
				SubjectBean s = new SubjectBean();
				s.setSubj_code(rs.getInt("SUBJ_CODE"));
				s.setSubj_state(rs.getString("SUBJ_STATE"));
				s.setSubj_majorname(rs.getString("DEPT_MAJORNAME"));
				s.setSubj_name(rs.getString("SUBJ_NAME"));
				s.setSubj_hakjum(rs.getInt("SUBJ_HAKJUM"));
				s.setSubj_room(rs.getString("SUBJ_ROOM"));
				s.setSubj_proname(rs.getString("PRO_NAME"));
				subject.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return subject;
	}
	
	public int enrollSubject(SubjectBean sb) {
		int result = -1;
		try {
			ps = getConnect().prepareStatement("INSERT INTO SUBJECT VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, sb.getSubj_code());
			ps.setString(2, sb.getSubj_state());
			ps.setInt(3, sb.getSubj_majorcode());
			ps.setString(4, sb.getSubj_name());
			ps.setInt(5, sb.getSubj_hakjum());
			ps.setInt(6, sb.getSubj_pro());
			ps.setString(7, sb.getSubj_room());
			ps.setString(8, sb.getSubj_day1());
			ps.setString(9, sb.getSubj_day2());
			result = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public ArrayList<DepartmentBean> getDepartmentList(){
		ArrayList<DepartmentBean> department = new ArrayList<DepartmentBean>();
		try {
			ps = getConnect().prepareStatement("SELECT DEPT_MAJORCODE, DEPT_MAJORNAME FROM DEPARTMENT");
			rs = ps.executeQuery();
			while(rs.next()) {
				DepartmentBean d = new DepartmentBean();
				d.setMajor_code(rs.getInt("DEPT_MAJORCODE"));
				d.setMajor_name(rs.getString("DEPT_MAJORNAME"));
				department.add(d);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return department;
	}
	
	public int deleteSubject(String index) {
		int result = -1;
		try {
			ps = getConnect().prepareStatement("DELETE FROM SUBJECT WHERE SUBJ_CODE IN " + index);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
