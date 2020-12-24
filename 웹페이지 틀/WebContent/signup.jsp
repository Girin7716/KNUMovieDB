<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import= "dao.memberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>회원가입</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/business-frontpage.css" rel="stylesheet">
</head>
<body>

   <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
         <a class="navbar-brand" href="">MBTIng</a>
      </div>
   </nav>

   <!-- Header -->
   <header class="bg-danger py-5 mb-5" style="opacity: 0.6">
      <div class="container h-100">
         <div class="row h-100 align-items-center">
            <div class="col-lg-12">
               <h1 class="display-4 text-white mt-5 mb-2">회원가입</h1>
               <p class="lead mb-5 text-white-50">서비스를 이용하기 위한 회원가입 입니다.<br>
               정확한 매칭 서비스를 제공할 수 있도록 정확하게 입력하여 주세요.</p>               
            </div>
         </div>
      </div>
   </header>

   <!-- Page Content -->
   <div class="container">

      <div class="row">
         <div class="col-md-8 mb-5">
            <h1>Sign Up</h1>
            <hr>
            <form method="post" action="signupcheck.jsp">
               <!-- 이름 -->
               <div class="form-group">
                  Name
                  <input type="text" class="form-control" name="Name" placeholder="김기현">
               </div>
               <!-- id -->
               <div class="form-group">
                  ID
                  <input type="text" class="form-control" name="ID" placeholder="nun2580">
               </div>
               <!-- 비밀번호 -->
               <div class="form-group">
                  Password
                  <input type="password" class="form-control" name="Password">
               </div>
               <!-- 카카오톡 연락처 -->
               <div class="form-group">
                  KaKaTalk Contact
                  <input type="text" class="form-control" name="Kakao">
               </div>
               
               <!-- 성별 -->
               <div class="form-group">
                  Sex <p> 
                  <input type="radio"value="남성" name="Sex" checked>
                  <label for="exampleInputMan">남성</label>
                  <input type="radio"value="여성" name="Sex">         
                  <label for="exampleInputWoman">여성</label>
               </div>
               <!-- 나이 -->
               <div class="form-group">
                  Age
                  <input type="number" class="form-control" name="Age" min="20" max="50">
               </div>
               <!-- 지역 -->
               <div class="form-group">
                  Area 
                  <select name="Area" class="form-control">
                     <option value="Seoul">서울</option>
                     <option value="Busan">부산</option>
                     <option value="Daegu" selected="selected">대구</option>
                     <option value="Daejeon">대전</option>
                     <option value="Incheon">인천</option>
                     <option value="Ulsan">울산</option>
                     <option value="Gwangju">광주</option>
                     <option value="Sekpmg">세종</option>
                     <option value="Jeju">제주</option>
                     <option value="Gyeonggi">경기도</option>
                     <option value="Gangwon">강원도</option>
                     <option value="Chungcheongbukdo">충청북도</option>
                     <option value="Chungcheongnamdo">충청남도</option>
                     <option value="Gyeongsangbukdo">경상북도</option>
                     <option value="Gyeongsangnamdo">경상남도</option>
                     <option value="Jeollabukdo">전라북도</option>
                     <option value="Jeollanamdo">전라남도</option>
                  </select>
               </div>
               
               <!-- MBTI -->
               <div class="form-group">
                  What is your MBTI? 
                  
                  <select name="MBTI" class="form-control">
                     <option value="ISTJ">ISTJ</option>
                     <option value="ISFJ">ISFJ</option>
                     <option value="INFJ">INFJ</option>
                     <option value="INTJ">INTJ</option>
                     <option value="ISTP">ISTP</option>
                     <option value="ISFP">ISFP</option>
                     <option value="INFP" selected="selected">INFP</option>
                     <option value="INTP">INTP</option>
                     <option value="ESTP">ESTP</option>
                     <option value="ESFP">ESFP</option>
                     <option value="ENFP">ENFP</option>
                     <option value="ENTP">ENTP</option>
                     <option value="ESTJ">ESTJ</option>
                     <option value="ESFJ">ESFJ</option>
                     <option value="ENFJ">ENFJ</option>
                     <option value="ENTJ">ENTJ</option>
                  </select>
                  
                  <!-- MBTI 사이트 연결 -->
                  <a href="https://www.16personalities.com/ko/" target="_blank">MBTI 검사하러 가기</a>
               
               </div>
               <!-- 한 줄 자기소개 -->
               <div class="form-group">
                  Self introduction
                  <input type="text" class="form-control" name="Introduce" placeholder="대학생입니다~" style="width:730px;height:100px;">
               </div>
               <button onclick="location='signin.jsp'" type="submit" class="btn btn-danger">회원가입</button>
            </form>
         </div>

      </div>
      <!-- /.row -->


      <!-- /.row -->

   </div>
   <!-- /.container -->

   <!-- Footer -->
   <footer class="py-5 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy;
            MBTIng 대표 김기현</p>
      </div>
      <!-- /.container -->
   </footer>

   <!-- Bootstrap core JavaScript -->
   <script src="vendor/jquery/jquery.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>