<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import="Login.Login" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String ID = request.getParameter("ID");
String PassWord = request.getParameter("PassWord");
Login testing = new Login(ID,PassWord);
if(testing.getOk() == 1)
{
	request.getSession().setAttribute("ID", ID);
	request.getSession().setAttribute("PassWord", PassWord);
	response.sendRedirect("about.jsp");
}
else
{
%>
	<script>
	history.back();
	</script>
<%
}
%>

</body>
</html>