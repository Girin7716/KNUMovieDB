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
	String id = (String)request.getSession().getAttribute("ID");
	String password = request.getParameter("password");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String sex = request.getParameter("sex");
	String bdate = request.getParameter("bdate");
	String job = request.getParameter("job");
	int updat = 0;
	String sql;
	
	System.out.println(password);
	System.out.println(fname);
	System.out.println(lname);
	System.out.println(phone);
	System.out.println(address);
	System.out.println(sex);
	System.out.println(bdate);
	System.out.println(job);

	memberDAO dao = new memberDAO(id, password,fname,lname,phone,address,sex,bdate,job);
	
	int check = dao.update();
	
	if(check == 1){//성공
		System.out.println("update success!");
		response.sendRedirect("index.jsp");
	} else if (check == 0) { // 실패
		System.out.println("update fail!");
		%>
		<script>
			alert("update error!");
			history.back();
		</script>
		<%
	}
	%>

</body>

</html>