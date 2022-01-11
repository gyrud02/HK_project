<%@page import="Merchandise.MerchandiseBean"%>
<%@page import="Merchandise.MerchandiseDAO"%>
<%@page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 상의/아우터</title>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/shop-homepage.css" rel="stylesheet">
<%
	MerchandiseDAO mdDAO = new MerchandiseDAO();
	MerchandiseBean mdBean = new MerchandiseBean();
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
        <div class="row">
<%
	List<MerchandiseBean> outerList = mdDAO.getOuterList();
%>        
        <c:forEach var="list" items="<%=outerList%>">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="outer/${list.md_filename}"><img class="card-img-top" src="../img/outer/${list.md_filename}" alt="상의/아우터"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="WebContent/Menu/outer/${list.md_image}">${list.md_name}</a>
                </h4>
                <h5>￦ ${list.md_price}</h5>
                <p class="card-text">${list.md_description}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9733;</small>
              </div>
            </div>
          </div>
        </c:forEach>

        </div> <!-- row -->
      </div>
    </div>
</div>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>