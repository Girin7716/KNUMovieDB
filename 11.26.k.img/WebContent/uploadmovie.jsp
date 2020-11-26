<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import="dao.memberDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

</head>


<body>
	<%
		request.setCharacterEncoding("euc-kr");
	//System.out.println("Title, Type, Runtime, Start_movie, End_movie, Isadult");-->
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "movie";
	String pass = "movie";
	String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
	Connection conn = null;
	PreparedStatement pstmt;
	Statement stmt = null; // Statement object
	ResultSet rs;
	String sql = null;

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

	String[] actor_name = request.getParameterValues("actor_name");
	String[] actor_birth = request.getParameterValues("actor_byear");
	int ab;
	String rem = (String) request.getSession().getAttribute("how_many_actor");

	int how_many_actor = Integer.parseInt(rem);

	rem = (String) request.getSession().getAttribute("how_many_version");
	int how_many_version = Integer.parseInt(rem);
	String Title = (String) request.getSession().getAttribute("title");
	String Type = (String) request.getSession().getAttribute("type");

	String last_actorid;
	String last_Tconst = (String) request.getSession().getAttribute("last_Tconst");
	String new_Tconst = (String) request.getSession().getAttribute("new_Tconst");
	String episode_title = null;
	int season_num = 0;
	int episode_num = 0;
	if(Type.equals("Tv_series")){
		episode_title = (String) request.getSession().getAttribute("episode_title");
		rem = (String) request.getParameter("season_number");
		season_num = Integer.parseInt(rem);
		rem = (String) request.getParameter("episode_number");
		episode_num = Integer.parseInt(rem);
	}

	System.out.println(last_Tconst);
	// DB�� �̹� �ִ� ������� Ȯ��
	for (int i = 0; i < how_many_actor; i++) {
		sql = "select * from actor where name = '" + actor_name[i] + "' and bdate = '" + actor_birth[i] + "'";
		ResultSet endactorid = stmt.executeQuery(sql);
		if (endactorid.next() == false) { // DB�ȿ��� ��찡 ����
			System.out.println("��ϵ� ��찡 �����ϴ�! ���Ӱ� ����մϴ�.");

			// ���ο� ��� �߰�
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

			new_actorid += last_actorid;// �߰��� actor_id(new_actorid);
			System.out.println(new_actorid);

			sql = "INSERT INTO ACTOR VALUES ('" + new_actorid + "','" + actor_name[i] + "','" + actor_birth[i] + "')";

			System.out.println(sql);
			try {
		stmt.executeUpdate(sql);
			} catch (SQLException e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
			}

			// appear �߰� (movei - actor)
			sql = "INSERT INTO APPEAR VALUES ('" + new_actorid + "', '" + new_Tconst + "')";
			System.out.println(sql);
			try {
		stmt.executeUpdate(sql);
			} catch (SQLException e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
			}

		} else { // DB�ȿ� ��찡 �ִ�.
			System.out.println("��ϵ� ��찡 �ֽ��ϴ�!");
			// appear �߰� (movei - actor)
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

	int version_cnt = 1;
	// ������ �ֱ�
	sql = "INSERT INTO VERSION VALUES ('" + new_Tconst + "'," + version_cnt + ",'" + Title + "',null,null,1)";
	version_cnt++;
	try {
		stmt.executeUpdate(sql);
	} catch (SQLException e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
	}

	String[] version_title = request.getParameterValues("version_title");
	String[] version_region = request.getParameterValues("version_region");

	for (int i = 0; i < how_many_version; i++) {
		sql = "INSERT INTO VERSION VALUES ('" + new_Tconst + "'," + version_cnt + ",'" + version_title[i] + "','"
		+ version_region[i] + "',null,0)";
		version_cnt++;
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
	}
	System.out.println("version success");

	// episdoe ���� tv_series�ϰ��
	if (Type.equals("Tv_series")) {

		//System.out.println("���ʴ�� ���� ����, ���� �ѹ�, ���Ǽҵ� �ѹ��� �Է����ּ���");
		//System.out.println("����� ������ � ������ ���Ǽҵ����� ����1 ���Ǽҵ�1�� ������ �Է����ּ���");
		//System.out.println("���� ����ϴ� ������ ����1 ���Ǽҵ�1�ϰ�� ����� ������ �̸��� �����ø� �˴ϴ�.");
		//String episode_title = scanner.nextLine();
		//System.out.println("��������� �Է����ּ���(������ ������� 1)");
		//int season_num = scanner.nextInt();
		//System.out.println("���Ǽҵ� ��ȭ���� �Է����ּ���(ù ���Ǽҵ��� ��� 1)");
		//int episode_num = scanner.nextInt();

		// ���� ��ϵ� parentTconst,����,���Ǽҵ� ���ؼ� ������� �̹��ִٰ� �˸��� �ٽ� �ϱ�
		sql = "select * from movie where title='" + episode_title + "'";
		ResultSet output = stmt.executeQuery(sql);
		if (output.next() == false) { // ������ ���� == ���� ����1, ����1�� ��������
			System.out.println(Title + "�� ����1 ���Ǽҵ�1�� �����մϴ�.");
			// sql = "select * from episode where parentTconst='"+new_Tconst+"' and
			// seasonnumber = 1 and episodenumber = 1";
			sql = "INSERT INTO EPISODE VALUES('" + new_Tconst + "','" + new_Tconst + "',1,1)";
			try {
		stmt.executeUpdate(sql);
			} catch (SQLException e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
			}
		} else { // ������ ����
			String mTconst = output.getString(1);
			sql = "select * from episode where parentTconst='" + mTconst + "' and seasonnumber = " + season_num
			+ " and episodenumber = " + episode_num;
			output = stmt.executeQuery(sql);
			if (output.next() == false) {// ��ϰ���
		System.out.println(
				Title + "�� " + episode_title + "�� ����" + season_num + " ���Ǽҵ�" + episode_num + "(��)�� �����մϴ�.");
		sql = "INSERT INTO EPISODE VALUES('" + new_Tconst + "','" + mTconst + "'," + season_num + "," + episode_num
				+ ")";
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
			} else {// �����̶� �ߺ�
		System.out.println("���� ���� ���Ǽҵ�� �ߺ��˴ϴ�. �ٽ� �Է����ּ���");

			}
		}
	}

	System.out.println("Clear");
	//////////////////////////
	response.sendRedirect("index.jsp");
	%>

</html>