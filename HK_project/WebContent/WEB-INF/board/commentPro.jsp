<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 댓글 처리 기능 페이지 --%>

<%
	request.setCharacterEncoding("UTF-8");

	int comment_Num = Integer.parseInt(request.getParameter("comment_Num")); // 댓글 번호
	String comment_id = request.getParameter("comment_id"); // 댓글 작성자
	String comment_contents = request.getParameter("comment_contents"); // 댓글 내용

	/* CommentBean commentBean = new CommentBean(); // commentbean생성
	commentBean.setId(comment_id);
	commentBean.setContents(comment_contents);
	commentBean.setResiter(new );

	CommentDAO commentDAO = new CommentDAO(); // commentDAO생성
	commentDAO.insertComment(); 
	
	JSONObject jsonobj = new JSONObject();
	jsonobj.put(comment_id);
	jsonobj.put(comment_contents);
	jsonobj.put(comment_Resiter); */
	
%>