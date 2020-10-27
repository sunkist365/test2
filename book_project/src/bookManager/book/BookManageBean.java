package bookManager.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookManageBean {
	private static BookManageBean instance = new BookManageBean();
	
	public static BookManageBean getinstance() {
		return instance;
	}

	//커넥션 풀로 mysql접속
	public Connection getMySQLConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	//insert_book.jsp에서 받은 정보를 insert_book_ok.jsp에서 데이터베이스 입력
		public int insertBook(BookBean book) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql="";
			int num = 0; //book_no
			
			try {
				con = getMySQLConnection();
				
				//book_no 부여(추후 장르별로 book_no부여 할 예정)//
				sql = "SELECT MAX(book_no) FROM BookList";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				//book_no의 초기값을 100000으로 주고 추가되는 책들은 1씩 더한다.
				if(rs.next()) {
					num = rs.getInt(1) + 1;
				}else{
					num = 100000;
				}
				
				//DB에 데이터를 입력
				sql = "INSERT INTO BookList(book_no, B_TITLE, B_AUTHOR, B_GENRE, B_PRICE"
						+ ", B_STORY, B_YEAR, B_LIST) VALUES(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, book.getB_title());
				pstmt.setString(3, book.getB_author());
				pstmt.setString(4, book.getB_genre());
				pstmt.setInt(5, book.getB_price());
				pstmt.setString(6, book.getB_story());
				pstmt.setInt(7, book.getB_year());
				pstmt.setString(8, book.getB_list());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(con!=null) con.close();				
				} catch(Exception e2) {
					e2.printStackTrace();
				}
			}
			return 1; //완료시에 1을 반환한다.	
		}
		
		//검색어를 입력받아 결과를 보여줄 목록
		//해당 페이지에 게시글을 정해진만큼 보여주기 위해 현재 페이지를 매개변수로 받는다.
		public ArrayList<BookBean> listManageBoard(String category, String search_word) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql="";
			ArrayList<BookBean> bookList = new ArrayList<BookBean>();
			
			try {
				conn = getMySQLConnection();
				sql = "select * from BookList";
				
				if(search_word != null && !search_word.equals("")){		
					
					search_word = "%" + search_word + "%";  
					if(category.equals("b_title")){
						sql += " where b_title like ?";
					}else if(category.equals("b_author")){
						sql += " where b_author like ?";
					}else if(category.equals("b_year")){
						sql += " where b_year like ?";
					}		
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, search_word);
				}		
				else{
					pstmt = conn.prepareStatement(sql);
				}
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
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
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
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
