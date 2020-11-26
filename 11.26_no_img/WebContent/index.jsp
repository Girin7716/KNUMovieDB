<%@ page import="Login.Login"%>
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
</head>
<body>
	<%
		String ID = (String)request.getSession().getAttribute("ID");
		out.println("ID : " + ID);
		String PassWord = (String)request.getSession().getAttribute("PassWord");
		out.println("PassWord : " + PassWord);
		Integer Type = (Integer)request.getSession().getAttribute("Type");
		out.println("Type : " + Type);
	%>
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
						<%
							if(Type == null){
							
							}
							else if(Type ==1)
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
									<li><a href="#"><img src="dummy/1.jpg" alt="Slide 1"></a></li>
									<li><a href="#"><img src="dummy/3.jpg" alt="Slide 2"></a></li>
									<li><a href="#"><img src="dummy/4.jpg" alt="Slide 3"></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-3">
							<div class="row">
								<div class="col-sm-6 col-md-12">
									<div class="latest-movie">
										<a href="#"><img src="dummy/5.jpg" alt="Movie 1"></a>
									</div>
								</div>
								<div class="col-sm-6 col-md-12">
									<div class="latest-movie">
										<a href="#"><img src="dummy/6.jpg" alt="Movie 2"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- .row -->
					<div class="row">
						<div class="col-sm-6 col-md-3">
							<div class="latest-movie">
								<a href="#"><img src="dummy/7.jpg" alt="Movie 3"></a>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="latest-movie">
								<a href="#"><img src="dummy/8.jpg" alt="Movie 4"></a>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="latest-movie">
								<a href="#"><img src="dummy/9.jpg" alt="Movie 5"></a>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="latest-movie">
								<a href="#"><img src="dummy/10.jpg" alt="Movie 6"></a>
							</div>
						</div>
					</div>
					<!-- .row -->

					<div class="row">
						<div class="col-md-4">
							<h2 class="section-title">December premiere</h2>
							<p>Lorem ipsum dolor sit amet consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore.</p>
							<ul class="movie-schedule">
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
							</ul>
							<!-- .movie-schedule -->
						</div>
						<div class="col-md-4">
							<h2 class="section-title">November premiere</h2>
							<p>Lorem ipsum dolor sit amet consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore.</p>
							<ul class="movie-schedule">
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
							</ul>
							<!-- .movie-schedule -->
						</div>
						<div class="col-md-4">
							<h2 class="section-title">October premiere</h2>
							<p>Lorem ipsum dolor sit amet consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore.</p>
							<ul class="movie-schedule">
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
								<li>
									<div class="date">16/12</div>
									<h2 class="entry-title">
										<a href="#">Perspiciatis unde omnis</a>
									</h2>
								</li>
							</ul>
							<!-- .movie-schedule -->
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