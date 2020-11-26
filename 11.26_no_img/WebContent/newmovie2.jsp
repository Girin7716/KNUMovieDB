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

<title>Upload New Movie</title>

<!-- Loading third party fonts -->
<link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|"
	rel="stylesheet" type="text/css">
<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- Loading main css file -->
<link rel="stylesheet" href="style.css">

<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->

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
	request.getSession().setAttribute("title", title);
	String type = request.getParameter("type");
	request.getSession().setAttribute("type", type);
	String runtime = request.getParameter("runtime");
	String start_movie = request.getParameter("start_movie");
	String end_movie = request.getParameter("end_movie");
	String isadult = request.getParameter("isadult");
	String[] genre = request.getParameterValues("genre");
	String actor_num = request.getParameter("how_many_actor");
	request.getSession().setAttribute("how_many_actor", actor_num);
	String version_num = request.getParameter("how_many_version");
	request.getSession().setAttribute("how_many_version",version_num);

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
	String last_Tconst=null;
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
	
	request.getSession().setAttribute("new_Tconst", new_Tconst);
	request.getSession().setAttribute("last_Tconst", last_Tconst);
	
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
		} else {
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
	int how_many_actor = Integer.parseInt(actor_num);
	int how_many_version = Integer.parseInt(version_num);

	//response.sendRedirect("index.jsp");
	%>

	<div id="site-content">
		<header class="site-header">
			<div class="container">
				<a href="index.jsp" id="branding"> <img src="images/logo.png"
					alt="" class="logo">
					<div class="logo-copy">
						<h1 class="site-title">KNU Movie DB</h1>
						<small class="site-description">Kihyun Sangjun Sangmin</small>
					</div>
				</a>
				<!-- #branding -->
				<div>
					<form action="Search.jsp" method="POST">
						<input type="text" name="Search"
							placeholder="Search(Title,Type,Genre,Version)" size=30> <input
							type="submit" value="Search">
					</form>
				</div>
				<div class="main-navigation">
					<button type="button" class="menu-toggle">
						<i class="fa fa-bars"></i>
					</button>
					<ul class="menu">
						<li class="menu-item current-menu-item"><a href="index.jsp">Home</a></li>
						<li class="menu-item"><a href="review.html">Movie reviews</a></li>
						<li class="menu-item"><a href="Login.jsp">Login</a></li>
						<li class="menu-item"><a href="signin.jsp">Sign_in</a></li>
					</ul>
					<!-- .menu -->

					<form action="#" class="search-form">
						<input type="text" placeholder="Search...">
						<button>
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
				<!-- .main-navigation -->

				<div class="mobile-navigation"></div>
			</div>
		</header>
		<main class="main-content">
			<div class="container">
				<div class="page">
					<div class="breadcrumbs">
						<a href="index.jsp">Home</a> <span>Upload New Movie</span>
					</div>

					<div class="content">
						<div class="row">

							<h2>Upload New Movie</h2>
							<form action="uploadmovie.jsp" method="POST">
								<div class="contact-form">
									<p>
										<%
										for (int i = 0; i < how_many_actor; i++) {
											out.println("Actor"+(i+1)+" : ");
											out.println("<input type=\"text\" name=\"actor_name\" placeholder=\"Actor Name...\">");
											out.println("<input type=\"number\" name=\"actor_byear\" placeholder=\"Actor BirthYear(ex>1997)...\">");
										}
										%>
									</p>
									
									<p>
										<%
										for (int i = 0; i < how_many_version; i++) {
											out.println("Version"+(i+1)+" : ");
											out.println("<input type=\"text\" name=\"version_title\" placeholder=\"Version_Title...\">");
											out.println("<input type=\"text\" name=\"version_region\" placeholder=\"Version_region(ex>KR)...\">");
										}
										%>
									</p>
										<%
										if(type.equals("Tv_series")){
											out.println("<p>Episode : "+" : ");
											//System.out.println("차례대로 원작 제목, 시즌 넘버, 에피소드 넘버를 입력해주세요");
											out.println("<input type=\"text\" name=\"episode_title\" placeholder=\"Original Title...\">");
											out.println("<input type=\"number\" name=\"season_number\" placeholder=\"Season_number(more than or equal 1)...\">");
											out.println("<input type=\"number\" name=\"episode_number\" placeholder=\"Episode_number(more than or equal 1)...\">");
											out.println("</p>");
										}
											%>
									
									<input type="submit" value="Upload New Movie">
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
			<!-- .container -->
		</main>
		<footer class="site-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<div class="widget">
							<h3 class="widget-title">About Us</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Quia tempore vitae mollitia nesciunt saepe cupiditate</p>
						</div>
					</div>
					<div class="col-md-2">
						<div class="widget">
							<h3 class="widget-title">Recent Review</h3>
							<ul class="no-bullet">
								<li>Lorem ipsum dolor</li>
								<li>Sit amet consecture</li>
								<li>Dolorem respequem</li>
								<li>Invenore veritae</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2">
						<div class="widget">
							<h3 class="widget-title">Help Center</h3>
							<ul class="no-bullet">
								<li>Lorem ipsum dolor</li>
								<li>Sit amet consecture</li>
								<li>Dolorem respequem</li>
								<li>Invenore veritae</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2">
						<div class="widget">
							<h3 class="widget-title">Join Us</h3>
							<ul class="no-bullet">
								<li>Lorem ipsum dolor</li>
								<li>Sit amet consecture</li>
								<li>Dolorem respequem</li>
								<li>Invenore veritae</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2">
						<div class="widget">
							<h3 class="widget-title">Social Media</h3>
							<ul class="no-bullet">
								<li>Facebook</li>
								<li>Twitter</li>
								<li>Google+</li>
								<li>Pinterest</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2">
						<div class="widget">
							<h3 class="widget-title">Newsletter</h3>
							<form action="#" class="subscribe-form">
								<input type="text" placeholder="Email Address">
							</form>
						</div>
					</div>
				</div>
				<!-- .row -->

				<div class="colophon">Copyright 2014 Company name, Designed by
					Themezy. All rights reserved</div>
			</div>
			<!-- .container -->

		</footer>
	</div>
	<!-- Default snippet for navigation -->



	<script src="js/jquery-1.11.1.min.js"></script>
	<script
		src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
	<script src="js/plugins.js"></script>
	<script src="js/app.js"></script>

</body>

</html>