<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.memberDAO"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

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
						href="./matchDisplay.jsp">매칭</a> <span class="sr-only">(current)</span></li>
					<li class="nav-item"><a class="nav-link"
						href="./bulletboard.jsp">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="./myinfo.jsp">내정보</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="bg-danger py-5 mb-5" style="opacity: 0.6;">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2">MBTIng 매칭 페이지 입니다.</h1>
					<p class="lead mb-5 text-white-50">원하시는 상대의 정보를 선택해 주세요.</p>
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">
		<%
			request.setCharacterEncoding("euc-kr");
			int cnt = (Integer) session.getAttribute("btnclick");

			String myid = (String) session.getAttribute("nowid");
			System.out.println(myid);

			memberDAO dao = memberDAO.getInstance();
			String[] mytotal = dao.matching(myid, cnt);
			session.setAttribute("btnclick", cnt + 1);

			if (mytotal[0] == null)
				request.getRequestDispatcher("matchingfinish.jsp").forward(request, response);
		%>



		<div class="row">
			<div class="col-md-8 mb-5" style="width: 1500px;">
				<h2></h2>
				<hr>
				<form>
					<div class="form-group">
						<p class="lead mb-5 text-black-60">
							당신과 최고의 궁합은 <strong> <%
 	out.println(mytotal[3]);
 %>
							</strong>입니다!
						</p>
					</div>
					<div class="form-group">
						<table class="table">
							<thead>
								<tr>
									<th>이름</th>
									<th>나이</th>
									<th>지역</th>
									<th>한줄소개</th>
								</tr>
							</thead>
							<tbody>
								<tr class="active">
									<td>
										<%
											out.println(mytotal[0]);
										%>
									</td>
									<td>
										<%
											out.println(mytotal[1]);
										%>
									</td>
									<td>
										<%
											out.println(mytotal[2]);
										%>
									</td>
									<td>
										<%
											out.println(mytotal[4]);
										%>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<%
						dao.whoru(mytotal);
					%>
					<button type="button" class="btn btn-danger"
						onclick="location='result.jsp'">수락 &raquo;</button>
					
				</form>
				<button type="submit" class="btn btn-danger"
					onclick="window.location.reload()" id="refresh">다른 상대
					&raquo;</button>
			</div>

		</div>
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

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>