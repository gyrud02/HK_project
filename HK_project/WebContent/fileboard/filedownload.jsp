<%@page import="java.util.Enumeration"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 파일 다운로드를 할 수 있게 하는 기능 페이지 --%> 
<%
	request.setCharacterEncoding("UTF-8"); //한글처리

	String path = request.getParameter("path");
	String name = request.getParameter("name");
	
	String realPath = getServletContext().getRealPath("/" + path); // 업로드한 파일 경로
	
	response.setContentType("Application/x-msdownload");

	response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(name, "UTF-8") + "\";");
	
//	String fileName = new String(name.getBytes("UTF-8"));
	
	File file = new File(realPath + "\\" + name);

	//다운로드할 파일을 바이트 단위로 읽어 들일 버퍼공간 스트림 통로 생성
	FileInputStream inputStream  = new FileInputStream(file);	
	
	//파일다운로드를 요청한 클라이언트의 웹브라우저로 읽어 들인 파일의 정보를 버퍼 메모리 공간에서 
	//내보내기 위한 출력 스트림통로 만들기
	OutputStream outputStream = response.getOutputStream();
	
	out.clear();
	out = pageContext.pushBody();
	
	byte[] data = new byte[1024*8];
	
	while(true){
		
		//다운로드할 파일의 내용을 약 8kb단위만 한번 읽어와 변수에 저장
		int count = inputStream.read(data);	
		
		//더이상 파일에서 읽어 들일 값이 없으면 -1
		if(count == -1){
			break; //while반복문을 빠져 나감
		}
		
		// 다운로드할 파일로 부터 읽어 들인 전체 용량중..8kb의 값이 존재하면
		//읽어 들인 0~8KB 까지 8KB를 출력 파일을 내려 받을수 있게 
		//스트림 통로로 내보내서 웹브라우저의 버퍼공간에 저장후 다운로드 시킨다. 
		outputStream.write(data,0,count);
		
	} // while문 끝
	
	//스트림 통로 해제
	inputStream.close();
	outputStream.close();
%>