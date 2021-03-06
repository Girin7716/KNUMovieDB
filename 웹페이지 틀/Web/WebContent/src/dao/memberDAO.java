package dao;

import java.sql.*; // import JDBC package
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.StringTokenizer;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/* Data Access Object
 * 테이블 당 한개의 DAO를 작성한다.
 * 
 * JSP_MEMBER 테이블과 연관된 DAO로
 * 회원 데이터를 처리하는 클래스이다.
 */
public class memberDAO {
	private static memberDAO instance;

	private memberDAO() {
	}

	public static memberDAO getInstance() {
		if (instance == null)
			instance = new memberDAO();
		return instance;
	}

	public int signup() throws ClassNotFoundException, SQLException {
		String serverIP = "localhost";
		String strSID = "orcl";
		String portNum = "1521";
		String USER_MOVIE = "movie";
		String USER_PASSWD = "movie";
		String URL = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
		Statement stmt = null; // Statement object
		Connection conn = null;
		PreparedStatement pstmt;
		ResultSet rs;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");

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
//String query = "SELECT Dnumber, Dname, Mgr_Ssn, Mgr_start_date FROM DEPARTMENT ORDER BY Dnumber";
//System.out.println(query);

//select e.Fname, e.Minit, e.Lname from employee e, department d, works_on w, project p where e.dno = d.dnumber and d.dnumber= 5 and e.salary >=10000 and w.pno = p.pnumber and p.pname = 'ProductZ' and w.essn=e.ssn;
		String sql;
		PreparedStatement pst = null;
		sql = "insert into account values(?,?,?,?,?,?,?,?,'Basic',0,?)";
		pst = conn.prepareStatement(sql);

		String ID = null;
		pst.setString(1, ID);

		String PassWord = null;
		pst.setString(2, PassWord);

		String Fname = null;
		pst.setString(3, Fname);

		String Lname = null;
		pst.setString(4, Lname);

		String Phone_number = null;
		pst.setString(5, Phone_number);

		String Address = null;
		if (Address.equals("null")) {
			pst.setString(6, null);
		} else {
			pst.setString(6, Address);
		}

		String Sex = null;
		if (Sex.equals("null")) {
			pst.setString(7, null);
		} else {
			pst.setString(7, Sex);
		}

		String Birth_day = null;
		if (Birth_day.equals("null")) {
			pst.setString(8, null);
		} else {
			pst.setString(8, Birth_day);
		}

		String Job = null;
		if (Job.equals("null")) {
			pst.setString(9, null);
		} else {
			pst.setString(9, Job);
		}

		int prs = 0;
		try {
			prs = pst.executeUpdate();
			if (prs == 1) {
				System.out.println("Success.");
			} else
				System.out.println("Fail");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prs;
	}

	public int signupcheck(String id) {
		String serverIP = "localhost";
		String strSID = "orcl";
		String portNum = "1521";
		String USER_MOVIE = "movie";
		String USER_PASSWD = "movie";
		String URL = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;

		Connection conn = null;
		Statement stmt = null; // Statement object
		PreparedStatement pstmt;
		ResultSet rs;
		
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
		int check1 = 0; // 0이면 성공 아니면 실패

		// (1)아이디 중복체크
		try {
			//String sql = "SELECT * FROM tutorial.member WHERE id ='" + id + "';";
			String sql = "select * from account where account_id = '"+id+"';";


			rs = stmt.executeQuery(sql);

			if (rs.next()) { // 증복 존재
				check1 = 1;
			} else { // 증복 없음
				check1 = 0;
			}
		} catch (SQLException e) {
		}

		if (check1 == 0 )//중복 없음
			return 1;
		else if (check1 == 1) {//중복 있음
			return 2;
		}
		return 0;
	}

	public int signupinsert(String id, String password, String fname, String lname, String phone, String address, String sex, String bdate, String job) {
		String serverIP = "localhost";
		String strSID = "orcl";
		String portNum = "1521";
		String USER_MOVIE = "movie";
		String USER_PASSWD = "movie";
		String URL = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
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

		String sql = "insert into account values(?,?,?,?,?,?,?,?,'Basic',0,?)";
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, fname);
			pstmt.setString(4, lname);
			pstmt.setString(5, phone);
			if (address.equals("null")) {
				pstmt.setString(6, null);
			} else {
				pstmt.setString(6, address);
			}
			if (sex.equals("null")) {
				pstmt.setString(7, null);
			} else {
				pstmt.setString(7, sex);
			}
			if (bdate.equals("null")) {
				pstmt.setString(8, null);
			} else {
				pstmt.setString(8, bdate);
			}
			if (job.equals("null")) {
				pstmt.setString(9, null);
			} else {
				pstmt.setString(9, job);
			}
			/*pstmt.setString(6, address);
			pstmt.setString(7, sex);
			pstmt.setString(8, bdate);
			pstmt.setString(9, job);*/
			//pstmt.executeUpdate();
			//System.out.println("회원가입 성공");
			
		} catch (SQLException e) {
		}
		int prs;
		try {
			prs = pstmt.executeUpdate();
			if (prs == 1) {
				System.out.println("Success.");
			} else
				System.out.println("Fail");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 5;
	}
}
