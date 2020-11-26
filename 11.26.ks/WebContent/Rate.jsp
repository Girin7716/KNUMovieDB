<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   <%@ page language = "java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<%
request.setCharacterEncoding("UTF-8");
String Rate = request.getParameter("Rate");
String tconst = request.getParameter("tconst");
String ID = (String)request.getSession().getAttribute("ID");
String PassWord = (String)request.getSession().getAttribute("PassWord");
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "movie";
String pass = "movie";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
Connection conn = null;
PreparedStatement pstmt;
ResultSet rs;
String sql = null;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url,user,pass);
%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
sql = "INSERT INTO RATING VALUES ('"+ ID + "', '" + tconst + "', " + Rate + ")";
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();
response.sendRedirect("test.jsp?tconst=" + tconst);
%>
</body>
</html>