package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class bbsDAO {

	
	private Connection conn; // 데이터베이스를 접근하기 위한 객체
	// private PreparedStatement pstmt;
	private ResultSet rs; // 정보를 담을 수 있는 변수를 만들어준다.
	// mysql 처리부분
	public bbsDAO() {
		// 생성자를 만들어준다.
		try {
			String dbURL = "jdbc:mysql://localhost:3306/sujung";
			String dbID = "root";
			String dbPassword = "0324";
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sujung", "root", "0324");

		} catch (Exception e) {
			e.printStackTrace();

		}

	}
	// 현재의 시간을 가져오는 함수
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ""; // 데이터베이스 오류

	}

	public int getConnet() {
		String SQL="SELECT user_id FROM post, goods WHERE post.user_id=goods.user_id";
		
		return 1;
	}
	
	// post_id 가져오는 함수
	public int getNext() {
		String SQL = "SELECT post_id FROM post ORDER BY post_id DESC";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}

			return 1;// 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	// 실제로 글을 작성하는 함수

	public int write(String post_title, String user_id, String post_content) {

		String SQL = "INSERT INTO post VALUES(?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, post_title);
			pstmt.setString(3, user_id);
			pstmt.setString(4, getDate());
			pstmt.setString(5, post_content);
			pstmt.setInt(6, 1);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//페이징
	public ArrayList<bbs> getList(int pageNumber){
		  String SQL = "SELECT * FROM post WHERE post_id < ? AND post_available = 1 ORDER BY post_id DESC LIMIT 10";
		  ArrayList<bbs> list = new ArrayList<bbs>();

		  try {
		    PreparedStatement pstmt = conn.prepareStatement(SQL);
		    pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	bbs bbs = new bbs();

		      bbs.setPost_id(rs.getInt(1));
		      bbs.setPost_title(rs.getString(2));
		      bbs.setUser_id(rs.getString(3));
		      bbs.setPost_date(rs.getString(4));
		      bbs.setPost_content(rs.getString(5));
		      bbs.setPost_available(rs.getInt(6));
		      list.add(bbs);
		    }

		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		  return list;

		}



		// 게시물이 10,20단위로 끈을때 게시물이 10개라면 다음 페이지가 없게 함
		public boolean nextPage(int pageNumber) {
		  String SQL = "SELECT * FROM post WHERE post_id < ? AND post_available = 1 ORDER BY post_id DESC LIMIT 10";

		  try {
		    PreparedStatement pstmt = conn.prepareStatement(SQL);
		    pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
		    rs = pstmt.executeQuery();

		    if(rs.next()) {
		      return true;
		    }
		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		  return false;	 
		}
		
		public bbs getBbs(int post_id) {
			String SQL = "SELECT * FROM post WHERE post_id = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, post_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bbs bbs = new bbs();
					bbs.setPost_id(rs.getInt(1));
					bbs.setPost_title(rs.getString(2));
					bbs.setUser_id(rs.getString(3));
					bbs.setPost_date(rs.getString(4));
					bbs.setPost_content(rs.getString(5));
					bbs.setPost_available(rs.getInt(6));
					return bbs;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	
		
		public int delete(int post_id) {
			  String SQL = "UPDATE post SET post_available = 0 WHERE post_id = ?";
			  try {
			    PreparedStatement pstmt = conn.prepareStatement(SQL);
			    pstmt.setInt(1, post_id);
			    return pstmt.executeUpdate();
			  } catch (Exception e) {
			    e.printStackTrace();
			  }
			  return -1; //데이터베이스 오류	

			}
		public int update(int post_id, String post_title, String post_content){
			  String SQL = "UPDATE post SET post_title = ?, post_content = ? WHERE post_id = ?";

			  try {
			    PreparedStatement pstmt = conn.prepareStatement(SQL);
			    pstmt.setString(1, post_title);
			    pstmt.setString(2, post_content);
			    pstmt.setInt(3, post_id);
			    return pstmt.executeUpdate();
			  } catch (Exception e) {
			    e.printStackTrace();
			  }

			  return -1; //데이터베이스 오류

			}
		
}