<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   <%@ page language = "java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>

<html lang="en">
<head>
<%
request.setCharacterEncoding("UTF-8");
String tconst = request.getParameter("tconst");
String ID = (String)request.getSession().getAttribute("ID");
String PassWord = (String)request.getSession().getAttribute("PassWord");
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "movie";
String pass = "movie";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
String sql = null;
Connection conn = null;
PreparedStatement pstmt;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url,user,pass);
//pstmt = conn.prepareStatement(sql);
//pstmt.executeUpdate();
%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Movie Review | Sign_in</title>

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
	width: 7%;
}

.content_right {
	float: right;
	width: 68%
}
</style>
<body>
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
                  <a href="index.jsp">Home</a> <span>Sign_in</span>
               </div>
<%
int img_name = Integer.parseInt(tconst.substring(2));
out.println("<p><div class = \"col-sm-6 col-md-3\">" + " <img src = \"movie_img/" + img_name + ".jpg\"> </div></p>");
%>
              
           <div class = "content_left">
            <%
            out.println("<p>Title</p>");
            out.println("<p>Type</p>");
            out.println("<p>Runtime</p>");
            out.println("<p>StartYear</p>");
            out.println("<p>EndYear</p>");
            out.println("<p>isAdult</p>");
            out.println("<p>Genre</p>");
            out.println("<p>Actors</p>");
            out.println("<p>Version</p>");
            %>       
            </div>
            
            <div class = "content_right">
      		<%
				sql = "SELECT * FROM MOVIE WHERE TCONST = '" + tconst + "'"; // VIEW에서 정보를 얻어옴
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					out.println("<p>" + rs.getString(2) + "</p>");
					out.println("<p>" + rs.getString(3) + "</p>");
					out.println("<p>" + rs.getInt(4) + "</p>");
					out.println("<p>" + rs.getString(5) + "</p>");
					out.println("<p>" + rs.getString(6) + "</p>");
					out.print("<p>");
					if (rs.getInt(7) == 1)
						out.println("Yes");
					else if (rs.getInt(7) == 0)
						out.println("No");
				}
				out.println("</p>");
				pstmt.close();
				
					out.print("<p>");
					sql = "SELECT PARENTGENRETYPE FROM MOVIE T, MOVIEIS M WHERE TCONST = '" + tconst
							+ "' AND T.TCONST = M.PARENTTCONST";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next())
						out.print(rs.getString(1) + " / ");
					out.println("</p>");
					pstmt.close();
					
					out.print("<p>");
					sql = "SELECT NAME FROM MOVIE T, APPEAR A, ACTOR AC WHERE TCONST = '" + tconst
							+ "' AND T.TCONST = A.PARENTTCONST AND A.PARENTACTOR_ID = AC.ACTOR_ID";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next())
						out.print(rs.getString(1) + " / ");
					out.println("</p>");
					pstmt.close();
					
					out.print("<p>");
					sql = "SELECT DISTINCT REGION FROM MOVIE T, VERSION V WHERE TCONST = '" + tconst
							+ "' AND T.TCONST = V.PARENTTCONST";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next())
						out.print(rs.getString(1) + " / ");
					out.println("</p>");
					pstmt.close();
      		%>
      		</div>
      		<!--  rating test -->
      		<%
      		sql = "SELECT PARENTTCONST FROM RATING WHERE PARENTTCONST = '" + tconst + "' AND PARENTACCOUNT = '" + ID + "'";
      		pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(!rs.next() && ID != null)
			{
				out.println("<div class = \"content_right\">");
			%>
			<form action="Rate.jsp" method="POST">
				<input type="text" name="Rate" placeholder="Rate(0~10)" size = 10>
				<%
				out.println("<input type=\"hidden\" name=\"tconst\" value =" + tconst + " >");
				 %>
				 <input type="submit" value="Rate">
			</form>
			<%
				out.println("</div>");
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