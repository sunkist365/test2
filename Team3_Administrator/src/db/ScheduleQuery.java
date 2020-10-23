package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ScheCountBean;
import bean.ScheduleBean;
import bean.StudentBean;

public class ScheduleQuery extends DBConnection{
	PreparedStatement ps = null;
	ResultSet rs = null;

	public static ScheduleQuery scheQuery;
	ArrayList<ScheduleBean> schedule;
	

	public static ScheduleQuery getInstance() {
		if (scheQuery == null)
			scheQuery = new ScheduleQuery();
		return scheQuery;
	}

	public ArrayList<ScheduleBean> getSchedule() {
		return schedule;
	}

	public void setSchedule(ArrayList<ScheduleBean> schedule) {
		this.schedule = schedule;
	}
	
	public ArrayList<ScheCountBean> getCount(int year){
		ArrayList<ScheCountBean> scheCnt = new ArrayList<>();
		try {
			ps = getConnect().prepareStatement("SELECT SCHE_STARTYEAR, SCHE_STARTMONTH, COUNT(*) CNT FROM SCHEDULE GROUP BY SCHE_STARTYEAR, SCHE_STARTMONTH HAVING SCHE_STARTYEAR = " + year + " ORDER BY 1 , 2, 3");
			rs = ps.executeQuery();
			while(rs.next()) {
				scheCnt.add(new ScheCountBean(
						rs.getInt("SCHE_STARTYEAR"),
						rs.getInt("SCHE_STARTMONTH"),
						rs.getInt("CNT")));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		close();
		return scheCnt;
	}
	
	public int addSchedule(ScheduleBean s) {
		int result = -1;
		int max = 0;
		try {
			ps = getConnect().prepareStatement("SELECT MAX(SCHE_NUM) M FROM SCHEDULE");
			rs = ps.executeQuery();
			if(rs.next())
				max = rs.getInt("M")+1;
			ps = conn.prepareStatement("INSERT INTO SCHEDULE VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, max);
			ps.setString(2, s.getSche_content());
			ps.setInt(3, s.getSche_sYear());
			ps.setInt(4, s.getSche_sMonth());
			ps.setInt(5, s.getSche_sDay());
			ps.setInt(6, s.getSche_eYear());
			ps.setInt(7, s.getSche_eMonth());
			ps.setInt(8, s.getSche_eDay());
			ps.setInt(9, s.isSche_holiday() == true? 1 : 0);
			result = ps.executeUpdate();
		}catch (Exception e) {
			System.out.println(getClass() + " >> addSchedule() >> " + e.getMessage());
		}
		close();
		return result;
	}
	
	public ArrayList<ScheduleBean> getScheduleList(int year) {
		schedule = new ArrayList<>();
		try {
			ps = getConnect().prepareStatement("SELECT * FROM SCHEDULE WHERE SCHE_STARTYEAR = " + year + " ORDER BY SCHE_STARTYEAR, SCHE_STARTMONTH, SCHE_STARTDAY");
			rs = ps.executeQuery();
			while (rs.next()) {
				boolean bol = rs.getInt("SCHE_HOLIDAY") == 1 ? true : false; 
				schedule.add(new ScheduleBean(rs.getInt("SCHE_NUM"), 
						rs.getString("SCHE_CONTENT"),
						rs.getInt("SCHE_STARTYEAR"), 
						rs.getInt("SCHE_STARTMONTH"),
						rs.getInt("SCHE_STARTDAY"),
						rs.getInt("SCHE_ENDYEAR"), 
						rs.getInt("SCHE_ENDMONTH"), 
						rs.getInt("SCHE_ENDDAY"), 
						bol));
			}

			close();
		} catch (Exception e) {
			System.out.println(getClass() + " >> getScheduleList() >> " + e.getMessage());
		}
		return schedule;
	}
	
	public int deleteSchedule(String index) {
		int result = -1;
		try {			
			ps = getConnect().prepareStatement("DELETE FROM SCHEDULE WHERE SCHE_NUM IN " + index);
			result = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		close();
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
