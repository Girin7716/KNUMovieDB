<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.memberDAO"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MBTing 게시판</title>

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
			<a class="navbar-brand" href="./main.jsp">MBTIng</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="./main.jsp">홈으로 <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" id="매칭"
						href="./matchDisplay.jsp">매칭</a></li>
					<li class="nav-item active"><a class="nav-link" id="게시판"
						href="./bulletboard.jsp">게시판</a></li>
					<li class="nav-item"><a class="nav-link" id="내정보"
						href="./myinfo.jsp">내정보</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
  <header class="bg-danger py-5 mb-5" style="opacity:0.6">
    <div class="container h-100">
      <div class="row h-100 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">게시판</h1>
          <p class="lead mb-5 text-white-50">여러분의 관심사를 알려주세요.<br>무엇이든지 좋습니다.</p>
        </div>
      </div>
    </div>
  </header>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-md-8 mb-5">
			
				<hr>
			</div>
		</div>
		<!-- /.row -->
		<div class="container">
			
				<form method="post" action="writeAction.jsp">
				<div class="row">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid gray">
				
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용"
										name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" class="btn btn-danger pull-right" value="글쓰기">
					</div>
				</form>

			
		</div>
		<br>
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

