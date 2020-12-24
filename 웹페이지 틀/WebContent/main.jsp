<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="dao.memberDAO"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MBTing</title>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<style>
p {
	font-family: "Nanum Gothic", sans-serif;
	font-size: 20px;
}
</style>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/business-frontpage.css" rel="stylesheet">

</head>

<body>

	<%
		request.setCharacterEncoding("euc-kr");

		String myid = (String) session.getAttribute("nowid");
		System.out.println(myid);
		session.setAttribute("btnclick", 0);

		memberDAO dao = memberDAO.getInstance();
		String[] mytotal = dao.getmyinfo(myid); //내정보 total에 저장됨
	%>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">MBTIng</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="">홈으로
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" id="매칭"
						href="./matchDisplay.jsp">매칭</a></li>
					<li class="nav-item"><a class="nav-link" id="게시판"
						href="./bulletboard.jsp">게시판</a></li>
					<li class="nav-item"><a class="nav-link" id="내정보"
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
					<h1 class="display-4 text-white mt-5 mb-2">MBTIng에 오신걸 환영합니다!</h1>
					<p class="lead mb-5 text-white-50">
						저희 MBTIng는 성격유형검사인 MBTI를 기반으로 최적의 인연을 만날 수 있도록 도와드리는 매칭서비스 입니다! <br>
						지금 바로 이용해보세요!
					</p>
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-md-8 mb-5">
				<h2>MBTI에 관한 이야기</h2>
				<hr>
				<p>
					당신의 MBTI는 <strong>
						<%
							out.println(mytotal[6]);
						%>
					</strong>입니다!
				</p>
				<p>다른 MBTI에 대해 궁금하신가요? 아래 버튼을 통해 알아보세요!</p>
				<a class="btn btn-danger btn-lg" target="_blank"
					href="https://www.16personalities.com/ko/%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95">보러가기
					&raquo;</a>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<img class="card-img-top"
						src="https://mblogthumb-phinf.pstatic.net/MjAyMDAzMTVfMjcy/MDAxNTg0MjYyODIzMzM5.k6aURUH46G_Zuu9Xz66v9QJxT2vX5RLci9aHyLBhBTwg.EPRbV_ScrWUpda77c8mWqzSxZN_dmeZ_8sPe1gQ8he4g.PNG.muliker/%EC%9C%A0%ED%98%95%EB%B3%84%EA%B6%81%ED%95%A9.PNG?type=w800"
						alt="">
					<div class="card-body">
						<h4 class="card-title">MBTI 궁합표</h4>
						<p class="card-text">MBTI의 16가지 성격 유형의 궁합 정도를 재미있게 표현한 이미지입니다.</p>
					</div>
					<div class="card-footer">
						<a
							href="https://mblogthumb-phinf.pstatic.net/MjAyMDAzMTVfMjcy/MDAxNTg0MjYyODIzMzM5.k6aURUH46G_Zuu9Xz66v9QJxT2vX5RLci9aHyLBhBTwg.EPRbV_ScrWUpda77c8mWqzSxZN_dmeZ_8sPe1gQ8he4g.PNG.muliker/%EC%9C%A0%ED%98%95%EB%B3%84%EA%B6%81%ED%95%A9.PNG?type=w800"
							target="_blank" class="btn btn-danger">크게보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<img class="card-img-top"
						src="http://cdn.bizwatch.co.kr/news/photo/2020/05/08/9669ac75758163256fa80b182baf869c.png"
						alt="">
					<div class="card-body">
						<h4 class="card-title">MBTI 유형 소개</h4>
						<p class="card-text">MBTI의 네가지 척도별 특성을 나타낸 이미지입니다.</p>
					</div>
					<div class="card-footer">
						<a
							href="http://cdn.bizwatch.co.kr/news/photo/2020/05/08/9669ac75758163256fa80b182baf869c.png"
							target="_blank" class="btn btn-danger">크게보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<img class="card-img-top"
						src="https://fimg5.pann.com/new/download.jsp?FileID=53366422"
						alt="">
					<div class="card-body">
						<h4 class="card-title">MBTI 유형별 안어울리는 직업</h4>
						<p class="card-text">MBTI 유형 별 어울리지 않는 직업을 나타낸 이미지입니다.</p>
					</div>
					<div class="card-footer">
						<a href="https://fimg5.pann.com/new/download.jsp?FileID=53366422" target="_blank"
							class="btn btn-danger">크게보기</a>
					</div>
				</div>
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