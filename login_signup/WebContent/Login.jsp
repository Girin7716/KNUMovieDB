<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login</title>
</head>
<body>
<form action = "Loginrequest.jsp" method = "POST">
<h3>Query 1: Search for employees satisfying the following conditions: </h3>
<%
out.print("ID: ");
out.println("<input type = \"text\" name = \"ID\">");
out.print("PassWord: ");
out.println("<input type = \"text\" name = \"PassWord\">");
out.println("<input type = \"submit\" value = \"Submit\">");
%>
</body>
</html>