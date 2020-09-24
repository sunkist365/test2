package magic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//글 쓴 정보를 데이터베이스에 입력
	public int insertBoard(BoardBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = 0; //b_id
		String sql="";
		
		//답변글을 위한 변수
		int id = board.getB_id(); //원글이 있는지 없는지 확인.
		int ref = board.getB_ref();	//원글의 ref
		int step = board.getB_step(); //원글의 step
		int level = board.getB_level(); //원글의 level
		
		try {
			con = getConnection();
			
			//b_id 생성
			sql = "select max(b_id) from boardT";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			//b_id가 없으면 1생성, 이후 1씩 증가
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}else{
				num = 1;
			}
			
			//답글일때
			if(id != 0) {
				//스텝 오름(같은 ref(원글)이면서  원글스텝보다 큰 스텝을 찾아 스텝을 1증가 시킨다.)
				//같은글에 답변을 달았을때 전에 달았던 답변의 스텝이 1이 오르고 새로운 답변의 스텝을 1로 둔다.
				//정렬했을때, ref, step순으로 정렬을 할 것이기 때문에 최근의 답변에 원글 바로 밑으로 오게 한다.
				sql = "update boardT set b_step = b_step+1 where b_ref=? and b_step > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				
				step = step+1;
				level = level+1;
			//새글 작성일때
			}else {
				ref = num;
				step = 0;
				level = 0;
			}
			
			sql = "insert into boardT(b_name, b_email"
					+ ", b_title, b_content, b_id, b_date, b_pwd, b_ip, b_ref, b_step, b_level)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getB_name());
//			pstmt.setString(1, HanConv.toKor(board.getB_name())); //(euc-kr일때, 3,4번도 같이 해준다.)
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			pstmt.setInt(5, num);
			pstmt.setTimestamp(6, board.getB_date());
//			pstmt.setInt(7, 0); b_hit는 default값이 0이다.
			pstmt.setString(7, board.getB_pwd());
			pstmt.setString(8, board.getB_ip());
			pstmt.setInt(9, ref);
			pstmt.setInt(10, step);
			pstmt.setInt(11, level);
			
			
			pstmt.executeUpdate();
			
//			re = pstmt.executeUpdate();
//			System.out.println("저장 완료");
		} catch (Exception e) {
			e.printStackTrace();
//			System.out.println("저장 실패");
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();				
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
//		return re;
		return 1;
	}
	
	//게시판에 보여줄 내용(제목, 작성자, 날짜, 조회수 등)
	public ArrayList<BoardBean> listBoard(String pageNumber) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet pageset = null;
		
		int absolutepage=1; //첫번째 게시물이 있는 페이지
		int dbcount=0; //토탈 게시글 갯수
		
		String sql="";
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			//페이징을 스크롤하며 페이징, 커서단위로 게시글을 업데이트
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageset=stmt.executeQuery("select count(b_id) from boardT");
			
			//토탈 글 갯수를 담음.
			if(pageset.next()) {
				dbcount = pageset.getInt(1);
				pageset.close();
			}
			
			if(dbcount % BoardBean.pagesize == 0) {
				BoardBean.pagecount = dbcount / (BoardBean.pagesize);
			}else {
				BoardBean.pagecount = dbcount / (BoardBean.pagesize)+1;
			}
			
			if(pageNumber != null) {
				BoardBean.pageNUM = Integer.parseInt(pageNumber);
				absolutepage = (BoardBean.pageNUM-1) * BoardBean.pagesize + 1;
			}
			
//			stmt = con.createStatement();
//			sql = "select * from boardT order by b_id";
			sql = "select a.*, to_char(b_date, 'YYYY-MM-DD hh24:mi') DATE2 "
				+ "from boardT a order by b_ref desc, b_step asc";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absolutepage);
				int count=0;
				
				while(count < BoardBean.pagesize) {
					BoardBean board = new BoardBean();
					board.setB_id(rs.getInt(1));
					board.setB_name(rs.getString(2));
					board.setB_email(rs.getString(3));
					board.setB_title(rs.getString(4));
					board.setB_content(rs.getString(5));
					board.setB_date(rs.getTimestamp(6));
					board.setB_hit(rs.getInt(7));
					board.setB_pwd(rs.getString(8));
					board.setB_ip(rs.getString(9));
					board.setB_ref(rs.getInt(10));
					board.setB_step(rs.getInt(11));
					board.setB_level(rs.getInt(12));
					board.setDate2(rs.getString(13));
					
					boardList.add(board);
					
					if(rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					
					count++;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(con!=null) con.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	
	//제목을 클릭하면 게시글이 표현되는 메소드(제목에 해당하는 b_id를 넘김)
	public BoardBean getBoard(int b_id, boolean hitadd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		BoardBean board = null;		
		
		try {
			con = getConnection();

			//조회수 올라야할때 겟보드를 하면 조회수 1추가
			if(hitadd == true) {
			//겟보드를 할 때마다 조회수를 1 추가
			sql = "update boardT set b_hit = b_hit+1 where B_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			pstmt.executeUpdate();
			pstmt.close();
			}
			
			//글 번호에 대한 내용들을 가져옴.
			sql = "select a.*, to_char(b_date, 'YYYY-MM-DD hh24:mi') DATE2 "
				+ "from boardT a WHERE B_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new BoardBean();
				board.setB_id(rs.getInt(1));
				board.setB_name(rs.getString(2));
				board.setB_email(rs.getString(3));
				board.setB_title(rs.getString(4));
				board.setB_content(rs.getString(5));
				board.setB_date(rs.getTimestamp(6));
				board.setB_hit(rs.getInt(7));
				board.setB_pwd(rs.getString(8));
				board.setB_ip(rs.getString(9));
				board.setB_ref(rs.getInt(10));
				board.setB_step(rs.getInt(11));
				board.setB_level(rs.getInt(12));
				board.setDate2(rs.getString(13));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return board;
	}
	
	//DB에서 삭제(패스워드 확인)
	public int deleteBoard(int b_id, String chk_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql;
		String b_pwd="";
		int re = -1;
		
		try {
			con = getConnection();
			
			//글의 비밀번호를 가져옴.
			sql = "select b_pwd from boardT where b_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				b_pwd = rs.getString(1);
				
				if(b_pwd.equals(chk_pwd)) {
					sql = "delete from boardT where b_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, b_id);
					pstmt.executeUpdate();
					re = 1;
				}else {
					re = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}
	
	//DB수정
	public int editBoard(BoardBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql;
		String b_pwd="";
		int re = -1; //비밀번호를 찾지 못할때 (즉, 오류가 날때) 리턴값

		try {
			con = getConnection();
			sql = "select b_pwd from boardT where b_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getB_id());
			rs = pstmt.executeQuery();
			
			//비밀번호가 있을때 
			if(rs.next()) {
				b_pwd = rs.getString(1);
				//비밀번호가 일치하지 않으면 0반환
				if(!b_pwd.equals(board.getB_pwd())) {
					re = 0;
				//비밀번호가 맞으면 업데이트 후 1반환
				}else {
					sql = "update boardT set b_name=?, b_email=?, b_title=?, b_content=? where b_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, board.getB_name());
					pstmt.setString(2, board.getB_email());
					pstmt.setString(3, board.getB_title());
					pstmt.setString(4, board.getB_content());
					pstmt.setInt(5, board.getB_id());
					pstmt.executeUpdate();
					
					re = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}
}
