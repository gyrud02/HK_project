<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 회사소개</title>
</head>
<body>
<jsp:include page="../Layout/header.jsp"/>
<!-- 왼쪽 메뉴 -->
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4"><a href="../index.jsp">HKmall</a></h1>
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
          <a href="../Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
          <a href="../Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
          <a href="../Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
          <a href="../Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
          <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
	      <a href="../member/logout.jsp" class="list-group-item" id="delete">로그아웃</a>
<% 
	} // if문 끝
%>        
        </div> <!-- 왼쪽 메뉴 -->
	  </div>
<section>
<br>
<h2>Welcome</h2>
<div style="width:700px; margin-left:1em; align:right;">
	<table>
		<tr>
			<td colspan="2" width="190"><img src="../img/CEO2.jpg" width="190" height="240" alt="CEO">
			<strong>&nbsp;&nbsp;HKmall CEO Kelly Kim.</strong></td>
			<td colspan="2" width="510">&nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus 
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus 
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus 
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus 
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus 
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus
			 &nbsp;&nbsp;Lorem ipsum ipsum dolor...tellus Lorem ipsum ipsum dolor...tellus</td> 
		</tr>
	</table>
</div>
	<div class="container" style="float:2em; padding:0.9em;">
		<hr>
		<h2>Location</h2>
		<div id="map" style="width:650px;height:400px;">
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55194aa4c6155a17ae45a0f20ab60d67"></script>
			<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(35.1585012, 129.0620323),
						level: 1
					};
			
					var map = new kakao.maps.Map(container, options);
			</script>
		</div>
		<br>
		<ul>
		 	<li>주소 : 부산광역시 부산진구 동천로 109 (삼한골든게이트 7층)</li>
		 	<li>문의전화 : 051-123-3334 </li>
			<li>메일 : admin@HKmall.com</li>
			<li>팩스 : 051-123-3333 </li>
		</ul>
</div>
</section>  
</div>
</div>
<jsp:include page="../Layout/footer.jsp"></jsp:include>
</body>
</html>