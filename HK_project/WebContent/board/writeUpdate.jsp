<%@page import="QnABoard.BoardBean"%>
<%@page import="QnABoard.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 문의게시판:글수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
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
<%      
	}else{
%>		
      <a href="../Menu/Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
      <a href="../Menu/Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
      <a href="../Menu/Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
      <a href="../Menu/Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
      <a href="../member/logout.jsp" class="list-group-item" id="delete">로그아웃</a>
<% 
} // if문 끝
%>          </div> <!-- 왼쪽 메뉴 -->
	  </div>
	  <div class="col-lg-9">
<article>
<%
	String name = (String)session.getAttribute("id"); // 로그인 유지
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDAO boardDAO = new BoardDAO();
	BoardBean boardBean = boardDAO.getBoard(num); // 매개변수로 전달받는 글 num에 해당하는 글을 조회하여 반환하는 메소드
	String DBContent ="";
	
	// 검색한 글의 내용이 있다면 내용들 엔터키 처리
	if(boardBean.getContent() != null){
		DBContent = boardBean.getContent().replace("<br><br>", "\n\n");
	}// if문 끝
	
	if(name == null){
%>		
 		<script type="text/javascript">
			alert("로그인을 하셔야 이용 가능합니다.");
			location.href="../member/login.jsp";
		</script>
<% 		
	}else if(name != null){
%>
		<form method="post" action="writeUpdatePro.jsp?pageNum=<%=pageNum%>" name="updatewriteform" style="padding:1em;">
		<h2>QnA Board</h2>
        <table align=left width=700 cellpadding=2>
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white> 글쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                        <tr>
                        <td>&nbsp;<b>글번호 :<b>&nbsp;&nbsp;</td>
                        <td><input type="text" name="DBnum" size="2" value="<%=num%>" readonly="readonly"></td>
                        </tr>
                        <tr>
                        <td>&nbsp;<b>조회수 :<b>&nbsp;&nbsp;</td>
                        <td><input type="text" name="DBreadcount" size="2" value="<%=boardBean.getReadcount()%>" readonly="readonly"> </td>
                        <tr>
                        <td>&nbsp;<b>작성자 :<b>&nbsp;&nbsp;</td>
                        <td><input type="text" name="name" size="7" value="<%=boardBean.getName()%>" readonly="readonly"> </td>
                        </tr>
                        <tr>
                        <td>&nbsp;&nbsp;&nbsp;<b>제목</b>&nbsp;&nbsp;</td>
                        <td><input type="text" name="subject" size="82" value="<%=boardBean.getSubject()%>"></td>
                        </tr>
                        <tr>
                        <td>&nbsp;&nbsp;&nbsp;<b>내용</b>&nbsp;&nbsp;</td>
                        <td><textarea name="content" cols="85" rows="15"><%=boardBean.getContent()%></textarea></td>
                        </tr>
                        <tr>
                        <td colspan="3">&nbsp;<input type="submit" value="수정" name="updatebtn" class="btn btn-primary"><input type="button" value="취소" onclick="history.back();" class="btn btn-primary"><input type="button" value="목록" onclick="location.href='../Menu/board.jsp'" class="btn btn-primary">
                        </td>
                        </tr>
                </table>
                </td>
                </tr>
        </table>
                        <div hidden="hidden">
						&nbsp;&nbsp;&nbsp;<b>아이피 :<b> <input type="text" name="ip" size="9" value="<%=boardBean.getIp()%>" readonly="readonly"></td>
                        </div>
		</form>
<%
	}
%>
	</div>
</article>
   </div>
 </div>
<br>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>