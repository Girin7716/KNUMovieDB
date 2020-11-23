<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="dao.memberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 확인</title>
	
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");

		String name = request.getParameter("Name");
		String id = request.getParameter("ID");
		String pw = request.getParameter("Password");
		String kakao = request.getParameter("Kakao");
		String sex = request.getParameter("Sex");
		String age = request.getParameter("Age");
		String area = request.getParameter("Area");
		String mbti = request.getParameter("MBTI");
		String intro = request.getParameter("Introduce");

		System.out.println(name);
		System.out.println(id);
		System.out.println(pw);
		System.out.println(kakao);
		System.out.println(sex);
		System.out.println(age);
		System.out.println(area);
		System.out.println(mbti);
		System.out.println(intro);

		memberDAO dao = memberDAO.getInstance();
		int check = dao.signupcheck(name, id, kakao);

		if (check == 1) { // 회원가입 성공
			System.out.println("signup success!");
			dao.signupinsert(name,id,pw,kakao,sex,age,area,mbti,intro);
			response.sendRedirect("signin.jsp");
		} else if (check == 2) { // id 중복 %>
			<script>
				alert("id 중복!");
				history.go(-1);
			</script>
			<%
			System.out.println("id 중복!");
			response.sendRedirect("signup.jsp");
		} else if (check == 3) { // kakao 이름 중복%>
			<script>
			alert("kakao 중복 중복!");
			history.go(-1);
		</script>
		<%
			System.out.println("kakao 중복");
			response.sendRedirect("signup.jsp");
		} else { // 나머지 회원가입 실패%>
			<script>
			alert("ERROR!");
			history.go(-1);
		</script>
		<%
			System.out.println("error!");
			response.sendRedirect("signup.jsp");
		}
	%>
</body>
</html>