<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
<%
request.getSession().setAttribute("ID", null);
request.getSession().setAttribute("PassWord", null);
request.getSession().setAttribute("Type", -1);
response.sendRedirect("index.jsp");
%>
</body>
</html>