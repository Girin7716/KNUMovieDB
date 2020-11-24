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

<title>Movie Review | My info</title>

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

<style>
.content_left {
	float: left;
	width: 20%;
}

.content_right {
	float: right;
	width: 80%;
}
</style>

<body>
	<%
		String ID = (String) request.getSession().getAttribute("ID");
	out.println("ID : " + ID);
	String PassWord = (String) request.getSession().getAttribute("PassWord");
	out.println("PassWord : " + PassWord);
	%>

	<%
		String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "movie";
	String pass = "movie";
	String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;

	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	//String query = "SELECT Dnumber, Dname, Mgr_Ssn, Mgr_start_date FROM DEPARTMENT ORDER BY Dnumber";
	//System.out.println(query);
	%>

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
							if (ID == null)
							out.println("<li class=\"menu-item\"><a href=\"Login.jsp\">Login</a></li>");
						else
							out.println("<li class=\"menu-item\"><a href=\"Logout.jsp\">Logout</a></li>");
						%>

						<%
							if (ID == null)
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
						<a href="index.jsp">Home</a> <span>Join Us</span>
					</div>

					<div class="content_left">
						<%
							System.out.println(ID);
						String query = "select * from account where account_id = '" + ID + "'";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();

						//out.println("<table border=\"1\">");
						ResultSetMetaData rsmd = rs.getMetaData();
						int cnt = rsmd.getColumnCount();
						for (int i = 1; i <= cnt; i++) {
							out.println("<p>" + rsmd.getColumnName(i) + "</p>");
						}
						/*
						int cnt = 1;
						while (rs.next()) {
							//out.println("<tr>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(1) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(2) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(3) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(4) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(5) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(6) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(7) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(8) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(9) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(10) + "</p>");
							out.println("<p>" + rsmd.getColumnName(cnt++) + " : " + rs.getString(11) + "</p>");
							//out.println("</tr>");
						}
						*/
						%>
					</div>
					<div class="content_right">
						<%
							while (rs.next()) {
							//out.println("<tr>");
							out.println("<p>" + rs.getString(1) + "</p>");
							out.println("<p>" + rs.getString(2) + "</p>");
							out.println("<p>" + rs.getString(3) + "</p>");
							out.println("<p>" + rs.getString(4) + "</p>");
							out.println("<p>" + rs.getString(5) + "</p>");
							out.println("<p>" + rs.getString(6) + "</p>");
							out.println("<p>" + rs.getString(7) + "</p>");
							out.println("<p>" + rs.getString(8) + "</p>");
							out.println("<p>" + rs.getString(9) + "</p>");
							out.println("<p>" + rs.getString(10) + "</p>");
							out.println("<p>" + rs.getString(11) + "</p>");
							//out.println("</tr>");
						}
						%>
					</div>
					<form action="delete.jsp" method="POST" name = "delete">
						<input type="submit" value="È¸¿ø Å»Åð">
					</form>
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
						<h3 class="widget-title">My info</h3>
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