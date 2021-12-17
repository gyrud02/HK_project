<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 상의/아우터</title>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/shop-homepage.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../Layout/header.jsp"/>

<article>
 <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4"><a href="../index.jsp">HKmall</a></h1>
        <div class="list-group">
<%
	String id = (String) session.getAttribute("id");

	if(id == null){
%>	
          <a href="outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
          <a href="pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
          <a href="board.jsp" class="list-group-item" id="QnA">문의게시판</a>
          <a href="fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
          <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
<%	
	}else{
%>		
          <a href="outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
          <a href="pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
          <a href="board.jsp" class="list-group-item" id="QnA">문의게시판</a>
          <a href="fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
          <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
	      <a href="../member/logout.jsp" class="list-group-item" id="delete">로그아웃</a>
<% 
	} // if문 끝
%> 
        </div> <!-- 왼쪽 메뉴 -->
	  </div>
	
	 <div class="col-lg-9">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="../img/main1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main3.jpg" alt="Third slide">
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
        
        <div class="row">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="outer/outer1.jsp"><img class="card-img-top" src="../img/outer/outer1-1.jpg" alt="outer1"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="WebContent/Menu/outer/outer1.jsp">Item One</a>
                </h4>
                <h5>￦ 24,000</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9733;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="outer/outer2.jsp"><img class="card-img-top" src="../img/outer/outer2.jpg" alt="outer2"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="outer/outer2.jsp">Item Two</a>
                </h4>
                <h5>￦ 189,000</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="outer/outer3.jsp"><img class="card-img-top" src="../img/outer/outer3.jpg" alt="outer3"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="outer/outer3.jsp">Item Three</a>
                </h4>
                <h5>￦ 19,900</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="outer/outer4.jsp"><img class="card-img-top" src="../img/outer/outer4-1.jpg" alt="outer4"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="outer/outer4.jsp">Item Four</a>
                </h4>
                <h5>￦ 21,000</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="outer/outer5.jsp"><img class="card-img-top" src="../img/outer/outer5-6.jpg" alt="outer5"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="outer/outer5.jsp">Item Five</a>
                </h4>
                <h5>￦ 15,000</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="../img/outer/outer6-4.jpg" alt="outer6"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Six</a>
                </h4>
                <h5>￦ 39,900</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>  <!-- card-footer -->
            </div> <!-- card h-100 -->
          </div> <!-- col-lg-4 col-md-6 mb-4 -->
        </div> <!-- row -->
      </div>
    </div>
</div>
</article>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>