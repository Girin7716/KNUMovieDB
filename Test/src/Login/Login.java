package Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Login {
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String USER_MOVIE = "movie";
	public static final String USER_PASSWD = "movie";
	String ID = null;
	String PassWord = null;
	public Login(String ID, String PassWord)
	{
		this.ID = ID;
		this.PassWord = PassWord;
	}
	
	public int getOk() {
		Connection conn = null; // Connection object
		Statement stmt = null; // Statement object
		String sql = "";
		ResultSet rs;
		int account_type;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// System.out.println("Success!");
		} catch (ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}
		try {
			conn = DriverManager.getConnection(URL, USER_MOVIE, USER_PASSWD);
			// conn.setAutoCommit(false);
			// System.out.println("Connection Success!");
		} catch (SQLException ex) {
			System.err.println("Cannot get a connection : " + ex.getMessage());
			System.exit(1);
		}
		try {
			stmt = conn.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		sql = "SELECT * FROM ACCOUNT WHERE ACCOUNT_ID = '" + ID + "' AND PASSWORD = '" + PassWord + "'";
		try {
			rs = stmt.executeQuery(sql);
			if (rs.next() == true) {
				account_type = rs.getInt(10);
				return 1;
			} else
				System.out.println("ID가 없거나 PassWord가 틀렸습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
