<!DOCTYPE html>
<html lang="ko">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MBTIng</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/business-frontpage.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">MBTIng</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</nav>

	<!-- Header -->
	<header class="bg-danger py-5 mb-5" style="opacity: 0.6;">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2">MBTIng에 오신걸 환영합니다!</h1>
					<p class="lead mb-5 text-white-50">
						저희 MBTIng는 성격유형검사인 MBTI를 기반으로 최적의 인연을 만날 수 있도록 도와드리는 매칭서비스 입니다!<br>
						계정이 있으신 분은 로그인을, 없으신 분은 회원가입을 하십시오.
					</p>
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-md-8 mb-5">
				<h2>Sign In</h2>
				<hr>
				<form method="post" action="signincheck.jsp">
					<div class="form-group">
						<label for="exampleInputEmail1">ID</label> <input type="text"
							class="form-control" name="inputid" aria-describedby="emailHelp"
							placeholder="Enter ID"> <small id="emailHelp"
							class="form-text text-muted">We'll never share your ID
							with anyone else.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" name="inputpassword"
							placeholder="Password">
					</div>
					<button type="submit" class="btn btn-danger">Sign In
						&raquo;</button>
				
					&nbsp;&nbsp;
				</form>
				<br>
				<a href="signup.jsp"><button type="submit"
						class="btn btn-danger">Sign Up &raquo;</button></a>
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; MBTIng 대표 김기현</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>

</html>