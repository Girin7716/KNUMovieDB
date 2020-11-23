<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.memberDAO"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MBTing 게시판</title>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
p {
	font-family: "Nanum Gothic", sans-serif;
	font-size: 20px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 70%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 20%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/business-frontpage.css" rel="stylesheet">

<script>
      function drawtable() {
         var innerhtml = null;
         
         <%memberDAO dao = memberDAO.getInstance();
			Integer rscnt = dao.getcnt();
			String[] namearr = dao.getnames();
			String[] titlearr = dao.gettitles();
			String[] datearr = dao.getdates();%>
          
          var rscnt ="<%=rscnt%>"; 
          var tmpArrp1 = new Array();
          <%for (int i = 0; i < rscnt; i++) {%>
          tmpArrp1[<%=i%>]='<%=namearr[i]%>';
          <%}%>

          var tmpArrp2 = new Array();
          <%for (int i = 0; i < rscnt; i++) {%>
          tmpArrp2[<%=i%>]='<%=titlearr[i]%>';
          <%}%>

          var tmpArrp3 = new Array();
          <%for (int i = 0; i < rscnt; i++) {%>
          tmpArrp3[<%=i%>]='<%=datearr[i]%>';
          <%}%>
          
          
          for (var i = 0; i < rscnt; i++) {
             if (i != 0) 
                innerhtml = innerhtml + "<tr onclick='show(this);'> <th scope='row'>" + (i+1) + "</th> <td> " + tmpArrp1[i] + "</td> <td> " + tmpArrp2[i] + "</td> <td> " + tmpArrp3[i] + "</td> </tr>";
             else
                innerhtml = "<tr onclick='show(this);'> <th scope='row'>" + (i+1) + "</th> <td> " + tmpArrp1[i] + "</td> <td> " + tmpArrp2[i] + "</td> <td> " + tmpArrp3[i] + "</td> </tr>";
                
          }
          
          document.getElementById('tablebody').innerHTML = innerhtml; 
      }
   

      function show(e) {
         <%String[] writingarr = dao.getwritings();%>
         var rscnt ="<%=rscnt%>"; 
          var tmpArrp4 = new Array();
          <%for (int i = 0; i < rscnt; i++) {%>
          tmpArrp4[<%=i%>]='<%=writingarr[i]%>';
<%}%>
	var ths = e.getElementsByTagName('th');
		var tds = e.getElementsByTagName('td');

		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		document.getElementById('modaltext').innerHTML = tmpArrp4[ths[0].innerHTML - 1];
		modal.style.display = "block";

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

	}
</script>

</head>

<body onload="drawtable();">

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
					<li class="nav-item "><a class="nav-link" href="./main.jsp">홈으로
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" id="매칭"
						href="./matchDisplay.jsp">매칭</a></li>
					<li class="nav-item active"><a class="nav-link" id="게시판" href="">게시판</a>
					</li>
					<li class="nav-item"><a class="nav-link" id="내정보"
						href="./myinfo.jsp">내정보</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header class="bg-danger py-5 mb-5" style="opacity: 0.6">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2">게시판</h1>
					<p class="lead mb-5 text-white-50">
						여러분의 관심사를 알려주세요.<br>무엇이든지 좋습니다.
					</p>
				</div>
			</div>
		</div>
	</header>
	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-md-8 mb-5">
				<h2>게시판</h2>
				<hr>
			</div>
		</div>
		<!-- /.row -->
		<div id="myModal" class="modal">
			<div class="modal-content" style="margin-left: 15%; width: 70%;">
				<span class="close" style="margin-bottom: 20px;">&times;</span>
				<p id="modaltext">Some text in the Modal..</p>
			</div>
		</div>

		<table class="table" id="boardtable">
			<thead class="thead-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody id="tablebody">
				<!--    <tr>
         <th scope="row">1</th>
         <td></td>
         <td></td>
         <td></td>
       </tr>
       <tr>
         <th scope="row">2</th>
         <td></td>
         <td></td>
         <td></td>
       </tr>
       <tr>
         <th scope="row">3</th>
         <td></td>
         <td></td>
         <td></td>
       </tr>
-->
			</tbody>
		</table>
		<br>

		<button type="button" class="btn btn-danger"
			onclick="location.href='write.jsp'">글쓰기&raquo;</button>
		<br> <br>
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

