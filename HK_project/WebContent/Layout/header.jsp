<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"
    pageEncoding="UTF-8"%>
<header>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/shop-homepage.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="../index.jsp">HKmall</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="../index.jsp">홈페이지
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../business/About.jsp">회사소개</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../business/Service.jsp">고객센터</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../sales/cart.jsp">장바구니</a>
          </li>
<%

	// session 영역에 접근하여 세션값이 저장되어 있는지 판단한다.
	String loginid = (String) session.getAttribute("id");

	// session영역에 세션아이디 값이 저장되어있다면 로그인했을 때의 화면으로 회원수정, 회원탈퇴 메뉴가 보이도록 한다.
	if(loginid != null){
%>   		
          <li class="nav-item">
            <a class="nav-link" href="../member/update.jsp">마이페이지</a>
          </li>
<%

	}else if(loginid == null){ // session 영역에 세선아이디 값이 저장되어 있지 않다면 로그인이 되지 않는 화면을 나타낸다
%>		
          <li class="nav-item">
            <a class="nav-link" href="../member/login.jsp">마이페이지</a>
          </li>
<%
	}
%>           
        </ul>
      </div>
    </div>
  </nav>
</header>