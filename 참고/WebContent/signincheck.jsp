<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="dao.memberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("inputid");
		String pw = request.getParameter("inputpassword");
		System.out.println(id + pw);

		memberDAO dao = memberDAO.getInstance();
		int check = dao.signincheck(id, pw);

		if (check == 1) { // 로그인 성공
			System.out.println("login success!");
			session.setAttribute("nowid",id);
			response.sendRedirect("main.jsp");//////////////index.html -> main.jsp로 바꿈
		} else if (check == 0) { // 비밀번호 틀림%>
			<script>
				alert("비밀번호 틀림");
				history.go(-1);
			</script>
		<%
			System.out.println("password error!");
			//response.sendRedirect("signin.jsp");
		} else { // 아이디 없음%>
			<script>
				alert("아이디 없음");
				history.go(-1);
			</script>
			<%
			System.out.println("no such id!");		
			response.sendRedirect("signin.jsp");
		}
	%>
</body>
</html>