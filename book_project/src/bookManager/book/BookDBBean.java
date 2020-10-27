package bookManager.book;

import java.sql.*;

import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.jdbc.exceptions.jdbc4.MySQLDataException;

public class BookDBBean {
	private static BookDBBean instance = new BookDBBean();
	
	public static BookDBBean getinstance() {
		return instance;
	}

	//커넥션 풀로 mysql접속
	public Connection getMySQLConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	//검색어를 입력받아 결과를 보여줄 목록
	//해당 페이지에 게시글을 정해진만큼 보여주기 위해 현재 페이지를 매개변수로 받는다.
	public ArrayList<BookBean> listBoard(String search_word, String currentPage) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet pageset = null;
		
		int absolutepage=1; //해당 페이지에 첫번째 게시물의 번호(1페이지 1, 2페이지 11...)
		int search_count=0; //검색 결과 개수
		
		String sql="";
		ArrayList<BookBean> bookList = new ArrayList<BookBean>();
		
		try {
			con = getMySQLConnection();
			sql = "SELECT COUNT(book_no) FROM BookList WHERE b_title LIKE ? OR b_author LIKE ?";
			
			//TYPE_SCROLL_SENSITIVE : SCROLL도 가능하면서 변경된 사항도 적용됨(양방향 스크롤시 업데이트 반영) 
			//CONCUR_UPDATABLE : 커서의 위치에서 정보 업데이트 가능. 
			//ResultSet이 저장하고 있는 레코드들을 직접 수정해야 할 경우.(Resultset Object의 변경이 가능)
			pstmt = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, "%"+search_word+"%");
			pstmt.setString(2, "%"+search_word+"%");
			pageset = pstmt.executeQuery();

			//검색 결과 수를 search_count에 담음
			if(pageset.next()) {
				search_count = pageset.getInt(1);
				pageset.close();
			}
			
			//검색 총 페이지 구하기
			//검색 결과를 한 페이지에 보일 게시물수로 나누었을때 나머지가 0이 나오면 총 페이지 수는 몫이 되고
			//아닐경우엔 총 페이지수는 1페이지 추가가 된다.
			if(search_count % BookBean.dataPerPage == 0) {
				BookBean.totalPage = search_count / (BookBean.dataPerPage);
			}else {
				BookBean.totalPage = search_count / (BookBean.dataPerPage)+1;
			}
			
			if(currentPage != null) {
				BookBean.currentPage = Integer.parseInt(currentPage);
				absolutepage = (BookBean.currentPage-1) * BookBean.dataPerPage + 1;
			}
			
			sql ="SELECT * FROM BookList WHERE b_title LIKE ? OR b_author LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search_word+"%");
			pstmt.setString(2, "%"+search_word+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//absolutepage로 커서를 이동한다.
				rs.absolute(absolutepage);
				int count = 0;
				
				//한페이지당 보여질 게시물까지만 반복한다.
				while(count<BookBean.dataPerPage) {
					BookBean book = new BookBean();
					book.setB_no(rs.getInt("book_no"));
					book.setB_title(rs.getString("b_title"));
					book.setB_author(rs.getString("b_author"));
					book.setB_genre(rs.getString("b_genre"));
					book.setB_price(rs.getInt("b_price"));
					book.setB_story(rs.getString("b_story"));
					book.setB_year(rs.getInt("b_year"));
					book.setB_list(rs.getString("b_list"));
					
					bookList.add(book);
					
					//마지막레코드인가 확인후 마지막이면 빠져나가고 아니면 계속 진행.
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
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bookList;
	}
	
	//상세보기를 눌렀을때 BookBean을 반환
	public BookBean getBook(int book_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="SELECT * FROM BookList WHERE book_no = ?"; //해당 책의 번호
		BookBean book = null;
		
		try {
			con = getMySQLConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				book = new BookBean();
				book.setB_title(rs.getString("b_title"));
				book.setB_author(rs.getString("b_author"));
				book.setB_genre(rs.getString("b_genre"));
				book.setB_price(rs.getInt("b_price"));
				book.setB_story(rs.getString("b_story"));
				book.setB_year(rs.getInt("b_year"));
				book.setB_list(rs.getString("b_list"));
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
		return book;
	}
}
