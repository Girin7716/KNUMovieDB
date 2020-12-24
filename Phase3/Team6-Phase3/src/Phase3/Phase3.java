package Phase3;

//clear ->

//1. 회원 관련 기능 -> A.회원 가입, B.회원 정보 수정 ,C.비밀 번호 수정, D.로그인, E.회원 탈퇴, F. 관리자 계정은 최소 1개 이상 필수??
//2. 영상물 관련 기능 -> A.로그인 이후 영상물 전체 출력
//3. 평가 관련 기능 -> B. 회원은 자신의 평가 내역을 확인할 수 있다.
//4. 관리자 기능 –> 관리자 계정으로 접속하였을 때만 사용이 가능한 기능. -> A. 새로운 영상물을 등록할 수 있다. 

import java.sql.*; // import JDBC package
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.StringTokenizer;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Phase3 {

	public static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String USER_MOVIE = "movie";
	public static final String USER_PASSWD = "movie";

	public static void main(String[] args) throws SQLException {
		Connection conn = null; // Connection object
		Statement stmt = null; // Statement object
		String sql = "";
		Scanner scanner = new Scanner(System.in);
		String ID = null;
		String PassWord = null;
		String Fname = null;
		String Lname = null;
		String Job = null;
		String Phone_number = null;
		String Birth_day = null;
		String Sex = null;
		String Address = null;
		ResultSet rs;
		int account_type = 0;
		int flag = 0;
		int count = 0;
		int account_flag = 0; // 비밀번호 수정? 정보 수정?
		int updat = 0; // update result set
		int admin_flag = 0;

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

		while (true) {
			System.out.println("1.login\n2.Sign_in");
			try {
				flag = scanner.nextInt();
			} catch (InputMismatchException e) {
				scanner = new Scanner(System.in);
				continue;
			}
			if (flag == 1) // 로그인
			{
				System.out.print("ID : ");
				ID = scanner.next();
				System.out.print("PassWord : ");
				PassWord = scanner.next();

				sql = "SELECT * FROM ACCOUNT WHERE ACCOUNT_ID = '" + ID + "' AND PASSWORD = '" + PassWord + "'";
				try {
					rs = stmt.executeQuery(sql);
					if (rs.next() == true) {
						account_type = rs.getInt(10);
						break;
					} else
						System.out.println("ID가 없거나 PassWord가 틀렸습니다.");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else if (flag == 2) // 회원가입 (*) : 필수 기입
			{
				while (true) {
					PreparedStatement pst = null;
					sql = "insert into account values(?,?,?,?,?,?,?,?,'Basic',0,?)";
					pst = conn.prepareStatement(sql);

					System.out.println("<<Sign in>>\nIf you don't want to fill in, write null\nBut,(*) is necessary.");
					while (true) {
						System.out.print("ID(*) : ");
						ID = scanner.next();
						pst.setString(1, ID);
						if (ID.length() <= 10)
							break;
						System.out.println("10글자 이내로 지정해주세요");
					}

					while (true) {
						System.out.print("PassWord(*) : ");
						PassWord = scanner.next();
						pst.setString(2, PassWord);
						if (PassWord.length() <= 10)
							break;
						System.out.println("10글자 이내로 지정해주세요");
					}

					while (true) {
						System.out.print("Fname(*) : ");
						Fname = scanner.next();
						pst.setString(3, Fname);
						if (Fname.length() <= 10)
							break;
						System.out.println("10글자 이내로 지정해주세요");
					}

					while (true) {
						System.out.print("Lname(*) : ");
						Lname = scanner.next();
						pst.setString(4, Lname);
						if (Lname.length() <= 10)
							break;
						System.out.println("10글자 이내로 지정해주세요");
					}

					while (true) {
						System.out.print("Phone_number(xxx-xxxx-xxxx)(*)(not -) : ");
						Phone_number = scanner.next();
						pst.setString(5, Phone_number);
						if (Phone_number.length() <= 15)
							break;
						System.out.println("15글자 이내로 지정해주세요");
					}

					while (true) {
						System.out.print("Address : ");
						Address = scanner.next();
						if (Address.equals("null")) {
							pst.setString(6, null);
						} else {
							pst.setString(6, Address);
						}
						if (Address.length() <= 30)
							break;
						System.out.println("30글자 이내로 지정해주세요");
					}

					while (true) {
						System.out.print("Sex(F,M) : ");
						Sex = scanner.next();
						if (Sex.equals("null")) {

							pst.setString(7, null);
							break;
						} else if (Sex.equals("F") || Sex.equals("M")) {
							pst.setString(7, Sex);
							break;
						}
						System.out.println("(F,M)을 정확히 입력해주세요");
					}

					System.out.print("Birth_day(YYYY-MM-DD) : ");
					Birth_day = scanner.next();
					if (Birth_day.equals("null")) {
						pst.setString(8, null);
					} else {
						pst.setString(8, Birth_day);
					}

					while (true) {
						System.out.print("Job : ");
						Job = scanner.next();
						if (Job.equals("null")) {
							pst.setString(9, null);
						} else {
							pst.setString(9, Job);
						}
						if (Job.length() <= 10)
							break;
						System.out.println("10글자 이내로 지정해주세요");
					}

					int prs;
					try {
						prs = pst.executeUpdate();
						if (prs == 1) {
							System.out.println("Success.");
							break;
						} else
							System.out.println("Fail");
					} catch (SQLException e) {
						System.out.println("이미 존재하는 ID이거나 Account 정보를 잘못 입력하셨습니다");
					}
				}
			}
		}
//----------------------------main화면----------------------------------------------------
		System.out.println("---------------------------movie's title from DB---------------------------");
		// 로그인 이후 영상물 전체 출력
		if (account_type == 0)
			sql = "CREATE OR REPLACE VIEW TEST AS SELECT * FROM MOVIE MINUS (SELECT M.Tconst, M.Title, M.Type, M.Runtime, M.Start_year, M.End_year, M.IsAdult FROM MOVIE M, RATING R WHERE R.PARENTACCOUNT = '"
					+ ID + "' AND M.TCONST = R.PARENTTCONST)";
		else if (account_type == 1)
			sql = "CREATE OR REPLACE VIEW TEST AS SELECT * FROM MOVIE";

		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

		// 로그인 후
		while (true) {
//Title 화면 출력----------------------------------------------------------------------------------------------------------------------
			sql = "SELECT TITLE FROM TEST ORDER BY TITLE";
			int num1 = 1;
			// 내가 평가하지않은 모든 MOVIE의 Title 출력
			try {
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					System.out.println(num1++ + ". " + rs.getString(1));
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// 내가 평가하지않은 모든 MOVIE의 Title 출력종료
//콘솔 조작창 출력--------------------------------------------------------------------------------------------------------------------
			System.out.println("-----Console View-----");
			System.out.print("0.초기 Title View로 돌아가기 1.영상물 선택 2.영상물 검색 3.내가 평가한 영상물 4.회원정보 수정 5.회원 탈퇴 6.종료");
			if (account_type == 1) {
				System.out.println(" 7.관리자 모드");
			} else {
				System.out.println("");
			}
			try {// 예외 처리
				flag = scanner.nextInt();
			} catch (InputMismatchException e) {
				scanner = new Scanner(System.in);
				continue;
			}
			scanner.nextLine(); // buffer 비우기용

//조작 창 입력에 따른 쿼리 실행--------------------------------------------------------------------------------------------------------------
			switch (flag) {
//내가 평가한 영화를 제외한 Title 출력(관리자는 평가해도 모두 출력)-----------------------------------------------------------------------------------------
			case 0:
				if (account_type == 0) // 일반 user
					sql = "CREATE OR REPLACE VIEW TEST AS SELECT * FROM MOVIE MINUS (SELECT M.Tconst, M.Title, M.Type, M.Runtime, M.Start_year, M.End_year, M.IsAdult FROM MOVIE M, RATING R WHERE R.PARENTACCOUNT = '"
							+ ID + "' AND M.TCONST = R.PARENTTCONST)";
				else if (account_type == 1) // 관리자
					sql = "CREATE OR REPLACE VIEW TEST AS SELECT * FROM MOVIE";

				try {
					stmt.executeUpdate(sql); // 실행
				} catch (SQLException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
				break;

//View에 나와있는 영상물의 Title을 입력하면 영상물의 정보가 나오고 평가 할지 말지 결정-------------------------------------------------------------------------------------
			case 1:
				System.out.print("영상물의 Title을 입력하세요 : ");
				String input = scanner.nextLine(); // 영상물의 Title
				String movie_Tconst; // movie의 Tconst
				// 영화가 평가 되있는지 판단하는 쿼리문
				sql = "SELECT TITLE, R.Rating FROM MOVIE M, RATING R WHERE R.PARENTACCOUNT = '" + ID
						+ "' AND M.TCONST = R.PARENTTCONST AND M.Title = '" + input + "'";
				try {
					rs = stmt.executeQuery(sql);
					if (rs.next() == true) // 영화가 이미 평가 되었으면 출력
						System.out.println("이미 평가한 Title입니다");
					else { // 영화가 평가된게 아니면
						sql = "SELECT * FROM TEST WHERE Title = '" + input + "'"; // VIEW에서 정보를 얻어옴
						ResultSet output = stmt.executeQuery(sql);
						if (output.next() == false) { // VIEW에 없는(DB에 없는) 영화를 검색하면 종료
							System.out.println("해당 영화가 없습니다");
						} else { // 쿼리 결과 얻어오기
							movie_Tconst = output.getString(1);
							System.out.println("Title   : " + output.getString(2));
							System.out.println("Type    : " + output.getString(3));
							System.out.println("Runtime : " + output.getInt(4));
							System.out.println("방영일    : " + output.getString(5));
							System.out.println("종료일    : " + output.getString(6));
							System.out.print("IsAdult : ");
							if (output.getInt(7) == 1)
								System.out.println("Yes");
							else if (output.getInt(7) == 0)
								System.out.println("No");

							System.out.print("Genres  : ");
							sql = "SELECT PARENTGENRETYPE FROM TEST T, MOVIEIS M WHERE Title = '" + input
									+ "' AND T.TCONST = M.PARENTTCONST";
							rs = stmt.executeQuery(sql);
							while (rs.next())
								System.out.print(rs.getString(1) + "/");

							System.out.print("\nActors  : ");
							sql = "SELECT NAME FROM TEST T, APPEAR A, ACTOR AC WHERE Title = '" + input
									+ "' AND T.TCONST = A.PARENTTCONST AND A.PARENTACTOR_ID = AC.ACTOR_ID";
							rs = stmt.executeQuery(sql);
							while (rs.next())
								System.out.print(rs.getString(1) + "/");

							System.out.print("\nVersion : ");
							sql = "SELECT DISTINCT REGION FROM TEST T, VERSION V WHERE T.Title = '" + input
									+ "' AND T.TCONST = V.PARENTTCONST";
							rs = stmt.executeQuery(sql);
							while (rs.next())
								System.out.print(rs.getString(1) + "/");

							// 영화의 정보 출력 후 평가할지 말지 묻기
							while (true) {
								System.out.println("\n이 영상물을 평가하시겠습니까?(y/n)");
								String in = scanner.nextLine();

								if (in.equals("Y") || in.equals("y")) {
									double num;
									while (true) {
										System.out.println("평점을 입력해주세요: ");
										num = scanner.nextDouble();
										scanner.nextLine();
										if (num >= 0 && num <= 10)
											break;

										System.out.println("0~10점사이를 입력해주세요");
									}
									sql = "INSERT INTO RATING VALUES ('" + ID + "','" + movie_Tconst + "'," + num + ")";
									stmt.executeUpdate(sql);
									// 평점 입력하면 다시 view를 만들어줘야함

									sql = "CREATE OR REPLACE VIEW TEST AS SELECT * FROM MOVIE MINUS (SELECT M.Tconst, M.Title, M.Type, M.Runtime, M.Start_year, M.End_year, M.IsAdult FROM MOVIE M, RATING R WHERE R.PARENTACCOUNT = '"
											+ ID + "' AND M.TCONST = R.PARENTTCONST)";
									stmt.executeUpdate(sql);
									break;
								} else if (in.equals("N") || in.equals("n"))
									break;
								else
									continue;
							} // 이 영상물 평가 질문 끝
						}
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				// 검색 종료
				System.out.println("Title 화면으로 넘어가려면 enter입력");
				scanner.nextLine();
				break;
//조건에 따라 검색하기-------------------------------------------------------------------------------------------------------------------
			case 2:
				int counts = 0;
				int[] flags = new int[4];
				String[] inputs = new String[4];

				System.out.println("Title, Type, Genre, Version을 검색합니다");
				System.out.println("모든 옵션에 대한 검색은 선택이며 검색을 원하지 않을시 ENTER를 입력하여 넘어갑니다 Genre는 OR 검색을 지원합니다");

				System.out.print("Title  (option)   : ");
				inputs[0] = scanner.nextLine();
				if (!inputs[0].equals("")) {
					counts++;
					flags[0] = 1;
					sql = "CREATE OR REPLACE VIEW TITLE_VIEW AS SELECT * FROM MOVIE WHERE TITLE = '" + inputs[0] + "'";
					stmt.executeUpdate(sql);
				}

				System.out.print("Type   (option)   : "); // TYPE VIEW
				inputs[1] = scanner.nextLine();
				if (!inputs[1].equals("")) {
					counts++;
					flags[1] = 1;
					sql = "CREATE OR REPLACE VIEW TYPE_VIEW AS SELECT * FROM MOVIE WHERE TYPE = '" + inputs[1] + "'";
					stmt.executeUpdate(sql);
				}

				System.out.println("Genre1, Genre2, Genre3 형식으로 입력");
				System.out.print("Genre  (option)   : "); // GENRE VIEW
				inputs[2] = scanner.nextLine();
				if (!inputs[2].equals("")) {
					counts++;
					flags[2] = 1;
					String[] temp = inputs[2].split(",");
					sql = "CREATE OR REPLACE VIEW GENRE_VIEW AS SELECT DISTINCT PARENTTCONST FROM MOVIEIS WHERE ";
					for (int i = 0; i < temp.length; i++) {
						if (i == 0)
							sql += "PARENTGENRETYPE = '" + temp[i].trim() + "' ";
						else
							sql += "OR PARENTGENRETYPE = '" + temp[i].trim() + "' ";
					}
					stmt.executeUpdate(sql);
				}

				System.out.print("Version(option)   : "); // VERSION VIEW
				inputs[3] = scanner.nextLine();
				if (!inputs[3].equals("")) {
					counts++;
					flags[3] = 1;
					sql = "CREATE OR REPLACE VIEW VERSION_VIEW AS SELECT * FROM VERSION WHERE REGION = '" + inputs[3]
							+ "'";
					stmt.executeUpdate(sql);
				}

				sql = "CREATE OR REPLACE VIEW TEMP AS ";
				sql += "(SELECT M.TCONST, M.TITLE, M.TYPE, M.RUNTIME, M.START_YEAR, M.END_YEAR, M.ISADULT ";
				// FROM절
				sql += "FROM MOVIE M ";
				for (int i = 0; i < 4; i++) {
					if (flags[i] == 1) {
						switch (i) {
						case 0:
							sql += ", TITLE_VIEW T ";
							break;
						case 1:
							sql += ", TYPE_VIEW TV ";
							break;
						case 2:
							sql += ", GENRE_VIEW G ";
							break;
						case 3:
							sql += ", VERSION_VIEW V ";
							break;
						}
					}
				}
				// WHERE절
				sql += "WHERE ";
				int temp = 0;
				for (int i = 0; i < 4; i++) {
					if (flags[i] == 1) {
						switch (i) {
						case 0:
							if (temp == 0)
								sql += "M.TCONST = T.TCONST ";
							else
								sql += "AND M.TCONST = T.TCONST ";
							temp++;
							break;

						case 1:
							if (temp == 0)
								sql += "M.TCONST = TV.TCONST ";
							else
								sql += "AND M.TCONST = TV.TCONST ";
							temp++;
							break;

						case 2:
							if (temp == 0)
								sql += "M.TCONST = G.PARENTTCONST ";
							else
								sql += "AND M.TCONST = G.PARENTTCONST ";
							temp++;

							break;
						case 3:
							if (temp == 0)
								sql += "M.TCONST = V.PARENTTCONST";
							else
								sql += "AND M.TCONST = V.PARENTTCONST";
							temp++;
							break;
						}
					}
				}

				if (counts != 0) {
					if (account_type == 0)
						sql += ") MINUS (SELECT M.Tconst, M.Title, M.Type, M.Runtime, M.Start_year, M.End_year, M.IsAdult FROM MOVIE M, RATING R WHERE R.PARENTACCOUNT = '"
								+ ID + "' AND M.TCONST = R.PARENTTCONST)";
					else if (account_type == 1)
						sql += ")";

					stmt.executeUpdate(sql);
					sql = "CREATE OR REPLACE VIEW TEST AS (SELECT * FROM TEMP)";
					stmt.executeUpdate(sql);
				} else if (counts == 0)
					System.out.println("아무것도 입력하지 않았습니다");

				System.out.println("Title 화면으로 넘어가려면 enter입력");
				scanner.nextLine();
				break;

			case 3: // 3번을 누르면 내가 평가한 영화의 평점 볼 수 있음 건드릴 필요 X
				String movie_tconst = null;
				if (account_type == 0) { // 일반사용자
					sql = "WITH AVG_TABLE AS (SELECT R.PARENTTCONST, AVG(R.RATING) AVG FROM RATING R GROUP BY PARENTTCONST) SELECT TITLE, R.Rating, AVG FROM MOVIE M, RATING R, AVG_TABLE A WHERE R.PARENTACCOUNT = '"
							+ ID + "' AND M.TCONST = R.PARENTTCONST AND M.Tconst = A.PARENTTCONST";
					try {
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							System.out.println("Title    : " + rs.getString(1));
							System.out.println("MyRating : " + rs.getDouble(2));
							System.out.println("AVG      : " + rs.getDouble(3) + "\n");
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else if (account_type == 1) { // 관리자전용
					sql = "WITH AVG_TABLE AS (SELECT R.PARENTTCONST, AVG(R.RATING) AVG FROM RATING R GROUP BY PARENTTCONST) SELECT TITLE, R.PARENTACCOUNT, R.Rating, AVG FROM MOVIE M, RATING R, AVG_TABLE A WHERE M.TCONST = R.PARENTTCONST AND M.Tconst = A.PARENTTCONST ORDER BY M.TITLE";
					try {
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							System.out.println("Title    : " + rs.getString(1));
							System.out.println("AccountID : " + rs.getString(2));
							System.out.println("AccountRating : " + rs.getDouble(3));
							System.out.println("AVG      : " + rs.getDouble(4) + "\n");
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				System.out.println("Title 화면으로 넘어가려면 enter입력");
				scanner.nextLine();
				break;

			// 여기서부터 case4 추가
			case 4:// 회원 정보 수정
				sql = "SELECT * FROM ACCOUNT WHERE ACCOUNT_ID = '" + ID + "'";
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					PassWord = rs.getString(2);
					Fname = rs.getString(3);
					Lname = rs.getString(4);
					Phone_number = rs.getString(5);
					Address = rs.getString(6);
					Sex = rs.getString(7);
					Birth_day = rs.getString(8);
					Job = rs.getString(11);
				}
				while (true)
					try {
						System.out.println("변경하고자하는 정보를 선택해주세요");
						System.out.println("1.비밀번호 2.이름 3.전화번호 4.주소 5.성별 6.생일 7.직업");
						account_flag = scanner.nextInt();
						if (account_flag < 1 || account_flag > 7) {
							System.out.println("잘못된 번호입니다");
							continue;
						} else
							break;
					} catch (InputMismatchException e) {
						scanner = new Scanner(System.in);
						continue;
					}

				switch (account_flag) {
				case 1:
					System.out.println("이전 비밀번호 입니다 :" + PassWord);
					System.out.println("변경하고자하는 비밀번호를 입력하세요");
					System.out.print("PassWord(*): ");
					while (true) {
						PassWord = scanner.nextLine();
						if (PassWord.length() <= 10)
							break;
						System.out.println("10글자 이내로 지정해주세요");
					}

					sql = "UPDATE ACCOUNT SET PASSWORD ='" + PassWord + "' WHERE ACCOUNT_ID='" + ID + "'";
					try {
						updat = stmt.executeUpdate(sql);

						if (updat == 1) {
							System.out.println("비밀번호가 변경되었습니다.");
							break;
						} else
							System.out.println("비밀번호 제한형식이 틀립니다.");
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				case 2: // 이름 변경
					System.out.println("이전 이름 입니다 :" + Fname + " " + Lname);
					System.out.println("변경하고자하는 이름을 입력하세요 : ");
					System.out.print("Fname(*) : ");
					while (true) {
						Fname = scanner.next();
						if (Fname.length() <= 10)
							break;
						System.out.println("10글자 이내로 지정해주세요");
					}

					System.out.print("Lname(*) : ");
					while (true) {
						Lname = scanner.next();
						if (Lname.length() <= 10)
							break;
						System.out.println("10글자 이내로 지정해주세요");
					}
					sql = "UPDATE ACCOUNT SET Fname ='" + Fname + "', Lname = '" + Lname + "' WHERE ACCOUNT_ID='" + ID
							+ "'";

					try {
						updat = stmt.executeUpdate(sql);
						if (updat == 1) {
							System.out.println("이름이 변경되었습니다.");
							break;
						} else
							System.out.println("이름 변경 실패.");
					} catch (SQLException e) {
						e.printStackTrace();
					}

					break;
				case 3: // 전화번호 변경
					System.out.println("이전 전화번호 입니다 :" + Phone_number);
					System.out.println("변경하고자하는 전화번호를 입력하세요");
					System.out.print("Phone_number(xxx-xxxx-xxxx)(*)(not -) : ");
					while (true) {
						Phone_number = scanner.next();
						if (Phone_number.length() <= 15)
							break;
						System.out.println("15글자 이내로 지정해주세요");
					}
					sql = "UPDATE ACCOUNT SET Phone_number='" + Phone_number + "' WHERE ACCOUNT_ID='" + ID + "'";

					try {
						updat = stmt.executeUpdate(sql);
						if (updat == 1) {
							System.out.println("전화번호가 변경되었습니다.");
							break;
						} else
							System.out.println("전화번호 변경 실패.");
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				case 4: // 주소
					System.out.println("이전 주소 입니다 :" + Address);
					System.out.println("변경하고자하는 주소를 입력하세요");
					System.out.print("Address : ");
					while (true) {
						Address = scanner.next();
						if (Address.length() <= 30)
							break;
						System.out.println("30글자 이내로 지정해주세요");
					}

					sql = "UPDATE ACCOUNT SET Address='" + Address + "' WHERE ACCOUNT_ID='" + ID + "'";

					try {
						updat = stmt.executeUpdate(sql);
						if (updat == 1) {
							System.out.println("주소가 변경되었습니다.");
							break;
						} else
							System.out.println("주소 변경 실패.");
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				case 5: // 성별
					System.out.println("이전 성별 입니다 :" + Sex);
					System.out.println("변경하고자하는 성별을 입력하세요");
					System.out.print("Sex(F/M) : ");
					while (true) {
						Sex = scanner.next();
						if (Sex.equals("F") || Sex.equals("M"))
							break;
						System.out.println("(F,M) 정확하게 입력해주세요");
					}

					sql = "UPDATE ACCOUNT SET Sex='" + Sex + "' WHERE ACCOUNT_ID='" + ID + "'";

					try {
						updat = stmt.executeUpdate(sql);
						if (updat == 1) {
							System.out.println("성별이 변경되었습니다.");
							break;
						} else
							System.out.println("성별 변경 실패.");
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				case 6: // 생일
					System.out.println("이전 생일 입니다 :" + Birth_day);
					System.out.println("변경하고자하는 생일을 입력하세요");
					System.out.print("Birth_day(YYYY-MM-DD) : ");
					Birth_day = scanner.next();

					// UPDATE SM_USER SET CHGDATE=TO_DATE( '2009/06/01 11:00:00', 'YYYY/MM/DD HH:M
					sql = "UPDATE ACCOUNT SET Bdate=TO_DATE('" + Birth_day + "','YYYY-MM-DD') WHERE ACCOUNT_ID='" + ID
							+ "'";

					try {
						updat = stmt.executeUpdate(sql);
						if (updat == 1) {
							System.out.println("생일이 변경되었습니다.");
							break;
						} else
							System.out.println("생일 변경 실패.");
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				case 7: // 직업
					System.out.println("이전 직업 입니다 :" + Job);
					System.out.println("변경하고자하는 직업을 입력하세요");
					System.out.print("Job : ");
					while (true) {
						Job = scanner.next();
						if (Job.length() <= 10)
							break;
						System.out.println("10글자 이내로 지정해주세요");
					}

					sql = "UPDATE ACCOUNT SET Job='" + Job + "' WHERE ACCOUNT_ID='" + ID + "'";

					try {
						updat = stmt.executeUpdate(sql);
						if (updat == 1) {
							System.out.println("직업이 변경되었습니다.");
							break;
						} else
							System.out.println("직업 변경 실패.");
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				}
				scanner = new Scanner(System.in);
				System.out.println("Title 화면으로 넘어가려면 enter입력");
				scanner.nextLine();
				break;
			case 5:// 회원 탈퇴
				while (true) {
					if (account_type == 1) {
						System.out.println("관리자 계정은 회원탈퇴가 불가능합니다");
						System.out.println("Title 화면으로 넘어가려면 enter입력");
						scanner.nextLine();
						break;
					}
					System.out.println("회원 탈퇴 하시겠습니까? (Y/N) ");
					String f = scanner.next();
					switch (f) {
					case "y":
					case "Y":// 회원 탈퇴
						sql = "DELETE FROM ACCOUNT WHERE ACCOUNT_ID= '" + ID + "'";

						try {
							updat = stmt.executeUpdate(sql);
							if (updat == 1) {
								System.out.println("성공적으로 회원 탈퇴했습니다.");
								System.out.println("종료합니다.");
								return;
							} else
								System.out.println("회원 탈퇴 실패");
						} catch (SQLException e) {
							e.printStackTrace();
						}
						break;
					case "n":
					case "N":// 회원 탈퇴 취소
						System.out.println("회원 탈퇴를 취소했습니다.");
						break;
					default:
						System.out.println("잘못된 값 입력.");
						break;
					}
					if (f.equals("y") || f.equals("Y") || f.equals("n") || f.equals("N"))
						break;
				}
				// DELETE FROM ACCOUNT WHERE ID = ~~~~;

				break;
			case 6:// 종료
				try {
					// Close the Connection object.
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;

			case 7: // 관리자 모드
				if (account_type != 1) {// 관리자가 아닌데 들어옴
					System.out.println("허락되지 않은 권한입니다.");
					break;
				}

				while (true) {
					System.out.println("관리자 모드입니다.");
					System.out.println("1.새 영상물 등록 2.등록된 영상물 정보 수정");
					try {
						admin_flag = scanner.nextInt();
						break;
					} catch (InputMismatchException e) {
						scanner = new Scanner(System.in);
						continue;
					}
				}
//7-1-------------------------------------------------------------------------------------------------------------
				switch (admin_flag) {
				case 1:// 새 영상물 등록 -> null 처리는 안함
						// INSERT INTO MOVIE VALUES ('tt0000300','Gran corrida de
						// toros55','Tv_series',177,'2020-01-01','2020-06-01',0);
					System.out.println("등록할 영상물의 정보를 입력해주세요.");
					System.out.println("Title, Type, Runtime, Start_movie, End_movie, Isadult");
					sql = "select max(tconst) from movie";
					ResultSet endtconst = stmt.executeQuery(sql);
					String last_Tconst;
					if (endtconst.next() == false) {
						System.out.println("등록된 영화가 없습니다!");
					} else {
						// 제일 마지막 Tconst를 기준으로 +1하는 과정
						last_Tconst = endtconst.getString(1);
						last_Tconst = last_Tconst.substring(2);
						int rem;
						rem = Integer.parseInt(last_Tconst);
						rem += 1;
						last_Tconst = Integer.toString(rem);
						String new_Tconst = "tt";
						for (int i = 0; i < 7 - last_Tconst.length(); i++) {
							new_Tconst += '0';
						}
						new_Tconst += last_Tconst;// 추가할 Tconst(new_Tconst);

						PreparedStatement newmoviepst = null;
						sql = "INSERT INTO MOVIE VALUES ('" + new_Tconst + "',?,?,?,?,?,?)";
						newmoviepst = conn.prepareStatement(sql);

						String Title;
						String Type;
						int Runtime;
						String Start_movie;
						String End_movie;
						int Isadult;

						System.out.print("MOVIE Title(*) : ");
						Title = scanner.nextLine();
						newmoviepst.setString(1, Title);

						System.out.print("MOVIE Type(only type Movie,KnuMovieDB,Tv_series) : ");
						Type = scanner.nextLine();
						while (true) {
							if (Type.equals("Movie") || Type.equals("KnuMovieDB") || Type.equals("Tv_series")) {
								break;
							} else {
								System.out.println("잘못 입력함");
								System.out.println("다시 입력해주세요");
								System.out.print("MOVIE Type(only type Movie,KnuMovieDB,Tv_series) : ");
								Type = scanner.nextLine();
							}
						}
						newmoviepst.setString(2, Type);

						System.out.print("Runtime : ");
						Runtime = scanner.nextInt();
						newmoviepst.setInt(3, Runtime);

						System.out.print("Start_movie(YYYY-MM-DD) : ");
						Start_movie = scanner.nextLine();
						scanner.next();
						newmoviepst.setString(4, Start_movie);

						System.out.print("End_movie(YYYY-MM-DD) : ");
						End_movie = scanner.nextLine();
						scanner.next();
						newmoviepst.setString(5, End_movie);

						System.out.print("Isadult?(y/n) : ");
						String temp1;
						temp1 = scanner.nextLine();
						scanner.next();
						if (temp1.equals("y")) {
							newmoviepst.setInt(6, 1);
						} else {
							newmoviepst.setInt(6, 0);
						}

						int prs;
						try {
							prs = newmoviepst.executeUpdate();
							if (prs == 1) {
								System.out.println("Movie 등록 완료.");
							} else
								System.out.println("Fail");
						} catch (SQLException e) {
							e.printStackTrace();
						}

						// 장르 설정
						System.out.println("등록한 영화의 장르를 설정하세요");
						System.out.println("아래의 장르 중 선택하시오.");
						System.out.println("ex) Action, Comedy");
						ArrayList<String> list = new ArrayList<>();
						sql = "SELECT * FROM GENRE";
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							list.add(rs.getString(1));
						}

						for (int i = 0; i < list.size(); i++) {
							System.out.print(i + "." + list.get(i) + " ");
						}
						System.out.print("\n");

						String Genre;
						scanner = new Scanner(System.in);
						Genre = scanner.nextLine();

						System.out.println(Genre);
						String[] tokens = Genre.split(",");
						for (int i = 0; i < tokens.length; i++) {
							tokens[i] = tokens[i].trim();
							sql = "INSERT INTO MOVIEIS VALUES ('" + new_Tconst + "','" + tokens[i] + "')";
							try {
								stmt.executeUpdate(sql);
								System.out.println(tokens[i] + " Genre가 설정되었습니다");
							} catch (SQLException e) {
								System.out.println(tokens[i] + " Genre의 입력이 잘못되었습니다");
							}
						}
						// 배우 설정

						String actor_name;
						String actor_birth;
						int ab;
						int how_many_actor = 0;

						String last_actorid;

						System.out.println("등록한 영화에 출연한 배우를 설정하세요");
						System.out.println("차례대로 배우의 이름과 태어난 연도를 입력해주세요");
						System.out.println("저희 DB에서는 (이름, 연도)가 동일한 사람이 없다고 가정합니다");

						System.out.println("등록할 배우는 몇명입니까?");

						String how_many = scanner.nextLine();
						how_many_actor = Integer.parseInt(how_many);
						// how_many_actor = scanner.nextInt();

						System.out.println(how_many_actor);
						for (int i = 0; i < how_many_actor; i++) {
							System.out.println(i + 1 + "번째 배우 정보를 입력해주세요.");
							System.out.println("배우의 이름을 입력해주세요");
							actor_name = scanner.nextLine();
							// scanner.next();
							while (true) {
								System.out.println("배우의 탄생연도를 입력해주세요(ex>1997)");
								actor_birth = scanner.nextLine();
								// scanner.next();
								ab = Integer.parseInt(actor_birth);
								if (ab > 2020 || ab < 0) {
									System.out.print("적절치 않은 탄생연도입니다.");
									continue;
								} else {
									break;
								}
							}

							// DB에 이미 있는 배우인지 확인
							sql = "select * from actor where name = '" + actor_name + "' and bdate = '" + actor_birth
									+ "'";
							ResultSet endactorid = stmt.executeQuery(sql);
							if (endactorid.next() == false) { // DB안에는 배우가 없다
								System.out.println("등록된 배우가 없습니다! 새롭게 등록합니다.");

								// 새로운 배우 추가
								sql = "select max(actor_id) from actor";
								endactorid = stmt.executeQuery(sql);
								endactorid.next();
								last_actorid = endactorid.getString(1);
								endactorid.next();
								last_actorid = last_actorid.substring(2);

								int rem_actor;
								rem_actor = Integer.parseInt(last_actorid);
								rem_actor += 1;
								last_actorid = Integer.toString(rem_actor);
								String new_actorid = "nm";
								for (int j = 0; j < 7 - last_Tconst.length(); j++) {
									new_actorid += '0';
								}
								new_actorid += last_actorid;// 추가할 actor_id(new_actorid);

								sql = "INSERT INTO ACTOR VALUES ('" + new_actorid + "','" + actor_name + "','"
										+ actor_birth + "')";
								try {
									stmt.executeUpdate(sql);
								} catch (SQLException e2) {
									// TODO Auto-generated catch block
									e2.printStackTrace();
								}

								// appear 추가 (movei - actor)
								sql = "INSERT INTO APPEAR VALUES ('" + new_actorid + "', '" + new_Tconst + "')";
								try {
									stmt.executeUpdate(sql);
								} catch (SQLException e2) {
									// TODO Auto-generated catch block
									e2.printStackTrace();
								}

							} else { // DB안에 배우가 있다.
								System.out.println("등록된 배우가 있습니다!");
								// appear 추가 (movei - actor)
								String actor_id = endactorid.getString(1);

								sql = "INSERT INTO APPEAR VALUES ('" + actor_id + "', '" + new_Tconst + "')";
								try {
									stmt.executeUpdate(sql);
								} catch (SQLException e2) {
									// TODO Auto-generated catch block
									e2.printStackTrace();
								}
							}
						}

						// version 설정
						// INSERT INTO VERSION VALUES ('tt0000075',8,'The Conjuring of a Woman at the
						// House of Robert Houdin',null,null,1);
						// 1 : 원제목이라는 의미, region이 null이 됨
						int version_cnt = 1;
						// 원제목 넣기
						sql = "INSERT INTO VERSION VALUES ('" + new_Tconst + "'," + version_cnt + ",'" + Title
								+ "',null,null,1)";
						version_cnt++;
						try {
							stmt.executeUpdate(sql);
						} catch (SQLException e2) {
							// TODO Auto-generated catch block
							e2.printStackTrace();
						}

						String versioncheck;

						System.out.println("등록할 영화의 version을 선택해주십시오.");
						System.out.println("version이란 다른 나라에서 나타날 그 나라만의 영화 제목입니다.");
						System.out.println("version을 선택하시겠습니까? (y/n)");
						versioncheck = scanner.nextLine();

						if (versioncheck.equals("y")) {
							String version_title;
							String version_region;
							System.out.println("version 입력을 선택했습니다.");

							System.out.println("등록할 version은 몇개입니까?");

							// scanner.nextLine();
							how_many = scanner.nextLine();
							int how_many_version = Integer.parseInt(how_many);
							// how_many_actor = scanner.nextInt();
							System.out.println(how_many_version);

							for (int i = 0; i < how_many_version; i++) {
								System.out.println((i + 1) + "번째 version 입력입니다.");
								System.out.println("차례대로 영화제목, 나라의 이니셜(예시>KR) 을 입력해 주세요");
								System.out.println("영화제목을 입력해주세요");
								version_title = scanner.nextLine();
								System.out.println(version_title);
								System.out.println("나라의 이니셜(예시>KR)을 입력해 주세요");
								version_region = scanner.nextLine();
								System.out.println(version_region);
								sql = "INSERT INTO VERSION VALUES ('" + new_Tconst + "'," + version_cnt + ",'"
										+ version_title + "','" + version_region + "',null,0)";
								version_cnt++;
								try {
									stmt.executeUpdate(sql);
								} catch (SQLException e2) {
									// TODO Auto-generated catch block
									e2.printStackTrace();
								}
							}

						} else {
							System.out.println("version을 입력하지 않습니다");
							System.out.println("only KR인것으로 간주합니다.");
							sql = "INSERT INTO VERSION VALUES ('" + new_Tconst + "'," + version_cnt + ",'" + Title
									+ "','KR',null,0)";
							version_cnt++;
							try {
								stmt.executeUpdate(sql);
							} catch (SQLException e2) {
								// TODO Auto-generated catch block
								e2.printStackTrace();
							}
						}

						// episdoe 설정 tv_series일경우
						if (Type.equals("Tv_series")) {
							while (true) {
								System.out.println("차례대로 원작 제목, 시즌 넘버, 에피소드 넘버를 입력해주세요");
								System.out.println("등록할 영상물이 어떤 영상물의 에피소드인지 시즌1 에피소드1의 제목을 입력해주세요");
								System.out.println("만약 등록하는 영상물이 시즌1 에피소드1일경우 등록할 영상물의 이름을 적으시면 됩니다.");
								String episode_title = scanner.nextLine();
								System.out.println("몇시즌인지 입력해주세요(시즌이 없을경우 1)");
								int season_num = scanner.nextInt();
								System.out.println("에피소드 몇화인지 입력해주세요(첫 에피소드일 경우 1)");
								int episode_num = scanner.nextInt();

								// 기존 등록된 parentTconst,시즌,에피소드 비교해서 있을경우 이미있다고 알리고 다시 하기
								sql = "select * from movie where title='" + episode_title + "'";
								ResultSet output = stmt.executeQuery(sql);
								if (output.next() == false) { // 기존에 없음 == 새로 시즌1, 시즌1로 만들어야함
									System.out.println("기존에 등록된 영상물이 아닙니다.");
									System.out.println("진행하시겠습니까?(y/n)");
									String in = scanner.nextLine();
									if (in.equals("y")) { // y
										System.out.println(Title + "을 시즌1 에피소드1로 저장합니다.");
										// sql = "select * from episode where parentTconst='"+new_Tconst+"' and
										// seasonnumber = 1 and episodenumber = 1";
										sql = "INSERT INTO EPISODE VALUES('" + new_Tconst + "','" + new_Tconst
												+ "',1,1)";
										try {
											stmt.executeUpdate(sql);
										} catch (SQLException e2) {
											// TODO Auto-generated catch block
											e2.printStackTrace();
										}
										break;
									} else {
										continue;
									}
								} else { // 기존에 있음
									String mTconst = output.getString(1);
									sql = "select * from episode where parentTconst='" + mTconst
											+ "' and seasonnumber = " + season_num + " and episodenumber = "
											+ episode_num;
									output = stmt.executeQuery(sql);
									if (output.next() == false) {// 등록가능
										System.out.println(Title + "을 " + episode_title + "의 시즌" + season_num + " 에피소드"
												+ episode_num + "(으)로 저장합니다.");
										sql = "INSERT INTO EPISODE VALUES('" + new_Tconst + "','" + mTconst + "',"
												+ season_num + "," + episode_num + ")";
										try {
											stmt.executeUpdate(sql);
										} catch (SQLException e2) {
											// TODO Auto-generated catch block
											e2.printStackTrace();
										}
										break;
									} else {// 기존이랑 중복
										System.out.println("기존 시즌 에피소드랑 중복됩니다. 다시 입력해주세요");
										continue;
									}
								}
							}
						}
						System.out.println("영화 등록을 마치겠습니다");

					}
					break;
//7-2---------------------------------------------------------------------------------------------------		               
				case 2:// 등록된 영상물 정보 수정
					String Title;
					String LastTitle; // 수정전 title값 보존을 위함
					String Type;
					int Runtime;
					String Start_movie;
					String End_movie;
					int Isadult;
					String GenreType;
					String Actor;
					PreparedStatement upmoviepst = null;

					System.out.println("수정할 영상물의 이름를 입력해주세요 : ");
					Title = scanner.nextLine();
					LastTitle = Title;
					sql = "select Tconst from movie where title = '" + Title + "'";
					ResultSet Titletconst = stmt.executeQuery(sql);
					String Tconst;
					int Cflag;
					if (Titletconst.next() == false) {
						System.out.println("영화가 존재하지 않습니다.");
					} else {
						// title과 일치하는 tconst값 추출
						Tconst = Titletconst.getString(1);

						System.out.println("변경하고자하는 정보를 선택해주세요");
						System.out.println("1. Title 2. Type 3. Start_year 4.End_year 5. IsAdult 6. Genre");

						Cflag = Integer.parseInt(scanner.nextLine());

						switch (Cflag) {
						case 1:
							System.out.println("바꾸고자하는  Title 명을 입력해주세요 :");
							Title = scanner.nextLine();
							sql = "UPDATE MOVIE SET Title ='" + Title + "' WHERE Title='" + LastTitle + "'";
							try {
								updat = stmt.executeUpdate(sql);
								System.out.println("1  2");
								if (updat == 1) {
									System.out.println("Movie.Title이 변경되었습니다.");
								} else
									System.out.println("변경이 실패하였습니다.");
							} catch (SQLException e) {
								e.printStackTrace();
							}

							sql = "UPDATE VERSION SET Title ='" + Title + "' WHERE Title='" + LastTitle + "'";
							try {

								updat = stmt.executeUpdate(sql);
								System.out.println(updat);
								if (updat != 0) {
									System.out.println("Version.Title이 변경되었습니다.");
									break;
								} else
									System.out.println("변경이 실패하였습니다.");
							} catch (SQLException e2) {
								e2.printStackTrace();
							}
							break;

						case 2:
							System.out.println("바꾸고자하는  Type명을 입력해주세요 :");
							Type = scanner.nextLine();
							sql = "UPDATE MOVIE SET Type ='" + Type + "' WHERE Tconst='" + Tconst + "'";
							try {
								updat = stmt.executeUpdate(sql);
								if (updat == 1) {
									System.out.println("Type이 변경되었습니다.");
									break;
								} else
									System.out.println("변경이 실패하였습니다.");
							} catch (SQLException e) {
								e.printStackTrace();
							}
							break;
						case 3:
							System.out.println("바꾸고자하는  Start_year을 입력해주세요 :");
							Start_movie = scanner.nextLine();
							sql = "UPDATE MOVIE SET Start_year =TO_DATE('" + Start_movie
									+ "','YYYY-MM-DD') WHERE Tconst='" + Tconst + "'";
							try {
								updat = stmt.executeUpdate(sql);

								if (updat == 1) {
									System.out.println("Start_year이 변경되었습니다.");
									break;
								} else
									System.out.println("변경이 실패하였습니다.");
							} catch (SQLException e) {
								e.printStackTrace();
							}
							break;

						case 4:
							System.out.println("바꾸고자하는  End_year을 입력해주세요 :");
							End_movie = scanner.nextLine();
							sql = "UPDATE MOVIE SET End_year =TO_DATE('" + End_movie + "','YYYY-MM-DD') WHERE Tconst='"
									+ Tconst + "'";

							try {
								updat = stmt.executeUpdate(sql);

								if (updat == 1) {
									System.out.println("End_year이 변경되었습니다.");
									break;
								} else
									System.out.println("변경이 실패하였습니다.");
							} catch (SQLException e) {
								e.printStackTrace();
							}
							break;

						case 5:
							System.out.println("바꾸고자하는  IsAdult값을 입력해주세요 :");
							Isadult = Integer.parseInt(scanner.nextLine());
							sql = "UPDATE MOVIE SET IsAdult =" + Isadult + " WHERE Tconst='" + Tconst + "'";
							try {
								updat = stmt.executeUpdate(sql);

								if (updat == 1) {
									System.out.println("IsAdult값이 변경되었습니다.");
									break;
								} else
									System.out.println("변경이 실패하였습니다.");
							} catch (SQLException e) {
								e.printStackTrace();
							}
							break;

						case 6:
							System.out.println("바뀌었으면 하는  Genre명을 입력해주세요 : ");
							GenreType = scanner.next();
							System.out.println("바꾸고자하는  Genre명을 입력해주세요 : ");
							String GenreType2 = scanner.next();
							// String GenreType2 = "Fantasy";
							sql = "UPDATE MOVIEIS SET ParentGenretype ='" + GenreType2 + "' WHERE ParentTconst='"
									+ Tconst + "' AND ParentGenreType = '" + GenreType + "'";
							try {
								updat = stmt.executeUpdate(sql);
								if (updat == 1) {
									System.out.println("Genre명이 변경되었습니다.");
									break;
								} else
									System.out.println("Genre가 존재하지 않습니다."); // 값이 존재하지 않을때는 insert문으로 실행시킬지 ?
							} catch (SQLException e) {
								e.printStackTrace();
							}
							break;

						}
						System.out.println("Title 화면으로 넘어가려면 enter입력");
						scanner.nextLine();
						break;
					}
					// 여기에서 case 7종료
				default:
					System.out.println("잘못된 번호 입력");
				}
			}
		}
	}

}