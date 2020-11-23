<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<%@ page import="dao.memberDAO"%>

<title>MBTIng 매칭</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/business-frontpage.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="./main.jsp">MBTIng</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="./main.jsp">홈으로
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="./matchDisplay.jsp">매칭</a> <span class="sr-only">(current)</span>
					</li>
					<li class="nav-item"><a class="nav-link" href="./bulletboard.jsp">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="./myinfo.jsp">내정보</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="bg-danger py-5 mb-5" style="opacity: 0.6;">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2">축하합니다!</h1>
					<p class="lead mb-5 text-white-50">매칭이 완료되었습니다!</p>
				</div>
				<%
					request.setCharacterEncoding("euc-kr");

					String myid = (String) session.getAttribute("nowid");

					memberDAO dao = memberDAO.getInstance();
					String[] yourtotal = dao.getWho().clone(); //짝꿍 total 저장
					System.out.println(yourtotal[0]);
					System.out.println(yourtotal[5]);
				%>
				<p class="lead mb-5 text-white-50">
					당신의 상대는 <strong>
						<%
							out.println(yourtotal[0]);
						%>
					</strong>이며, 카카오톡 아이디는 <strong>
						<%
							out.println(yourtotal[5]);
						%>
					</strong>입니다!
				</p>
				<br>
			</div>
			<p class="lead mb-5 text-white-50">지금 당장 운명의 상대에게 연락하세요!</p>
		</div>
	</header>



	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; MBTIng 대표
				김기현</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>