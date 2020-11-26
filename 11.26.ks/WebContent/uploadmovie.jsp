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

	String title = request.getParameter("title");
	String type = request.getParameter("type");
	String runtime = request.getParameter("runtime");
	String start_movie = request.getParameter("start_movie");
	String end_movie = request.getParameter("end_movie");
	String isadult = request.getParameter("isadult");
	String[] genre = request.getParameterValues("genre");

	System.out.println(title);
	System.out.println(type);
	System.out.println(runtime);
	System.out.println(start_movie);
	System.out.println(end_movie);
	System.out.println(isadult);
	for (String val : genre) {
		System.out.println(val);
	}
	
	
	
	sql = "select max(tconst) from movie";
	ResultSet endtconst = stmt.executeQuery(sql);
	String last_Tconst;
	String new_Tconst = "tt";

	if (endtconst.next() == false) {
		System.out.println("등록된 영화가 없습니다!");
		new_Tconst += "0000001";
	} else {
		// 제일 마지막 Tconst를 기준으로 +1하는 과정
		last_Tconst = endtconst.getString(1);
		last_Tconst = last_Tconst.substring(2);
		int rem;
		rem = Integer.parseInt(last_Tconst);
		rem += 1;
		last_Tconst = Integer.toString(rem);

		for (int i = 0; i < 7 - last_Tconst.length(); i++) {
			new_Tconst += '0';
		}
		new_Tconst += last_Tconst;// 추가할 Tconst(new_Tconst);
	}

	PreparedStatement newmoviepst = null;
	sql = "INSERT INTO MOVIE VALUES ('" + new_Tconst + "',?,?,?,?,?,?)";
	newmoviepst = conn.prepareStatement(sql);

	newmoviepst.setString(1, title);
	newmoviepst.setString(2, type);
	newmoviepst.setInt(3, Integer.parseInt(runtime));
	newmoviepst.setString(4, start_movie);
	newmoviepst.setString(5, end_movie);
	newmoviepst.setInt(6, Integer.parseInt(isadult));

	int prs;
	try {
		prs = newmoviepst.executeUpdate();
		if (prs == 1) {
			System.out.println("Movie 등록 완료.");
		} else{
			System.out.println("Fail");
			%>
			<script>
				alert("Movie Upload Fail!");
				history.go(-1);
			</script>
			<%
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}

	//장르 등록
	for (String val : genre) {
		System.out.println(val);
		sql = "INSERT INTO MOVIEIS VALUES ('" + new_Tconst + "','" + val + "')";
		try {
			stmt.executeUpdate(sql);
			System.out.println("Genre Success!");
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
			%>
			<script>
				alert("Genre Upload Fail!");
				history.go(-1);
			</script>
			<%
		}
	}

	response.sendRedirect("newmovie2.jsp");
	%>

</body>

</html>