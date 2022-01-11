<%@ page import="Merchandise.MerchandiseBean" %>
<%@ page import="Merchandise.MerchandiseDAO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 상의/아우터</title>
<%
	MerchandiseBean mdBean = new MerchandiseBean();
	MerchandiseDAO mdDAO = new MerchandiseDAO();
%>
</head>
<body>
<jsp:include page="../Layout/header.jsp"/>

 <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4"><a href="../index.jsp">HKmall</a></h1>
        <div class="list-group">
<%
	String id = (String) session.getAttribute("id");

	if(id == null){
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


    <div class="col-lg-9">
	  <div class="row">
<%
//		String md_image = (String)request.getParameter(md_image);
//		List<MerchandiseBean> oneitem = mdDAO.getOneList(md_image);
%>	  
        <div class="card mt-4">
          <img class="card-img-top img-fluid" src="../img/outer/${oneitem.md_image}" alt="상의/아우터">
          <div class="card-body">
            <h3 class="card-title">Product Name${oneitem.md_name}</h3>
            <h4>￦ ${oneitem.md_price}</h4>
            <p class="card-text">${oneitem.md_description}</p>
            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
            4.0 stars
          </div>
        </div>
        <!-- /.card -->

        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Product Reviews
          </div>
          <div class="card-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <a href="#" class="btn btn-success">Leave a Review</a>
          </div>
        </div>
        <!-- /.card -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
	
	</div>
  </div>
  
<jsp:include page="../Layout/footer.jsp"/>  
</body>
</html>