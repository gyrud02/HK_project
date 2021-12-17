<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 장바구니</title>
</head>
<body>
<jsp:include page="../Layout/header.jsp"/>
<!-- 왼쪽 메뉴 -->
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4"><a href="index.jsp">HKmall</a></h1>
        <div class="list-group">
<%
	//session 영역에 접근하여 세션값이 저장되어 있는지 판단한다.
	String loginid = (String) session.getAttribute("id");	

	if(loginid == null){
%>	
      <a href="../Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
      <a href="../Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
      <a href="../Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
      <a href="../Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
      <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
<%      
	}else{
%>		
      <a href="../Menu/Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
      <a href="../Menu/Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
      <a href="../Menu/Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
      <a href="../Menu/Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
      <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
      <a href="../member/logout.jsp" class="list-group-item" id="delete">로그아웃</a>
<% 
} // if문 끝
%>        
        </div> <!-- 왼쪽 메뉴 -->
      </div>
<article>
<div class="container" style="width:30em; height:5em; margin-left:5em;
							float:1em; margin-top:10em; text-align:center;">
<h1>서비스 준비중입니다.</h1>
</div>
</article>
</div>
</div>
<br>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>