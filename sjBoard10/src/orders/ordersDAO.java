package orders;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ordersDAO {
	private Connection conn; // 데이터베이스를 접근하기 위한 객체
	// private PreparedStatement pstmt;
	private ResultSet rs; // 정보를 담을 수 있는 변수를 만들어준다.
	// mysql 처리부분
	public ordersDAO() {
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
	//시간 가져오는 함수
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
	
	public int getNext() { //orders_id를 만드는 함수,
		String SQL = "SELECT orders_id FROM orders ORDER BY orders_id DESC";

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

	public int buy(String user_id, String dplace,  int orders_amount) {

		String SQL = "INSERT INTO orders VALUES(?, ?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); //orders_id
			pstmt.setString(2, user_id);
			pstmt.setString(3, dplace);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, orders_amount);


			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
}
