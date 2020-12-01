<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import="dao.memberDAO"%>
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
		request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String sex = request.getParameter("sex");
	String bdate = request.getParameter("bdate");
	String job = request.getParameter("job");

	System.out.println(id);
	System.out.println(password);
	System.out.println(fname);
	System.out.println(lname);
	System.out.println(phone);
	System.out.println(address);
	System.out.println(sex);
	System.out.println(bdate);
	System.out.println(job);

	//memberDAO dao = memberDAO.getInstance();
	memberDAO dao = new memberDAO(id, password);

	int check = dao.signupcheck(id);
	if (check == 1) { // 회원가입 성공
		System.out.println("signup success!");
		dao.signupinsert(id, password, fname, lname, phone, address, sex, bdate, job);
		response.sendRedirect("index.jsp");
	} else if (check == 2) { // id 중복
	%>
	<script>
		alert("id 중복!");
		history.back();
	</script>
	<%
	} else { // 나머지 회원가입 실패
	%>
	<script>
		alert("ERROR!");
		history.go(-1);
	</script>
	<%
		System.out.println("error!");
	response.sendRedirect("signin.jsp");
	}
	%>

</body>

</html>