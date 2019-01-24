package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.bbs;

public class commentDAO {

	private Connection conn; // 데이터베이스를 접근하기 위한 객체
	// private PreparedStatement pstmt;
	private ResultSet rs; // 정보를 담을 수 있는 변수를 만들어준다.
	// mysql 처리부분

	public commentDAO() {
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

	// comment_id 가져오는 함수
	public int getNext() {
		String SQL = "SELECT comment_id FROM comment ORDER BY comment_id DESC";

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

	// 실제로 글을 작성하는 함수---------------여기서부터수정

	public int comment( String comment_content, String user_id) {
		String SQL = "INSERT INTO comment VALUES(?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); //comment_id
			pstmt.setString(2, comment_content); //comment_contente를 저장
			pstmt.setString(3, user_id); //user_id를 저장
			pstmt.setString(4, getDate()); //date값을 가져오는 함수 호출

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}


}
