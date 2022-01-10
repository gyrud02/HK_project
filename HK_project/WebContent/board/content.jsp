<%@page import="QnABoard.BoardBean"%>
<%@page import="QnABoard.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 문의게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
</head>
<%
	/*글 상세보기 페이지*/	
	// num pageNum 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// 전달받은 글num을 이용하여 글을 검색 하기 위해 BoardDAO객체를 생성하고 
	BoardDAO dao = new BoardDAO();
	
	// 검색하는 하나의 글정보의 조회수를 1증가 시킨다.
	dao.updateReadCount(num);
	 
	// 하나의 글정보를 검색 하여 얻는다.
	BoardBean bBean = dao.getBoard(num); 
	int DBnum = bBean.getNum(); // 조회한 글번호 
	String DBName = bBean.getName(); // 조회한 작성자 
	int DBreadcount = bBean.getReadcount(); // 조회한 조회수
	
	// 날짜형식을 조작할수 있는 SimpleDataFormat객체의 format()메소드 사용
	SimpleDateFormat f = new SimpleDateFormat("yyyy/MM/dd");
	Timestamp DBdate =  bBean.getWritedate(); // 조회한 작성일
//	String newDate = f.format(DBdate);
	
	String DBContent = "";
	if(bBean.getContent() != null){ // 조회한 글내용이 존재하면
	
		// 조회한 글 내용을 변수에 저장. 작성한 내용중  엔터키로 줄바꿈 한 것들은 똑같이 처리하여 반환한다.			
		DBContent = bBean.getContent().replace("<br>", "\r\n");
	} // if문 끝
	
	String DBSubject = bBean.getSubject(); // 조회한 글제목
	
	//답변글에 사용되는 조회한 값들 얻기
	int DBRe_ref = bBean.getRe_ref(); // 조회한 주글의 그룹번호
	int DBRe_lev = bBean.getRe_lev(); // 조회한 주글의 들여쓰기 정도값
	int DBRe_seq = bBean.getRe_seq(); // 주글들 내의  조회한 주글의 순서값
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
          <a href="../Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
          <a href="../Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
          <a href="../Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
          <a href="../Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
	      <a href="../member/logout.jsp" class="list-group-item" id="delete">로그아웃</a>
<% 
	} // if문 끝
%>         
		</div> <!-- 왼쪽 메뉴 -->
	  </div>
	 <div class="col-lg-9">
		<form method="post" id="contentform" name="contentform" action="writePro.jsp" style="padding:1em;">
		<h2>QnA Board</h2>
        <table align=left width=700 cellpadding=2 >
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white> 글보기 </font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2" >
                   <tr height="50">
                   <td colspan="2">&nbsp;<b>글번호 :</b>&nbsp;&nbsp;<input type="text" id="DBnum" name="DBnum" value="<%=DBnum%>" size="2" readonly="readonly"></td>
                   </tr>
                   <tr height="50">
                   <td colspan="2">&nbsp;<b>조회수 :</b>&nbsp;&nbsp;<input type="text" id="DBreadcount" name="DBreadcount" value="<%=DBreadcount%>" size="2" readonly="readonly"></td>
                   </tr>
                   <tr height="50">
                   <td colspan="2">&nbsp;<b>작성자 :</b>&nbsp;&nbsp;<%=DBName%></td>
                   </tr>
                   <tr height="50">
                   <td colspan="2">&nbsp;&nbsp;&nbsp;<b>제목</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=DBSubject %></td>
                   </tr>
                   <tr height="230">
                   <td colspan="2">&nbsp;&nbsp;&nbsp;<b>내용</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=DBContent %></td>
                   </tr>
					<tr height="50">
					<td colspan="3"><input type="button" value="목록" name="list" onclick="location.href='../Menu/board.jsp'" class="btn btn-primary">
<%
	if(loginid != null){
%>		
				<input type="button" value="수정" name="updatebtn" onclick="location.href='../board/writeUpdate.jsp?num=<%=DBnum%>&pageNum=<%=pageNum%>'" class="btn btn-primary"> <input type="button" value="삭제" id="deletebtn" class="btn btn-primary">
<%
	} // if문 끝
%>		
                      </td>
					</tr>
		        </table>
				</tr>
			</table>
		</form>
<script type="text/javascript">
	
	// 글 삭제 버튼을 누르면 새 창이 뜬다.
	$("#deletebtn").on("click", function (){
			
	var result = confirm("글을 삭제하시겠습니까?");

		if(result == true){ // 삭제하려는 아이디를 조회했을 때 해당하는 아이디가 있다면
		
				location.href="../board/writeDeletePro.jsp?num=<%=DBnum%>&pageNum=<%=pageNum%>";
				alert("삭제되었습니다.");
		
		} // 바깥쪽 if문 끝
	}); // on() 끝
	
	$("#repleView").on("click", function(){
		
		window.open("repleView.jsp?num=" + DBnum, "댓글창", "width = 600, height = 400");
		
	}); // #repleview on() 끝
	
</script>
	</div>
	</div>
  </div>
<br>
</body>
<jsp:include page="../Layout/footer.jsp"/>	
</html>