<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>HKmall - 갤러리</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<body>
<jsp:include page="../Layout/header.jsp"/>	
		<div class="page-wrap">

<!-- 왼쪽 메뉴 -->
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4"><a href="../index.jsp">HKmall</a></h1>
        <div class="list-group">
<%
	String loginid = (String)session.getAttribute("id");

	if(loginid == null){
%>	
	          <a href="../Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
	          <a href="../Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
	          <a href="../Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
	          <a href="../Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
	          <a href="gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
<%
	}else{
%>		
	          <a href="../Menu/Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
	          <a href="../Menu/Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
	          <a href="../Menu/Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
	          <a href="../Menu/Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
	          <a href="gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
		      <a href="../member/logout.jsp" class="list-group-item" id="delete">로그아웃</a>
<% 
} // if문 끝
%>        
        </div> <!-- 왼쪽 메뉴 -->
      </div> <!-- .row --> 				
	<div class="col-lg-9">
<article>
	<section id="main"> <!-- Main -->

	<!-- Gallery -->
		<section id="galleries">

			<!-- Photo Galleries -->
				<div class="gallery">
						<div class="content">
							<div class="media all people">
								<a href="../img/outer/outer1.jpg"><img src="../img/outer/outer1.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all place">
								<a href="../img/outer/outer1-1.jpg"><img src="../img/outer/outer1-1.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer1-2.jpg"><img src="../img/outer/outer1-2.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all people">
								<a href="../img/outer/outer2.jpg"><img src="../img/outer/outer2.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all place">
								<a href="../img/outer/outer2-1.jpg"><img src="../img/outer/outer2-1.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all place">
								<a href="../img/outer/outer3.jpg"><img src="../img/outer/outer3.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all place">
								<a href="../img/outer/outer3-3.jpg"><img src="../img/outer/outer3-3.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer3-4.jpg"><img src="../img/outer/outer3-4.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer2-2.jpg"><img src="../img/outer/outer2-2.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all people">
								<a href="../img/outer/outer2-3.jpg"><img src="../img/outer/outer2-3.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer3-1.jpg"><img src="../img/outer/outer3-1.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all people">
								<a href="../img/outer/outer3-2.jpg"><img src="../img/outer/outer3-2.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer4.jpg"><img src="../img/outer/outer4.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer4-2.jpg"><img src="../img/outer/outer4-2.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer4-3.jpg"><img src="../img/outer/outer4-3.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer4-4.jpg"><img src="../img/outer/outer4-4.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer5-1.jpg"><img src="../img/outer/outer5-1.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer5-3.jpg"><img src="../img/outer/outer5-3.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer5-4.jpg"><img src="../img/outer/outer5-4.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer5-5.jpg"><img src="../img/outer/outer5-5.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer6.jpg"><img src="../img/outer/outer6.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer6-1.jpg"><img src="../img/outer/outer6-1.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer6-2.jpg"><img src="../img/outer/outer6-2.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer6-3.jpg"><img src="../img/outer/outer6-3.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer6-5.jpg"><img src="../img/outer/outer6-5.jpg" alt="" title="This right here is a caption." /></a>
							</div>
							<div class="media all thing">
								<a href="../img/outer/outer6-6.jpg"><img src="../img/outer/outer6-6.jpg" alt="" title="This right here is a caption." /></a>
							</div>
						</div>
					</div>
				</section>
			</section>
		</div>
</article>
			</div>
		</div>	
	</div>
<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery.poptrox.min.js"></script>
<script src="../assets/js/jquery.scrolly.min.js"></script>
<script src="../assets/js/skel.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>
</body>
<jsp:include page="../Layout/footer.jsp"/>
</html>