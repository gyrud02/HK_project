<%@page import="QnABoard.BoardBean"%>
<%@page import="QnABoard.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 글 수정하는 페이지 --%>
<%
	request.setCharacterEncoding("UTF-8");

	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("DBnum"));
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String ip = request.getParameter("ip");

	BoardDAO boardDAO = new BoardDAO();
	BoardBean boardBean = new BoardBean();
	
	int check = boardDAO.updateBoard(num, name, subject, content);
	
	if(check == 1){
%>		
		<script type="text/javascript">
			alert("작성한 글이 수정되었습니다.");
			location.href="../Menu/board.jsp?pageNum=<%=pageNum%>";
		</script>	
<%		
	}else if(check == 0){
%>		
		<script type="text/javascript">
			alert("작성한 글 등록이 실패하였습니다.");
			location.href="../Menu/board.jsp";
		</script>
<%		
	} // if문 끝
%>