<%@ page import="Login.Login"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Movie Review</title>

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
	String ID = (String) request.getSession().getAttribute("ID");
String PassWord = (String) request.getSession().getAttribute("PassWord");
Integer Type = (Integer) request.getSession().getAttribute("Type");
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
String sql = null;
%>

</head>
<body>

	<div id="site-content">
		<header class="site-header">
			<div class="container">
				<a href="index.jsp" id="branding"> <img src="images/logo.png"
					alt="" class="logo">
					<div class="logo-copy">
						<h1 class="site-title">Knu_DB_Movie</h1>
						<small class="site-description">Kihyun Sangjung Sangmin</small>
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
						<%
							if (Type == null) {

						} else if (Type == 1)
							out.println("<li class=\"menu-item\"><a href=\"admin.jsp\">Admin_Mode</a></li>");
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
					<div class="row">
						<div class="col-md-9">
							<div class="slider">
								<ul class="slides">
									<%
										sql = "select ParentTconst,sum(rating) SUMRATE from Rating Group by ParentTconst Order by SUMRATE DESC";
									pstmt = conn.prepareStatement(sql);
									rs = pstmt.executeQuery();
									for (int i = 0; i < 3; i++) {
										rs.next();
										String ttconst = rs.getString(1);
										int img_name = Integer.parseInt(ttconst.substring(2));
										out.println("<li><a href = \"test.jsp?tconst=" + ttconst + " \"> " + " <img src = \"movie_img/" + img_name
										+ ".jpg\" alt =\"Slide " + i + 1 + "\"></a></li>");
									}
									pstmt.close();
									//   <li><a href="#"><img src="dummy/1.jpg" alt="Slide 1"></a></li>
									//   <li><a href="#"><img src="dummy/3.jpg" alt="Slide 2"></a></li>
									//   <li><a href="#"><img src="dummy/4.jpg" alt="Slide 3"></a></li>
									%>
								</ul>
							</div>
						</div>
						
						<%
							//
						out.println("<div class=\"col-md-3\">");
						out.println("<div class=\"row\">");

						sql = "SELECT TCONST FROM MOVIE ORDER BY START_YEAR DESC";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						for (int i = 0; i < 2; i++) {
							rs.next();
							String ttconst = rs.getString(1);
							int img_name = Integer.parseInt(ttconst.substring(2));
							out.println("<div class = \"col-sm-6 col-md-12\">" + "<div class=\"latest-movie\"> <a href = \"test.jsp?tconst="
							+ ttconst + " \"> " + " <img src = \"movie_img/" + img_name + ".jpg\"> </a></div></div>");
						}
						out.println("</div>");
						out.println("</div>");
						pstmt.close();
						%>
					</div>

					<!-- .row -->
					<div class="row">
					<hr>
					<h3>&nbsp&nbspRecommand for Man<% for(int i=0;i<48;i++){out.println("&nbsp");} %>Recommand for Woman</h3></hr>
						<%
							sql = "With MAN as(select * from account where sex = \'M\') select r.parentTconst, sum(r.rating) from MAN m, Rating r where m.account_id = r.parentaccount group by r.parentTconst order by sum(r.rating) desc";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						for (int i = 0; i < 2; i++) {
							rs.next();
							String ttconst = rs.getString(1);
							int img_name = Integer.parseInt(ttconst.substring(2));
							out.println("<div class = \"col-sm-6 col-md-3\">" + "<div class=\"latest-movie\"> <a href = \"test.jsp?tconst="
							+ ttconst + " \"> " + " <img src = \"movie_img/" + img_name + ".jpg\" alt = \"Movie " + i + 3
							+ "\"> </a></div></div>");
						}
						pstmt.close();
						%>
						
						<%

						sql = "With MAN as(select * from account where sex = \'F\') select r.parentTconst, sum(r.rating) from MAN m, Rating r where m.account_id = r.parentaccount group by r.parentTconst order by sum(r.rating) desc";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						for (int i = 0; i < 2; i++) {
							rs.next();
							String ttconst = rs.getString(1);
							int img_name = Integer.parseInt(ttconst.substring(2));
							out.println("<div class = \"col-sm-6 col-md-3\">" + "<div class=\"latest-movie\"> <a href = \"test.jsp?tconst="
							+ ttconst + " \"> " + " <img src = \"movie_img/" + img_name + ".jpg\" alt = \"Movie " + i + 5
							+ "\"> </a></div></div>");
						}
						pstmt.close();
						%>
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
							<li><a href="#">Lorem ipsum dolor</a></li>
							<li><a href="#">Sit amet consecture</a></li>
							<li><a href="#">Dolorem respequem</a></li>
							<li><a href="#">Invenore veritae</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget-title">Help Center</h3>
						<ul class="no-bullet">
							<li><a href="#">Lorem ipsum dolor</a></li>
							<li><a href="#">Sit amet consecture</a></li>
							<li><a href="#">Dolorem respequem</a></li>
							<li><a href="#">Invenore veritae</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget-title">Join Us</h3>
						<ul class="no-bullet">
							<li><a href="#">Lorem ipsum dolor</a></li>
							<li><a href="#">Sit amet consecture</a></li>
							<li><a href="#">Dolorem respequem</a></li>
							<li><a href="#">Invenore veritae</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget-title">Social Media</h3>
						<ul class="no-bullet">
							<li><a href="#">Facebook</a></li>
							<li><a href="#">Twitter</a></li>
							<li><a href="#">Google+</a></li>
							<li><a href="#">Pinterest</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget-title">Newsletter</h3>

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