<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 자료실:글쓰기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/shop-homepage.css" rel="stylesheet">
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
	String loginid = (String)session.getAttribute("id");

	if(loginid == null){
%>	
          <a href="../Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
          <a href="../Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
          <a href="../Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
          <a href="../Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
          <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
<%
	}else if(loginid != null){
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
      </div> <!-- .row --> 
<!-- 본문 /.col-lg-9 -->
      <div class="col-lg-9">
<article>
<%
	if(loginid == null){
%>		
 		<script type="text/javascript">
			alert("로그인을 하셔야 이용 가능합니다.");
			location.href="../member/login.jsp";
		</script>
<% 		
	}else if(loginid != null){
%>
		<form class="container" name="write" method="post" action="writePro.jsp" enctype="multipart/form-data" style="padding:1em;">
		<h2>File Board</h2>
        <table align=left width=700 cellpadding=2>
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white> 글쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                        <tr height="50">
                        	<td>&nbsp;<b>작성자 :</b>&nbsp;&nbsp;</td>
                        	<td><input type="text" name="name" size="7" value="<%=loginid %>" readonly="readonly"> </td>
                        </tr>
                        <tr height="40">
                        	<td>&nbsp;&nbsp;&nbsp;<b>제목 :</b>&nbsp;&nbsp;</td>
                        	<td><input type="text" name="subject" size="82"></td>
                        </tr>
                        <tr height="40">
                        	<td colspan="3"><input type="file" id="fileUpload" name="fileUpload"/></td>	
                        </tr>
                        <tr height="40">
							<td colspan="3"><input type="submit" value="등록" class="btn btn-primary" name="writebtn"><input type="button" value="목록" class="btn btn-primary" onclick="location.href='../Menu/fileboard.jsp'"><input type="reset" class="btn btn-primary" value="다시작성"></td>
						</tr>
                </table>
                </td>
                </tr>
        </table>
		</form>
	</div> <!-- .row -->
</article>
	   </div> <!-- .col-lg-9 -->
	</div> <!-- .row -->
  </div> <!-- .container -->
<br>
<%
	}
%>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>