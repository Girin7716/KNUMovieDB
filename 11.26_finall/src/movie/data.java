package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class data {
	public String title = null;
	public String type = null;
	public String runtime = null;
	public String start = null;
	public String end = null;
	public String isadult = null;
	public data(String title,String type,String runtime,String start,String end,String isadult)
	{
		this.title = title;
		this.type = type;
		this.runtime = runtime;
		this.start = start;
		this.end = end;
		this.isadult = isadult;
	}
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "movie";
	String pass = "movie";
	String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
	int updat=0;
	Connection conn = null;
	String sql = null;
	PreparedStatement pstmt;
	Statement stmt = null; // Statement object
	ResultSet rs;	
	public String titleback() throws SQLException {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// System.out.println("Success!");
		} catch (ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}
		try {
			conn = DriverManager.getConnection(url, user, pass);
			System.out.println(conn);
			// conn.setAutoCommit(false);
			// System.out.println("Connection Success!");
		} catch (SQLException ex) {
			System.err.println("Cannot get a connection : " + ex.getMessage());
			System.exit(1);
		}
		try {
			stmt = conn.createStatement();
			System.out.println(stmt);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		sql = "select Tconst from movie where title = '" +title+ "'";
		ResultSet Titletconst = stmt.executeQuery(sql);
	    String Tconst;
	    if (Titletconst.next() == false) {
	       return "0";     
	    } else {
	       //title과 일치하는 tconst값 추출
	       Tconst = Titletconst.getString(1);
	       return Tconst;
	    }
	}
	public void update() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// System.out.println("Success!");
		} catch (ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}
		try {
			conn = DriverManager.getConnection(url, user, pass);
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
		int check1 = 0; // 0이면 성공 아니면 실패
		//System.out.println("here man~");
		sql = "UPDATE MOVIE SET TYPE ='" + type + "',RUNTIME =" + runtime + ", Start_year = TO_DATE('" + start
				+ "','YYYY-MM-DD'), END_YEAR = TO_DATE('"+ end+"','YYYY-MM-DD'),Isadult = "+isadult+" WHERE TITLE = '"+title+"'";
		int updat = 0;
		System.out.println(title);
		System.out.println(type);
		System.out.println(runtime);
		System.out.println(start);
		System.out.println(end);
		System.out.println(isadult);
		System.out.println(sql);
		try {
			//System.out.println("here man~2");
			System.out.println(updat);
			updat = stmt.executeUpdate(sql);
			System.out.println(updat);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
