<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   <%@ page language = "java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>

<html lang="en">
<head>
<%
String Search = request.getParameter("Search");
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

               <div class="content">
                  <div class="row">

                    <h2>Search_result</h2>
      				<%
    				if (!Search.equals("")) {
    					String[] temp = Search.split(",");
    					sql = "CREATE OR REPLACE VIEW TITLE_VIEW AS SELECT * FROM MOVIE WHERE ";
    					for (int i = 0; i < temp.length; i++) {
    						if (i == 0)
    							sql += "TITLE = '" + temp[i].trim() + "' ";
    						else
    							sql += "OR TITLE = '" + temp[i].trim() + "' ";
    					}
    					System.out.println(sql);
    					pstmt = conn.prepareStatement(sql);
    					pstmt.executeUpdate();
    				}
      				%>
      				<%
      				if (!Search.equals("")) {
    					String[] temp = Search.split(",");
    					sql = "CREATE OR REPLACE VIEW TYPE_VIEW AS SELECT * FROM MOVIE WHERE ";
    					for (int i = 0; i < temp.length; i++) {
    						if (i == 0)
    							sql += "TYPE = '" + temp[i].trim() + "' ";
    						else
    							sql += "OR TYPE = '" + temp[i].trim() + "' ";
    					}System.out.println(sql);
    					pstmt = conn.prepareStatement(sql);
    					pstmt.executeUpdate();
    				}
      				%>
      				<%
    				if (!Search.equals("")) {
    					String[] temp = Search.split(",");
    					sql = "CREATE OR REPLACE VIEW GENRE_VIEW AS SELECT DISTINCT PARENTTCONST FROM MOVIEIS WHERE ";
    					for (int i = 0; i < temp.length; i++) {
    						if (i == 0)
    							sql += "PARENTGENRETYPE = '" + temp[i].trim() + "' ";
    						else
    							sql += "OR PARENTGENRETYPE = '" + temp[i].trim() + "' ";
    					}System.out.println(sql);
    					pstmt = conn.prepareStatement(sql);
    					pstmt.executeUpdate();
    				}
      				%>
      				
      				<%
      				if (!Search.equals("")) {
    					String[] temp = Search.split(",");
    					sql = "CREATE OR REPLACE VIEW VERSION_VIEW AS SELECT * FROM VERSION WHERE ";
    					for (int i = 0; i < temp.length; i++) {
    						if (i == 0)
    							sql += "REGION = '" + temp[i].trim() + "' ";
    						else
    							sql += "OR REGION = '" + temp[i].trim() + "' ";
    					}System.out.println(sql);
    					pstmt = conn.prepareStatement(sql);
    					pstmt.executeUpdate();
    				}
    				%>
      				<%
    				int[] flags = new int[4];
    				sql = "SELECT * FROM TITLE_VIEW";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next())
						flags[0] = 1;

					
					sql = "SELECT * FROM TYPE_VIEW";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next())
						flags[1] = 1;
	
					
					sql = "SELECT * FROM GENRE_VIEW";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next())
						flags[2] = 1;

					
					sql = "SELECT * FROM VERSION_VIEW";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next())
						flags[3] = 1;

					sql = "CREATE OR REPLACE VIEW TEMP AS ";
    				sql += "(SELECT M.TCONST, M.TITLE, M.TYPE, M.RUNTIME, M.START_YEAR, M.END_YEAR, M.ISADULT ";
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
    				// WHEREÀý
    				for(int i = 0; i<4; i++)
    				{
    					if(flags[i] == 1)
    						{
    						sql+="WHERE ";
    						break;
    						}
    					if(i == 3)
    	   					Search="";
    				}
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
    						sql += ") ";
    						if(ID != null)
    						sql += " MINUS (SELECT M.Tconst, M.Title, M.Type, M.Runtime, M.Start_year, M.End_year, M.IsAdult FROM MOVIE M, RATING R WHERE R.PARENTACCOUNT = '" + ID + "' AND M.TCONST = R.PARENTTCONST)";
      			
    				if(Search != ""){
							pstmt = conn.prepareStatement(sql);
 							pstmt.executeUpdate();
        					
 							sql = "SELECT * FROM TEMP";
 							pstmt = conn.prepareStatement(sql);
 							rs = pstmt.executeQuery();
 							while(rs.next())
 							{
 								String movie_Tconst = rs.getString(1);
 								out.println("<a href = \"test.jsp\">" + rs.getString(2) + "</a>");
 								out.println(rs.getString(3));
 								out.println(rs.getString(4));
 								out.println(rs.getString(5));
 								out.println(rs.getString(6));
 								
 								out.println("<li>Genre : ");
 								sql = "SELECT PARENTGENRETYPE FROM TEST T, MOVIEIS M WHERE T.TCONST = '" + movie_Tconst + "' AND T.TCONST = M.PARENTTCONST"; 								
 								pstmt = conn.prepareStatement(sql);
 								ResultSet output = pstmt.executeQuery();
 								while (output.next())
 									out.println(output.getString(1) + " /");
 								out.println("</li>");
 								pstmt.close();
 								
 								out.println("<li>Actor : ");
 								sql = "SELECT NAME FROM TEST T, APPEAR A, ACTOR AC WHERE T.TCONST = '" + movie_Tconst
 										+ "' AND T.TCONST = A.PARENTTCONST AND A.PARENTACTOR_ID = AC.ACTOR_ID";
 								pstmt = conn.prepareStatement(sql);
 								output = pstmt.executeQuery();
 								while (output.next())
 									out.println(output.getString(1) + " /");
 								out.println("</li>");
 								pstmt.close();
 						
 								out.println("<li>Version : ");
 								sql = "SELECT DISTINCT REGION FROM TEST T, VERSION V WHERE T.TCONST = '" + movie_Tconst
 										+ "' AND T.TCONST = V.PARENTTCONST";
 								pstmt = conn.prepareStatement(sql);
 								output = pstmt.executeQuery();
 								while (output.next())
 									out.println(output.getString(1) + " /");
 								out.println("</li>");
 								pstmt.close();
 								%>
 								<br></br>
 								<%
 							}
    				}
    				else
    					out.println("no search");
        				
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