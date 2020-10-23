package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.DepartmentBean;
import bean.ProfessorBean;
import bean.StudentBean;

public class ProfessorQuery extends DBConnection{
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static ProfessorQuery proQuery;
	public static ArrayList<ProfessorBean> professor;
	public static ProfessorBean proBean;
	
	public static ProfessorQuery getInstance() {
		if(proQuery == null)
			proQuery = new ProfessorQuery();
		return proQuery;
	}

	public ArrayList<ProfessorBean> getProfessorList(String proID) {
		ArrayList<ProfessorBean> p = new ArrayList<>();
		try {
			ps = getConnect().prepareStatement("SELECT * FROM PROFESSOR P, DEPARTMENT D WHERE P.PRO_MAJOR = D.DEPT_MAJORCODE AND P.PRO_ID LIKE '%"+proID+"%'");
			rs = ps.executeQuery();
			while (rs.next()) {
				p.add(new ProfessorBean(rs.getInt("PRO_ID"), 
						rs.getString("PRO_NAME"), 
						rs.getString("PRO_ENG_NAME"), 
						rs.getString("PRO_JUMIN"),
						rs.getString("DEPT_NAME"), 
						rs.getString("DEPT_MAJORNAME"),
						rs.getString("PRO_TEL"), 
						rs.getString("PRO_ADDR"), 
						rs.getString("PRO_EMAIL"))); 
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public ArrayList<ProfessorBean> getProfessor(String name){
		professor = new ArrayList<>();
		try {
			ps = getConnect().prepareStatement("SELECT * FROM PROFESSOR P, DEPARTMENT D WHERE P.PRO_MAJOR = D.DEPT_MAJORCODE AND P.PRO_NAME LIKE '%"+name+"%'");
			rs = ps.executeQuery();
			while (rs.next()) {
				professor.add(new ProfessorBean(rs.getInt("PRO_ID"), 
						rs.getString("PRO_NAME"), 
						rs.getInt("DEPT_CODE"),
						rs.getString("DEPT_NAME"),
						rs.getInt("DEPT_MAJORCODE"), 
						rs.getString("DEPT_MAJORNAME"))); 
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return professor;
	}
	
	public ArrayList<DepartmentBean> getDepartment(String name){
		ArrayList<DepartmentBean> d = new ArrayList<>();
		try {
			ps = getConnect().prepareStatement("SELECT * FROM DEPARTMENT WHERE DEPT_MAJORNAME LIKE '%"+name+"%'");
			rs = ps.executeQuery();
			while (rs.next()) {
				d.add(new DepartmentBean(rs.getInt("DEPT_CODE"), 
						rs.getString("DEPT_NAME"), 
						rs.getInt("DEPT_MAJORCODE"),
						rs.getString("DEPT_MAJORNAME"))); 
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public int enrollProfessor(ProfessorBean p) {
		int result = -1;
		try {
			ps = getConnect().prepareStatement("INSERT INTO PROFESSOR VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, p.getPro_id());
			ps.setString(2, p.getPro_jumin().substring(0, 6));
			ps.setString(3, p.getPro_name());
			ps.setString(4, p.getPro_eng_name());
			ps.setString(5, p.getPro_jumin());
			ps.setInt(6, p.getPro_majorCode());
			ps.setString(7, p.getPro_tel());
			ps.setString(8, p.getPro_addr());
			ps.setString(9, p.getPro_email());
			if(p.getFile() != null) {
				ps.setBinaryStream(10, p.getFis(), (int) p.getFile().length());
			} else {
				ps.setBinaryStream(10, null);				
			}
			result = ps.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
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
