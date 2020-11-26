<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import="movie.data"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

</head>


<body>
	<%
	String title = request.getParameter("title");
	String type = request.getParameter("type");
	String runtime = request.getParameter("runtime");
	String start_movie = request.getParameter("start_movie");
	String end_movie = request.getParameter("end_movie");
	String isadult = request.getParameter("isadult");
	
	data ck = new data(title,type,runtime,start_movie,end_movie,isadult);
	String tconst = ck.titleback();
	System.out.println(tconst);
	if(tconst=="0"){
		%>
		<script>
			alert("unvalid movie");
			history.go(-1);
		</script>
		<%
	}
	else{
			ck.update();
	}
	response.sendRedirect("index.jsp");
	%>

</body>

</html>