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
	// DB에 이미 있는 배우인지 확인
	for (int i = 0; i < how_many_actor; i++) {
		sql = "select * from actor where name = '" + actor_name[i] + "' and bdate = '" + actor_birth[i] + "'";
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
			System.out.println(new_actorid);

			sql = "INSERT INTO ACTOR VALUES ('" + new_actorid + "','" + actor_name[i] + "','" + actor_birth[i] + "')";

			System.out.println(sql);
			try {
		stmt.executeUpdate(sql);
			} catch (SQLException e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
			}

			// appear 추가 (movei - actor)
			sql = "INSERT INTO APPEAR VALUES ('" + new_actorid + "', '" + new_Tconst + "')";
			System.out.println(sql);
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

	int version_cnt = 1;
	// 원제목 넣기
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

	// episdoe 설정 tv_series일경우
	if (Type.equals("Tv_series")) {

		//System.out.println("차례대로 원작 제목, 시즌 넘버, 에피소드 넘버를 입력해주세요");
		//System.out.println("등록할 영상물이 어떤 영상물의 에피소드인지 시즌1 에피소드1의 제목을 입력해주세요");
		//System.out.println("만약 등록하는 영상물이 시즌1 에피소드1일경우 등록할 영상물의 이름을 적으시면 됩니다.");
		//String episode_title = scanner.nextLine();
		//System.out.println("몇시즌인지 입력해주세요(시즌이 없을경우 1)");
		//int season_num = scanner.nextInt();
		//System.out.println("에피소드 몇화인지 입력해주세요(첫 에피소드일 경우 1)");
		//int episode_num = scanner.nextInt();

		// 기존 등록된 parentTconst,시즌,에피소드 비교해서 있을경우 이미있다고 알리고 다시 하기
		sql = "select * from movie where title='" + episode_title + "'";
		ResultSet output = stmt.executeQuery(sql);
		if (output.next() == false) { // 기존에 없음 == 새로 시즌1, 시즌1로 만들어야함
			System.out.println(Title + "을 시즌1 에피소드1로 저장합니다.");
			// sql = "select * from episode where parentTconst='"+new_Tconst+"' and
			// seasonnumber = 1 and episodenumber = 1";
			sql = "INSERT INTO EPISODE VALUES('" + new_Tconst + "','" + new_Tconst + "',1,1)";
			try {
		stmt.executeUpdate(sql);
			} catch (SQLException e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
			}
		} else { // 기존에 있음
			String mTconst = output.getString(1);
			sql = "select * from episode where parentTconst='" + mTconst + "' and seasonnumber = " + season_num
			+ " and episodenumber = " + episode_num;
			output = stmt.executeQuery(sql);
			if (output.next() == false) {// 등록가능
		System.out.println(
				Title + "을 " + episode_title + "의 시즌" + season_num + " 에피소드" + episode_num + "(으)로 저장합니다.");
		sql = "INSERT INTO EPISODE VALUES('" + new_Tconst + "','" + mTconst + "'," + season_num + "," + episode_num
				+ ")";
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
			} else {// 기존이랑 중복
		System.out.println("기존 시즌 에피소드랑 중복됩니다. 다시 입력해주세요");

			}
		}
	}

	System.out.println("Clear");
	//////////////////////////
	response.sendRedirect("index.jsp");
	%>

</html>