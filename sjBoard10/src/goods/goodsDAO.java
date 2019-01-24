package goods;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.bbs;

public class goodsDAO {
	
	private Connection conn; // 데이터베이스를 접근하기 위한 객체
	// private PreparedStatement pstmt;
	private ResultSet rs; // 정보를 담을 수 있는 변수를 만들어준다.
	// mysql 처리부분
	public goodsDAO() {
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

	// goods_id 가져오는 함수
	public int getNext() {
		String SQL = "SELECT goods_id FROM goods ORDER BY goods_id DESC";

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
	
	
	//goods테이블에 입력한 goods를 넣음.
	public int goods(String goods_name, String goods_type, int goods_price, String user_id, int goods_available) {

		String SQL = "INSERT INTO goods VALUES(?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());  //goods_id를 자동으로 생성하는 함수 호출
			pstmt.setString(2, goods_name);
			pstmt.setString(3, goods_type);
			pstmt.setInt(4, goods_price);
			pstmt.setString(5, user_id);
			pstmt.setInt(6,  1);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<goods> getList(int pageNumber){
		  String SQL = "SELECT * FROM goods WHERE goods_id < ? AND goods_available = 1 ORDER BY goods_id DESC LIMIT 10";
		  ArrayList<goods> list = new ArrayList<goods>();

		  try {
		    PreparedStatement pstmt = conn.prepareStatement(SQL);
		    pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	goods goods = new goods();
		    	  goods.setGoods_id(rs.getInt(1));
			      goods.setGoods_name(rs.getString(2));
			      goods.setGoods_type(rs.getString(3));
			      goods.setGoods_price(rs.getInt(4));
			      goods.setUser_id(rs.getString(5));
			      goods.setGoods_available(rs.getInt(6));
			      list.add(goods);
		    }

		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		  return list;

		}



		// 게시물이 10,20단위로 끈을때 게시물이 10개라면 다음 페이지가 없게 함
		public boolean nextPage(int pageNumber) {
		  String SQL = "SELECT * FROM goods WHERE goods_id < ? AND goods_available = 1 ORDER BY goods_id DESC LIMIT 10";

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
		
		public goods getGoods(int goods_id) {
			String SQL = "SELECT * FROM goods WHERE goods_id = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, goods_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					goods goods = new goods();
					goods.setGoods_id(rs.getInt(1));
					goods.setGoods_name(rs.getString(2));
					goods.setGoods_type(rs.getString(3));
					goods.setGoods_price(rs.getInt(4));
					goods.setUser_id(rs.getString(5));
					goods.setGoods_available(rs.getInt(6));
					return goods;
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	

}
