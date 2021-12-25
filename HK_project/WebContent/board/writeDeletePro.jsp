<%@page import="QnABoard.BoardDAO"%>
<%@page import="QnABoard.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 새 창에서 삭제 버튼을 누르면 실행되는 페이지 --%>
<%
	request.setCharacterEncoding("UTF-8"); // 한글 처리
	
	String name = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardBean boardBean = new BoardBean();
	BoardDAO boardDAO = new BoardDAO();
	
	boardBean.setNum(num);
	boardBean.setName(name);
	
	int check = boardDAO.deleteBoard(num, name); 
	
	if(check == 1){
		
		response.sendRedirect("../Menu/board.jsp");
		
	}else if(check == 0){
%>		
	<script type="text/javascript">
		alert("글 삭제에 실패하였습니다.\n담당자에게 문의하세요.");
	</script>
<%		
	} // if문 끝
%>