<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="en">
<head>
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
                  <a href="index.jsp">Home</a> <span>Sign_in</span>
               </div>

               <div class="content">
                  <div class="row">

                     <h2>Log_in</h2>
                     <form action="Loginrequest.jsp" method="POST">
                        <div class="contact-form">
                           <input type="text" name="ID" placeholder="ID..."> <input
                              type="password" name="PassWord" placeholder="PassWord...">
                           <input type="submit" value="Send Message ">
                        </div>
		
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