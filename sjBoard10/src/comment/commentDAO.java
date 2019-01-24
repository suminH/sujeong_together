package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.bbs;

public class commentDAO {

	private Connection conn; // �����ͺ��̽��� �����ϱ� ���� ��ü
	// private PreparedStatement pstmt;
	private ResultSet rs; // ������ ���� �� �ִ� ������ ������ش�.
	// mysql ó���κ�

	public commentDAO() {
		// �����ڸ� ������ش�.
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

	// ������ �ð��� �������� �Լ�
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

		return ""; // �����ͺ��̽� ����

	}

	// comment_id �������� �Լ�
	public int getNext() {
		String SQL = "SELECT comment_id FROM comment ORDER BY comment_id DESC";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}

			return 1;// ù ��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

	// ������ ���� �ۼ��ϴ� �Լ�---------------���⼭���ͼ���

	public int comment( String comment_content, String user_id) {
		String SQL = "INSERT INTO comment VALUES(?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); //comment_id
			pstmt.setString(2, comment_content); //comment_contente�� ����
			pstmt.setString(3, user_id); //user_id�� ����
			pstmt.setString(4, getDate()); //date���� �������� �Լ� ȣ��

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}


}
