
package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.User;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/sujung";
	        String dbID = "root";
	        String dbPassword = "0324";
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/sujung", "root", "0324");
		}	catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String user_id, String user_pw) {
		String SQL="SELECT user_pw FROM user WHERE user_id=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(user_pw))
					return 1; //로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			return -1; //아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return -2;  //데이터 베이스 오류
	}
	
	public int join(User user) {
		String SQL="INSERT INTO user VALUES (?, ?, ?, ?)"; //데이터 삽입
		try { 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_pw());
			pstmt.setString(3, user.getUser_name());
			pstmt.setString(4, user.getUser_div());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return -1; //데이터베이스 오류
	}
	

	
}
