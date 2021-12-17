<%@page import="FileBoard.FileBean"%>
<%@page import="FileBoard.FileDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/shop-homepage.css" rel="stylesheet">
</head>
<%
	FileDAO fileDAO = new FileDAO();

	// DB에 저장되어 있는 전체 글의 갯수를 조회하기 위해 BoardDAO의 getBoardCount()메소드를 호출한다.
	int count = fileDAO.getBoardCount();
	
	System.out.println(count);
	
	// 하나의 페이지마다 보여줄 글의 갯수는 10개
	int pageSize = 10;
	
	// 아래쪽의 클릭한 페이지 번호 얻기
	String pageNum = request.getParameter("pageNum");
	
	// 아래 쪽에 클릭한 페이지번호가 존재하지 않으면(현재 선택한 페이지 번호가 없다면)
	// 1페이지가 화면에 보여야 하기 때문에 pageNum을 1로 저장한다.
	if(pageNum == null){
		pageNum = "1";
	} // if문 끝
	
	// 현재 보여질(선택한) 페이지번호 "1"을 -> 기본 정수 1로 변경한다.
	int currentPage = Integer.parseInt(pageNum);
	
	// * 각 페이지마다 첫번째로 보여질 시작 글번호 구하기
	// (현재 보여질 페이지번호 - 1) * 한 페이지당 보여줄 글 갯수 10
	int startRow = (currentPage - 1) * pageSize;
	
	// QnABoard테이블에 존재하는 모든 글을 조회하여 저장할 용도의 ArrayList배열 객체를 담을 변수를 선언한다.
	List<FileBean> list = null;
	
	if(count > 0){ // 만약 QnABoard테이블에 존재하는 글이 있다면
		list = fileDAO.getBoardList(startRow, pageSize); // QnABoard테이블에 존재하는 글을 가져온다.
		System.out.println(list.size());
	} // if문 끝
%>
<body>
<jsp:include page="../Layout/header.jsp"/>
<!-- 왼쪽 메뉴 -->
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4"><a href="../index.jsp">HKmall</a></h1>
        <div class="list-group">
<%
	String loginid = (String) session.getAttribute("id");

	if(loginid == null){
%>	
          <a href="outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
          <a href="pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
          <a href="board.jsp" class="list-group-item" id="QnA">문의게시판</a>
          <a href="fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
          <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
<%
	}else if(loginid != null){
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
<article>
	<form class="container" style="float:1em; padding:1em;">
	<h2>File Board</h2>
        <table align="center" border="1px solid blue;">
        <thead align="center">
        <tr height="80">
	        <td width = "50" align="center"><strong>번호<strong></td>
	        <td width = "430" align = "center"><strong>제목<strong></td>
	        <td width = "150" align = "center"><strong>작성자<strong></td>
	        <td width = "80" align = "center"><strong>날짜<strong></td>
	        <td width = "70" align = "center"><strong>조회수<strong></td>
        </tr>
<%
	if(count > 0){ // 만약 게시판 글 갯수가 조회된다면
		for(int i=0; i<list.size(); i++){
			// ArrayList의 각 인덱스 위치에 저장되어있는 BoardBean객체를 ArrayList배열로 담아서
			// BoardBean객체의 각 변수값들을 getter메소드를 통해 얻어온다.
			FileBean fileBean = list.get(i);
%>		
		<tr height="35" onclick="location.href='../fileboard/content.jsp?num=<%=fileBean.getNum()%>&pageNum=<%=pageNum%>'">
	        <td width = "50" align="center"><%=fileBean.getNum()%></td>
			<td width = "360" align = "center"><%=fileBean.getSubject()%></td>
	        <td width = "150" align = "center"><%=fileBean.getName()%></td>
	        <td width = "160" align = "center"><%=new SimpleDateFormat("yyyy.MM.dd").format(fileBean.getWritedate())%></td>
	        <td width = "70" align = "center"><%=fileBean.getReadcount()%></td>
        </tr>	
<%
		} // for문 끝
		
	}else{ // 게시판에 글이 저장되어 있지 않다면
%>	
		<tr>
			<td width="50" height="300" align="center" colspan="5"><small>게시판 글 없음</small></td>
		</tr>
<%
	} // 바깥 if문 끝
%>
		</table>
<%
	if(loginid != null){
%>
		<br><input type="button" onclick="writebtn()" id="writebtn" value="글쓰기" class="btn btn-primary">
	</form>
<%
	} // if문 끝
%>	
	<center>
		<br><div id="page_control">
<%
	if(count > 0){ // DB에 글이 저장되어 있다면
		
		// int pageCounet = count / pageSize + (count % pageSize == 0? 0:1);
		int pageCounet = count / pageSize + (count % pageSize == 0? 0:1);
		
		// 하나의 화면에 보여줄 페이지 수 설정
		int pageBlock = 10;
		
		// 시작 페이지 번호 구하기
		// ( (현재 선택한 페이지번호 / 한 블럭에 보여줄 페이지 수 ) - (현재 선택한 페이지 번호를 하나의 블록에 보여줄 페이지로 나눈 나머지 값) ) * 한 블럭에 보여줄 페이지 수  + 1
		int startPage = ((currentPage / pageBlock ) - (currentPage % pageBlock == 0? 1:0)) * pageBlock + 1;
		
		// 끝 페이지 번호 구하기
		int endPage = startPage + pageBlock - 1;
		
		// 끝 페이지번호가 전체 페이지 수보다 클 때
		if(endPage > pageCounet){
			
			// 끝 페이지 번호를 전체 페이지수로 저장한다.
			endPage = pageCounet;
		} // if문 끝
		
		// ◀이전▶ 시작페이지 번호가 하나의 블록에 보여줄 페이지의 수보다 클 때
		if(startPage > pageBlock){
%>			
			<a href="fileboard.jsp?pageNum<%=startPage-pageBlock%>">◀이전▶</a>
<%
		} // if문 끝
		
		// [1] [2] [3] ... [10] 페이지 번호 링크
		for(int i=startPage; i <= endPage; i++){
%>			
			<a href="fileboard.jsp?pageNum=<%=i%>"><%=i%></a>		
<%			
		} // for문 끝
		
		// ◀다음▶ 끝 페이지 번호가 전체 페이지 수보다 작을때
		if(endPage > pageCounet){
%>
			<a href="fileboard.jsp?pageNum=<%=startPage+pageBlock%>">◀다음▶</a>			
<%			
		} // if문 끝
		
	} // 바깥 if문 끝
%>			
		</div>
	</center>
</article>
<script type="text/javascript">
	$(function writebtn(){
		$("#writebtn").on("click", function(){
			location.href="../fileboard/write.jsp";
		}); // onclick() 끝
	}); // write() 끝
</script>	
	</div>
  </div>
</div>
<br>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>