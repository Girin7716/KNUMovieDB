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
		System.out.println("ȸ�� Ż��");
		int updat = 0;
		String ID = (String) request.getSession().getAttribute("ID");
		out.println("ID : " + ID);
		String PassWord = (String) request.getSession().getAttribute("PassWord");
		out.println("PassWord : " + PassWord);
	
		memberDAO dao = memberDAO.getInstance();
		//int check = dao.signupcheck(id);
		int check = dao.delete(ID);
		
		if(check==0){//����
			%>
			<script>
				alert("ȸ��Ż�� �����߽��ϴ�.");
				history.back();
			</script>
			<%
		}
		else if(check==1){//����
			request.getSession().setAttribute("ID", null);
			request.getSession().setAttribute("PassWord", null);
			response.sendRedirect("index.jsp");
		}

	%>

</body>

</html>