package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class memberDAO {
	int count = 0;
	String[] who;

	public String[] whoru(String[] total) {
		who = total.clone();
		return who;
	}

	public String[] getWho() {
		return who;
	}

	private static memberDAO instance;

	private memberDAO() {
	}

	public static memberDAO getInstance() {
		if (instance == null)
			instance = new memberDAO();
		return instance;
	}

///////////////////////////////////////////////////////////////////////
	public Integer getcnt() {
		int cnt = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from bbs");

			while (rs.next())
				cnt++;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@SuppressWarnings("null")
	public String[] getnames() {
		String[] array = new String[getcnt()];
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from bbs");

			int i = 0;
			while (rs.next()) {
				array[i] = rs.getString(3);
				i++;
//	            temp[i++] = rs.getString("name");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
	}

	public String[] gettitles() {
		String[] array = new String[getcnt()];
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from bbs");

			int i = 0;
			while (rs.next()) {
				array[i] = rs.getString(2);
				i++;
//	            temp[i++] = rs.getString("name");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
	}

	public String[] getdates() {
		String[] array = new String[getcnt()];
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from bbs");

			int i = 0;
			while (rs.next()) {
				array[i] = rs.getString(4);
				i++;
//	            temp[i++] = rs.getString("name");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
	}

	public String[] getwritings() {
		String[] array = new String[getcnt()];
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from bbs");

			int i = 0;
			while (rs.next()) {
				array[i] = rs.getString(5);
				i++;
//	            temp[i++] = rs.getString("name");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
	}

	////////////////////////////////////////////////////////////////

	public String[] matching(String id, int cnt) {
		System.out.println("matching start");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";

		String mymbti = null;
		String mygender = null;
		String rsname = null;
		String rsage = null;
		String rslocation = null;
		String rsmbti = null;
		String rsintroduce = null;
		String rskakaotalk = null;
		int chk = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		// 매칭 시작
		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery("select * from tutorial.member where id ='" + id + "'");
			if (rs.next()) {
				mymbti = rs.getString("mbti");
				mygender = rs.getString("gender");
			}

			if (mymbti.equals("ENFJ")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ISTP' OR mbti='INTP' or mbti='ESTP' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ENTJ")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ISFP' OR mbti='INFP' or mbti='ESFP' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ENTP")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ISFJ' OR mbti='ISTJ' or mbti='ENTP' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("INTJ")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ESFP' OR mbti='ESTP' or mbti='ISFP' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("INTP")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ESFJ' OR mbti='ENFJ' or mbti='ISFJ' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ESTJ")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='INFP' OR mbti='ISFP' or mbti='INTP' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ESFJ")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='INTP' OR mbti='ISTP' or mbti='ENTP' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ISTJ")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ENFP' OR mbti='ENTP' or mbti='ISFP' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ISFJ")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ENTP' OR mbti='ENFP' or mbti='INTP' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ENFP")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ISTJ' OR mbti='ISFJ' or mbti='ESFJ' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("INFJ")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ESTP' OR mbti='ESFP' or mbti='ISTP' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("INFP")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ESTJ' OR mbti='ENTJ' or mbti='INTJ' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ESTP")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='INFJ' OR mbti='INTJ' or mbti='ENFJ' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ESFP")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='INTJ' OR mbti='INFJ' or mbti='ENTJ' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ISTP")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ENFJ' OR mbti='ESFJ' or mbti='INFJ' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			} else if (mymbti.equals("ISFP")) {
				rs = stmt.executeQuery(
						"select * from tutorial.member where mbti='ENTJ' OR mbti='ESTJ' or mbti='INTJ' AND gender <> '"
								+ mygender + "'");

				while (rs.next()) {
					System.out.println("현재 chk:" + chk + " / 버튼클릭cnt: " + cnt);
					if (chk++ == cnt) {
						rsname = rs.getString("name");
						rsage = rs.getString("age");
						rslocation = rs.getString("location");
						rsmbti = rs.getString("MBTI");
						rsintroduce = rs.getString("introduce");
						rskakaotalk = rs.getString("kakaotalk");
						break;
					}
				}
			}

			String[] total = { rsname, rsage, rslocation, rsmbti, rsintroduce, rskakaotalk };

			return total;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String[] getmyinfo(String id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";

		int check1 = 0; // 0이면 성공 아니면 실패
		int check2 = 0;
		String myid = null;
		String myname = null;
		String mypassword = null;
		String mygender = null;
		String myage = null;
		String mylocation = null;
		String mymbti = null;
		String myintroduce = null;
		String mykakaotalk = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from tutorial.member where id='" + id + "'");

			while (rs.next()) {
				myname = rs.getString("name");
				myid = rs.getString("ID");
				mypassword = rs.getString("password");
				mygender = rs.getString("gender");
				myage = rs.getString("age");
				mylocation = rs.getString("location");
				mymbti = rs.getString("MBTI");
				myintroduce = rs.getString("introduce");
				mykakaotalk = rs.getString("kakaotalk");
			}
			System.out.println(myname);
			System.out.println(myid);
			System.out.println(mypassword);
			System.out.println(mygender);
			System.out.println(myage);
			System.out.println(mylocation);
			System.out.println(mymbti);
			System.out.println(myintroduce);
			System.out.println(mykakaotalk);

			String[] total = { myname, myid, mypassword, mygender, myage, mylocation, mymbti, myintroduce,
					mykakaotalk };

			return total;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// (1)아이디 가져오기
		/*
		 * try { String sql = "SELECT * FROM tutorial.member WHERE id ='" + id + "';";
		 * System.out.println(sql); stmt = conn.createStatement(); rs =
		 * stmt.executeQuery(sql);
		 * 
		 * if (rs.next()) { // 증복 존재 check1 = 1;
		 * 
		 * } else { // 증복 없음 check1 = 0;
		 * 
		 * } } catch (SQLException e) { }
		 */

		return null;
	}

	/////////////////////////////////////////////////////////////////////
	public int signupinsert(String name, String id, String pw, String kakao, String gender, String age, String area,
			String mbti, String introduce) {
		Connection conn = null;
		Statement stmt = null;
		// ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		PreparedStatement pstmt = null;
		try {
			String sql = "insert into tutorial.member(name,id,password,gender,age,location,MBTI,introduce,kakaotalk) values(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, gender);
			pstmt.setString(5, age);
			pstmt.setString(6, area);
			pstmt.setString(7, mbti);
			pstmt.setString(8, introduce);
			pstmt.setString(9, kakao);
			pstmt.executeUpdate();
			System.out.println("tutorial.member DB에 저장 성공!");
			/*
			 * if (rs.next()) { if (rs.getString("password").equals(pw)) return 1; // 로그인 성공
			 * else return 0; // 비밀번호 불일치 } else { return -1; // 아이디 없음 }
			 */
		} catch (SQLException e) {
		}
		return 5;
	}

	// 로그인 유효한지 검사
	public int signincheck(String id, String pw) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		try {
			String sql = "SELECT password FROM tutorial.member WHERE id ='" + id + "';";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				if (rs.getString("password").equals(pw))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			} else {
				return -1; // 아이디 없음
			}
		} catch (SQLException e) {
		}
		return 5;
	}

	// 회원가입 유효한지 검사
	public int signupcheck(String name, String id, String kakaotalk) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dbURL = "jdbc:mysql://localhost:3306/tutorial?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "samsung159";

		int check1 = 0; // 0이면 성공 아니면 실패
		int check2 = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("연결정보 : " + conn);
		System.out.println("연결정보(toString) : " + conn.toString());

		// (1)아이디 중복체크
		try {
			String sql = "SELECT * FROM tutorial.member WHERE id ='" + id + "';";
			System.out.println(sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) { // 증복 존재
				check1 = 1;
			} else { // 증복 없음
				check1 = 0;
			}
		} catch (SQLException e) {
		}
		// (2)사용자 중복체크- 이름, 카카오톡아이디
		try {
			String sql = "SELECT * FROM tutorial.member WHERE id ='" + id + "' and kakaotalk = '" + kakaotalk + "';";
			System.out.println(sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) { // 중복 존재
				check2 = 1;
			} else {
				check2 = 0; // 중복 없음
			}
		} catch (SQLException e) {
		}

		if (check1 == 0 && check2 == 0)
			return 1;
		else if (check1 == 1 && check2 == 0)
			return 2;
		else if (check1 == 0 && check2 == 1)
			return 3;
		else
			return 5;
	}
}