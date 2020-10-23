package db;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.AttendBean;
import bean.ClassBean;
import bean.ProfessorBean;
import bean.StudentBean;

public class StudentQuery extends DBConnection{

	PreparedStatement ps = null;
	ResultSet rs = null;

	public static StudentQuery stuQuery;
	ArrayList<StudentBean> student;
	
	public static StudentQuery getInstance() {
		if(stuQuery == null)
			stuQuery = new StudentQuery();
		return stuQuery;
	}
	
	public ArrayList<StudentBean> getStudent() {
		return student;
	}

	public void setStudent(ArrayList<StudentBean> student) {
		this.student = student;
	}
	
	public StudentBean getStudent(int id) {
		StudentBean student = null;
		try {
			ps = getConnect().prepareStatement("SELECT * FROM STUDENT S, DEPARTMENT D, PROFESSOR P WHERE S.STU_MAJOR = D.DEPT_MAJORCODE AND S.STU_PRO = P.PRO_ID AND S.STU_ID = ? ORDER BY 1");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				student = new StudentBean(rs.getInt("STU_ID"), rs.getString("STU_NAME"), rs.getInt("STU_GRADE"), rs.getString("DEPT_NAME"), rs.getString("DEPT_MAJORNAME"), rs.getInt("STU_STATE"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		return student;
	}
	
	public ArrayList<StudentBean> getStudentList(String stu_id) {
		student = new ArrayList<>();
		try {
			ps = getConnect().prepareStatement("SELECT * FROM STUDENT S, DEPARTMENT D, PROFESSOR P WHERE S.STU_MAJOR = D.DEPT_MAJORCODE AND S.STU_PRO = P.PRO_ID AND S.STU_ID LIKE '%"+stu_id+"%' ORDER BY 1");
			rs = ps.executeQuery();
			while (rs.next()) {
				student.add(new StudentBean(rs.getInt("STU_ID"), 
						rs.getString("STU_NAME"), 
						rs.getString("STU_ENG_NAME"), 
						rs.getString("STU_JUMIN"),
						rs.getInt("STU_STATE"),
						rs.getString("DEPT_NAME"),
						rs.getString("DEPT_MAJORNAME"), 
						rs.getInt("STU_GRADE"), 
						rs.getString("PRO_NAME"), 
						rs.getString("STU_TEL"), 
						rs.getString("STU_EMG_TEL"),
						rs.getString("STU_ADDR"), 
						rs.getString("STU_EMAIL")));
			}

			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
	}
	
	public int enrollStudent(StudentBean s) {
		int result = -1;
		try {
			ps = getConnect().prepareStatement("INSERT INTO STUDENT VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, s.getStu_id());
			ps.setString(2, s.getStu_jumin().substring(0, 6));
			ps.setString(3, s.getStu_name());
			ps.setString(4, s.getStu_eng_name());
			ps.setString(5, s.getStu_jumin());
			ps.setInt(6, s.getStu_state());
			ps.setInt(7, s.getStu_major_int());
			ps.setInt(8, s.getStu_grade());
			ps.setInt(9, s.getStu_pro_int());
			ps.setString(10, s.getStu_tel());
			ps.setString(11, s.getStu_emgTel());
			ps.setString(12, s.getStu_addr());
			ps.setString(13, s.getStu_email());
			if(s.getFile() != null) {
				ps.setBinaryStream(14, s.getFis(), (int) s.getFile().length());
			} else {
				ps.setBinaryStream(14, null);				
			}
			result = ps.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Integer> getYear(int stu_id) {
		ArrayList<Integer> year = new ArrayList<Integer>();
		try {
			ps = getConnect().prepareStatement("SELECT DISTINCT SC_YEAR FROM SCORECLASS WHERE SC_STU_ID = " + stu_id + " ORDER BY 1");
			rs = ps.executeQuery();
			int cnt = 0;
			while (rs.next()) {
				year.add(rs.getInt("SC_YEAR"));
				cnt++;
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return year;
	}
	
	public ArrayList<ClassBean> getClassInfo(int stu_id, int year, int semester){
		ArrayList<ClassBean> cb = new ArrayList<ClassBean>();
		try {
			 ps = getConnect().prepareStatement("SELECT S.SUBJ_CODE, S.SUBJ_STATE, S.SUBJ_NAME, S.SUBJ_HAKJUM, P.PRO_NAME "
			 		+ "FROM SUBJECT S, PROFESSOR P, SCORECLASS SC "
			 		+ "WHERE S.SUBJ_CODE = SC.SC_SUBJ_CODE "
			 		+ "AND S.SUBJ_PRO = P.PRO_ID "
			 		+ "AND P.PRO_ID = SC.SC_PRO_ID "
			 		+ "AND SC.SC_STU_ID = ? "
			 		+ "AND SC.SC_YEAR = ? "
			 		+ "AND SC.SC_SEMESTER = ?");			 
			 ps.setInt(1, stu_id);
			 ps.setInt(2, year);
			 ps.setInt(3, semester);
			 rs = ps.executeQuery();
			 while(rs.next()) {
				 cb.add(new ClassBean(stu_id, year, semester, rs.getInt("SUBJ_CODE"), rs.getString("SUBJ_STATE"), rs.getString("SUBJ_NAME"), rs.getInt("SUBJ_HAKJUM"), rs.getString("PRO_NAME")));
			 }
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cb;
	}
	
	public ArrayList<ClassBean> getGradeInfo(int stu_id, int year, int semester){
		ArrayList<ClassBean> cb = new ArrayList<ClassBean>();
		try {
			ps = getConnect().prepareStatement("SELECT "
					+ "S.SUBJ_CODE, "
					+ "S.SUBJ_STATE, "
					+ "S.SUBJ_NAME, "
					+ "S.SUBJ_HAKJUM, "
					+ "SC.SC_YEAR, "
					+ "SC.SC_SEMESTER, "
					+ "SC_RETAKE, "
					+ "SC_SCORE "
					+ "FROM SUBJECT S, SCORECLASS SC  "
					+ "WHERE S.SUBJ_CODE = SC.SC_SUBJ_CODE "
					+ "AND SC.SC_STU_ID = ?"
					+ "AND SC.SC_YEAR = ?"
					+ "AND SC.SC_SEMESTER = ?");
			ps.setInt(1,  stu_id);
			ps.setInt(2, year);
			ps.setInt(3, semester);
			rs = ps.executeQuery();
			while(rs.next()) {
				cb.add(new ClassBean(stu_id, rs.getInt("SUBJ_CODE"), rs.getString("SUBJ_STATE"), rs.getString("SUBJ_NAME"), rs.getInt("SUBJ_HAKJUM"), rs.getInt("SC_YEAR"), rs.getInt("SC_SEMESTER"), rs.getDouble("SC_SCORE"), rs.getString("SC_RETAKE")));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cb;
	}
	
	public ArrayList<AttendBean> getAttendInfo(int stu_id, int year, int semester, int subjCode){
		ArrayList<AttendBean> ab = new ArrayList<AttendBean>();
		try {
			 ps = getConnect().prepareStatement("SELECT TO_CHAR(ATD_DATE, 'YYYY-MM-DD') ATD_DATE, ATD_STATE, ATD_REMARK FROM ATTEND WHERE ATD_STU_ID = ? AND ATD_YEAR = ? AND ATD_SEMESTER = ? AND ATD_SUBJ_CODE = ?");
			 ps.setInt(1, stu_id);
			 ps.setInt(2, year);
			 ps.setInt(3, semester);
			 ps.setInt(4, subjCode);
			 rs = ps.executeQuery();
			 while(rs.next()) {
				 ab.add(new AttendBean(rs.getString("ATD_DATE"), rs.getString("ATD_STATE"), ""));
			 }
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return ab;
	}
	
	public ArrayList<ClassBean> getTotalScore(int stu_id){
		ArrayList<ClassBean> total = new ArrayList<ClassBean>();
		try {
			ps = getConnect().prepareStatement("SELECT * FROM TOTALSCORE WHERE STU_ID = ?");
			ps.setInt(1, stu_id);
			rs = ps.executeQuery();
			while(rs.next()) {
				ClassBean c = new ClassBean();
				c.setStu_id(rs.getInt("STU_ID"));
				c.setYear(rs.getInt("YEAR"));
				c.setSemester(rs.getInt("SEMESTER"));
				c.setAcquired(rs.getInt("ACQUIRED"));
				c.setTotal(rs.getInt("TOTAL"));
				c.setAvg(rs.getDouble("AVG"));
				c.setPercentage(rs.getDouble("PERCENTAGE"));
				total.add(c);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return total;
	}
	
	public double[] getOverallGrade(int stu_id) {
		double[] result = new double[2];
		try {
			ps = getConnect().prepareStatement("SELECT * FROM OVERALLGRADE WHERE STU_ID = ?");
			ps.setInt(1, stu_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				result[0] = rs.getDouble("TOTAL");
				result[1] = rs.getDouble("RATIO");
			}
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
