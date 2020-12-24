<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.memberDAO"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MBTIng 내 정보</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/business-frontpage.css" rel="stylesheet">

<style>
p {
	font-family: "Nanum Gothic", sans-serif;
	font-size: 20px;
}
</style>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="./index.html">MBTIng</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="./main.jsp">홈으로
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="./matchDisplay.jsp">매칭</a> <span class="sr-only">(current)</span></li>
					<li class="nav-item"><a class="nav-link"
						href="./bulletboard.jsp">게시판</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="./myinfo.jsp">내정보</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="bg-danger py-5 mb-5" style="opacity: 0.6">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2">내 정보</h1>
					<p class="lead mb-5 text-white-50">
						회원님의 아이디 정보입니다.<br>저희는 회원님의 정보를 소중히 저장하고 있습니다.
					</p>
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<%
		request.setCharacterEncoding("euc-kr");

		String myid = (String) session.getAttribute("nowid");

		memberDAO dao = memberDAO.getInstance();
		String[] mytotal = dao.getmyinfo(myid); //내정보 total에 저장됨

		session.setAttribute("btnclick", 0);
	%>
	<div class="container">

		<div class="row">
			<div class="col-md-8 mb-5">
				<h2></h2>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><p>
							이름&emsp; &emsp;&emsp;&emsp;&emsp;&emsp;
							<%
								out.println(mytotal[0]);
							%>
						</p></li>
					<li class="list-group-item"><p>
							ID&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%
								out.println(mytotal[1]);
							%>
						</p></li>
					<li class="list-group-item"><p>
							비밀번호&emsp;&emsp;&emsp;&emsp;
							<%
								out.println(mytotal[2]);
							%>
						</p></li>
					<li class="list-group-item"><p>
							카카오톡 아이디&emsp;
							<%
								out.println(mytotal[8]);
							%>
						</p></li>
					<li class="list-group-item"><p>
							성별&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%
								out.println(mytotal[3]);
							%>
						</p></li>
					<li class="list-group-item"><p>
							나이&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%
								out.println(mytotal[4]);
							%>
						</p></li>
					<li class="list-group-item"><p>
							지역&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%
								out.println(mytotal[5]);
							%>
						</p></li>
					<li class="list-group-item"><p>
							MBTI&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%
								out.println(mytotal[6]);
							%>
						</p></li>
					<li class="list-group-item"><p>
							한줄소개&emsp;&emsp;&emsp;&emsp;
							<%
								out.println(mytotal[7]);
							%>
						</p></li>
				</ul>

			</div>
		</div>

		<button type="submit" class="btn btn-danger" onclick="logout()">로그아웃
			&raquo;</button>
		<br>
		<br>

		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; MBTIng 대표
				김기현</p>
		</div>
		<!-- /.container -->
	</footer>

	<script>
		function logout() {
	
		alert("로그아웃 되었습니다.");
			location.href = "signin.jsp";
		}
	</script>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>