<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Movie Review | Review</title>

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

<%
String ID = (String)request.getSession().getAttribute("ID");
String PassWord = (String)request.getSession().getAttribute("PassWord");
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "movie";
String pass = "movie";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
Connection conn = null;
PreparedStatement pstmt;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url,user,pass);
String sql = "CREATE OR REPLACE VIEW TEST AS SELECT * FROM MOVIE MINUS (SELECT M.Tconst, M.Title, M.Type, M.Runtime, M.Start_year, M.End_year, M.IsAdult FROM MOVIE M, RATING R WHERE R.PARENTACCOUNT = '"
		+ ID + "' AND M.TCONST = R.PARENTTCONST)";
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();
%>
</head>


<body>
	<div id="site-content">
		<header class="site-header">
			<div class="container">
				<a href="index.jsp" id="branding"> <img src="images/logo.png"
					alt="" class="logo">
					<div class="logo-copy">
						<h1 class="site-title">Company Name</h1>
						<small class="site-description">Tagline goes here</small>
					</div>
				</a>
				<!-- #branding -->
<div>
 				<form action="Search.jsp" method="POST">
					<input type="text" name="Search" placeholder="Search(Title,Type,Genre,Version)" size = 30>
					 <input type="submit" value="Search">
				</form>
					</div>		
				<div class="main-navigation">
					<button type="button" class="menu-toggle">
						<i class="fa fa-bars"></i>
					</button>
					<ul class="menu">
						<li class="menu-item current-menu-item"><a href="index.jsp">Home</a></li>
						<%
								out.println("<li class=\"menu-item\"><a href=\"review.jsp\">Review</a></li>");
							%>

						<%
							if(ID == null)
							out.println("<li class=\"menu-item\"><a href=\"Login.jsp\">Login</a></li>");
							else
							out.println("<li class=\"menu-item\"><a href=\"Logout.jsp\">Logout</a></li>");
							%>

						<%
							if(ID == null)
								out.println("<li class=\"menu-item\"><a href=\"signin.jsp\">Sign_in</a></li>");
							else
								out.println("<li class=\"menu-item\"><a href=\"myinfo.jsp\">MyInfo</a></li>");
							%>
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
						<a href="index.html">Home</a> <span>Movie Review</span>
					</div>

		<%
			sql = "WITH AVG_TABLE AS (SELECT R.PARENTTCONST, AVG(R.RATING) AVG FROM RATING R GROUP BY PARENTTCONST) SELECT M.TCONST, TITLE, R.Rating, AVG FROM MOVIE M, RATING R, AVG_TABLE A WHERE R.PARENTACCOUNT = '"
				+ ID + "' AND M.TCONST = R.PARENTTCONST AND M.Tconst = A.PARENTTCONST";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			while (rs.next()) {
				String movie_Tconst = rs.getString(1);
				int img_name = Integer.parseInt(movie_Tconst.substring(2));
				out.println("<div class = \"col-sm-2 col-md-2\">"+ " <a href = \"test.jsp?tconst="+ movie_Tconst + " \"> " + " <img src = \"movie_img/" + img_name + ".jpg\"> </a></div>");
				out.println("<a href = \"test.jsp?tconst=" + movie_Tconst + " \"> " + rs.getString(2) + "</a>");
				out.println("<br>MyRating : " + rs.getDouble(3));
				out.println("<br>AVG : " + rs.getDouble(4));
				out.println("<br></br>");
				out.println("<br></br>");
				out.println("<br></br>");
				out.println("<br></br>");
				out.println("<br></br>");
				out.println("<br></br>");
				out.println("<br></br>");
			}
			pstmt.close();
		%>

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
	<script src="js/plugins.js"></script>
	<script src="js/app.js"></script>

</body>

</html>