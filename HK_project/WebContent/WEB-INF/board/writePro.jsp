<%@page import="java.sql.Timestamp"%>
<%@page import="QnABoard.BoardBean"%>
<%@page import="QnABoard.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 게시판에 글을 등록하는 기능을 가진 페이지 --%> 
 
<%
	request.setCharacterEncoding("UTF-8"); // 한글처리
	
	// 값 얻어오기
	String name = (String)request.getParameter("name"); // 작성자
	String subject = (String)request.getParameter("subject"); // 글제목
	String content = (String)request.getParameter("content"); // 글내용
	System.out.println(request.getRemoteAddr() );

	// 메소드 호출을 위해 객체 생성
	BoardDAO boardDAO = new BoardDAO();
	BoardBean boardBean = new BoardBean();

	boardBean.setName(name);
	boardBean.setSubject(subject);
	boardBean.setContent(content);
	boardBean.setWritedate(new Timestamp( System.currentTimeMillis() )); // 컴퓨터 시간을 long타입의 값으로 반환한다.
	boardBean.setIp(request.getRemoteAddr()); // 아이피 주소 갖고오기
	
	boardDAO.insertBoard(boardBean);
	
	if(boardBean != null){
%>
	<script type="text/javascript">
		alert("글이 등록되었습니다.");
		location.href="../Menu/board.jsp";
	</script>	
<%
	}else if(boardBean == null){
%>		
	<script type="text/javascript">
		alert("글 등록에 실패하였습니다.\n담당자에게 문의하세요.");
		location.href="../Menu/notice.jsp";
	</script>
<%		
	}
%>