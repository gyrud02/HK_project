<%@page import="FileBoard.FileBean"%>
<%@page import="FileBoard.FileDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 자료실에 글을 등록하는 기능을 가진 페이지 --%> 
<%
	request.setCharacterEncoding("UTF-8"); // 한글처리
	
	// 업로드 할 파일을 선택하여 등록
	ServletContext ctx = getServletContext();
	
	String uploadpath = ctx.getRealPath("/fileboard/upload"); 
	// 파일이 업로드될 실제 tomcat 폴더의 WebContent 기준

	int max = 100 * 1024 * 1024; // 업로드 할 수 있는 파일의 사이즈 지정

	MultipartRequest multi = new MultipartRequest(request, uploadpath, max, "UTF-8", new DefaultFileRenamePolicy());

	String filename = "";
	String originFilename = "";
	
	// 값 얻어오기
	String name = multi.getParameter("name"); // 작성자
	String subject = multi.getParameter("subject"); // 파일명 + 제목
	filename = multi.getFilesystemName("fileUpload"); // 업로드할 파일명
	originFilename = multi.getOriginalFileName("fileUpload"); // 업로드할 파일원본명
	System.out.println(request.getRemoteAddr() ); // 작성일자
	
//	out.println(user+", "+title); // user-업로드 하는 사람/title-파일 업로드 = 결과값 : 업로드 하는 사람, 파일 업로드
//	out.println("<hr/>");
	
	File file = multi.getFile(filename);

	// 메소드 호출을 위해 객체 생성
	FileDAO fileDAO = new FileDAO();
	FileBean fileBean = new FileBean();

	fileBean.setName(name);
	fileBean.setSubject(subject);
	fileBean.setWritedate(new Timestamp( System.currentTimeMillis() )); // 컴퓨터 시간을 long타입의 값으로 반환한다.
	fileBean.setFileName(filename);
	fileBean.setFileRealName(originFilename);
	fileBean.setIp(request.getRemoteAddr()); // 아이피 주소 갖고오기
	
	fileDAO.insertBoard(fileBean);
	
	if(fileBean != null){
%>
	<script type="text/javascript">
		alert("글이 등록되었습니다.");
		location.href="../Menu/fileboard.jsp";
	</script>	
<%
	}else if(fileBean == null){
%>		
	<script type="text/javascript">
		alert("글 등록에 실패하였습니다.\n담당자에게 문의하세요.");
		location.href="../Menu/fileboard.jsp";
	</script>
<%		
	}
%>