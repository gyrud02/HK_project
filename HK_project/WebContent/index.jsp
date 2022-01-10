<%@page import="JoinMember.MemberDAO"%>
<%@page import="JoinMember.MemberBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8" session="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>HKmall - 쇼핑의 시작 HK몰 </title>
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/shop-homepage.css" rel="stylesheet">
</head>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<body>
  <!-- 헤더 들어가는 곳 -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">HKmall</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">홈페이지
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="business/About.jsp">회사소개</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="business/Service.jsp">고객센터</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="sales/cart.jsp">장바구니</a>
          </li>
<%
	// session 영역에 접근하여 세션값이 저장되어 있는지 판단한다.
	String loginid = (String) session.getAttribute("id");
	
	if(loginid != null){
%>   		
          <li class="nav-item">
            <a class="nav-link" href="member/update.jsp">마이페이지</a>
          </li>
<%

	}else if(loginid == null){ // session 영역에 세선아이디 값이 저장되어 있지 않다면 로그인이 되지 않는 화면을 나타낸다
%>		
          <li class="nav-item">
            <a class="nav-link" href="member/login.jsp">마이페이지</a>
          </li>
        </ul>
<%
	}
%> 
	 </div>
  </nav>

  <!-- 왼쪽 메뉴 -->
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4"><a href="index.jsp">HKmall</a></h1>
        <div class="list-group">
<%
	if(loginid == null){
%>	
          <a href="Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
          <a href="Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
          <a href="Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
          <a href="Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
          <a href="gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
<%	      
	}else{
%>		
          <a href="Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
          <a href="Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
          <a href="Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
          <a href="Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
          <a href="gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
	      <a href="member/logout.jsp" class="list-group-item" id="delete">로그아웃</a>
<% 
	} // if문 끝
%>        
        </div> <!-- 왼쪽 메뉴 -->
        
      </div>
      <!-- 본문 /.col-lg-3 -->
      <div class="col-lg-9">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="img/main1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="img/main2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="img/main3.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>


      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">All contents Copyright &copy; 2020 HKmall Inc. all rights reserved<br>
		Contact mail : <a href="#" id="CEOemail">admin@HKmall.com</a> / Tel : <a href="#">051-123-3334</a>
		/ Fax : <a href="#">051-123-3333</a>
      </p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
<script type="text/javascript">
	
	$("#CEOemail").on("click", function(){
		
		window.open("member/sendMail.jsp", "건의사항", "width=600, height=700");
		
	});

</script>
</html>