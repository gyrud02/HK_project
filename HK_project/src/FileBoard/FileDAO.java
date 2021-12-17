package FileBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FileDAO { // 자료실 게시판 작성, 삭제, 수정과 관련된 클래스

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private Connection getConn() throws Exception{ // DB와 연결하는 메소드
		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;
	} // getConnection() 끝
	
	public void insertBoard(FileBean fileBean){ // 게시판 글 작성하는 메서드 
		
		int num = 0;
		
		try {
			// 1. DB 연결
			con = getConn();
			
			// 2. sql & pstmt생성
			sql = "SELECT max(num) FROM Fileboard";
			pstmt = con.prepareStatement(sql);
			
			// 3. pstmt 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1)+1; // 추가할 새 글번호를 검색해서 얻은 최신 글번호 +1의 값으로 만들어서 저장한다. 
			}else{
				num = 1;
			} // if문 끝
			
			// 5. 추가할 데이터 sql 작성 & pstmt생성 
			sql = "INSERT INTO Fileboard (num, name, subject, readcount, writedate, re_ref,"
					+ " re_lev, re_seq, ip, filename, filerealname) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			// 6. ?값 정하기
			pstmt.setInt(1, num);
			pstmt.setString(2, fileBean.getName()); // 작성자
			pstmt.setString(3, fileBean.getSubject()); // 제목
			pstmt.setInt(4, 0); // 새로 추가할 글의 조회수는 0(기본값)이다
			pstmt.setTimestamp(5, fileBean.getWritedate()); // 글 작성한 날짜 및 시간
			pstmt.setInt(6, num); // 새로 추가할 글과 답변글을 묶어서 나타내는 그룹번호, 여기서는 새로 추가할 글의 그룹번호
			pstmt.setInt(7, 0); // 새로 추가할 글의 들여쓰기 정도 레벨값은 0(기본값)이다
			pstmt.setInt(8, 0); // 새로 추가할 글의 순서
			pstmt.setString(9, fileBean.getIp()); // 작성자의 아이피주소
			pstmt.setString(10, fileBean.getFileName()); // 파일이름
			pstmt.setString(11, fileBean.getFileRealName()); // 파일 원본 이름
			
			// 7. pstmt 실행
			pstmt.executeUpdate();
			
			System.out.println("-- 해당 글 등록 --");
			
		} catch (Exception e) {
			System.out.println("insertBoard() 내부에서 예외 발생 "+ e);
			e.printStackTrace();
		} finally { // 자원 해제
			closeDB();
		} // try문 끝
	} // insertBoard() 끝
	
	public FileBean selectboard(int num, String name){ // 글 조회하는 메서드
		
		FileBean fileBean = new FileBean();
		
		try {
			// 1. DB 연결
			con = getConn();
			
			// 2. SQL & pstmt 생성
			sql = "SELECT * FROM Fileboard WHERE name = ?";
			pstmt = con.prepareStatement(sql);
			
			// 3. ?값 설정
			pstmt.setString(1, name);
			
			// 4. pstmt 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				fileBean.setName(rs.getString("name"));
				fileBean.setSubject(rs.getString("subject"));
				fileBean.setContent(rs.getString("content"));
				fileBean.setReadcount(rs.getInt("readcount"));
			} // if문 끝
			
			System.out.println("-- 글 목록 조회 --");
			
		} catch (Exception e) {
			System.out.println("selectWrite() 내부에서 예외 발생 : "+ e);
			e.printStackTrace();
		} finally { // 자원 해제
			closeDB();
		} // try문 끝
		
		return fileBean;
	} // selectWrite() 끝
	
	public int deleteBoard(int num, String name){ // 작성한 글을 삭제하는 메서드
			
		int check = 0; // 0 - 글 삭제 실패, 1 - 글 삭제 성공
		
		try {
			// 1. DB 연결
			con = getConn();
			
			// 2. sql & pstmt 생성
			sql = "SELECT name FROM Fileboard WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			
			// 3. ?값 정해주기
			pstmt.setInt(1, num);
			
			// 4. pstmt 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()){ // 조회한 데이터가 있다면
				 
				if(name.equals(rs.getString("name"))){ // 조회한 글의 작성자와 현 세션아이디가 같다면 글을 삭제한다.

					 check = 1;
					 
					 sql = "DELETE FROM Fileboard WHERE num = ?";
					 pstmt = con.prepareStatement(sql);
					 pstmt.setInt(1, num);
					 pstmt.executeUpdate();
					 
				 }else{
					 check = 0; // 0 - 글 삭제 실패
				 } // 안쪽 if문 끝
			
			} // 바깥쪽 if문 끝
			
			System.out.println("작성한 글 삭제 완료!");
			
		} catch (Exception e) {
			System.out.println("deleteBoard() 내부에서 예외 발생 : "+ e);
			e.printStackTrace();
		} finally { // 자원 해제
			closeDB();
		} // try문 끝

		return check;
	} // deleteBoard() 끝
	
	public void updateReadCount(int num){ // 글 번호를 매개변수로 전달받아 글번호에 해당하는 글의 조회수를 1씩 증가시킨다.
		
		try {
			// DB연결
			con = getConn();
			
			// SQL구문 만들기 : 매개변수로 전달받은 num에 해당하는 글의 조회수를 1 증가시키자.
			sql = "UPDATE Fileboard SET readcount = readcount+1 WHERE num = ?";
			
			// pstmt 생성
			pstmt = con.prepareStatement(sql);
			
			// '?' 기호에 대응되는 글번호 num을 설정한다.
			pstmt.setInt(1, num);
			
			// UPDATE SQL문 실행
			pstmt.executeUpdate();
			
			System.out.println("-- 조회수 1증가 --");
			
		} catch (Exception e) {
			System.out.println("updateReadCount() 내부에서 예외 발생 : "+e.toString());
			e.printStackTrace();
		} finally {// 자원해제
			closeDB(); 
		} // try문 끝
		
	} // updateReadCount() 끝
	
	public FileBean getBoard(int num){ // 매개변수로 전달받는 글 num에 해당하는 글을 조회하여 반환하는 메소드
		
		FileBean fileBean = null;
		
		try {
			// DB 연결
			con = getConn();
			
			// SQL & pstmt생성 : 매개변수로 전달받는 글 num에 해당하는 글 조회
			sql = "SELECT * FROM Fileboard WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			
			// '?' 기호에 대응되는 글 num을 설정한다.
			pstmt.setInt(1, num);
			
			// SELECT문 실행 후 조회한 결과 레코드 얻기
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				fileBean = new FileBean();
				fileBean.setNum(rs.getInt("num"));
				fileBean.setName(rs.getString("name"));
				fileBean.setSubject(rs.getString("subject"));
				fileBean.setWritedate(rs.getTimestamp("writedate"));
				fileBean.setReadcount(rs.getInt("readcount"));
				fileBean.setFileRealName(rs.getString("fileRealName"));
			} // if문 끝
			
			System.out.println("-- 해당 글 조회  --");
			
		} catch (Exception e) {
			System.out.println("getBoard() 내부에서 예외 발생 : "+e);
			e.printStackTrace();
		} finally {
			closeDB(); // 자원 해제
		} // try문 끝
		
		return fileBean;
	} // getBoard() 끝	
	
	public int getBoardCount(){ // fileboard테이블에 저장된 전체 글 갯수를 조회해서 제공하는 메소드
		
		int count = 0; // 테이블에 저장되어 있는 조회한 글의 갯수를 저장할 변수
		
		try {
			// 커넥션풀로부터 커넥션 얻기
			con = getConn();
			
			// SQL & pstmt생성
			sql = "SELECT COUNT(*) FROM Fileboard";
			pstmt = con.prepareStatement(sql);
			
			// pstmt 실행
			rs = pstmt.executeQuery(); // 전체 글 갯수를 조회 후 반환한다.
			
			if(rs.next()){ // 전체 글 갯수가 조회가 된다면
				count = rs.getInt(1); // 조회한 글 갯수를 저장한다.
			}else{
				count = 0;
			} // if문 끝
			
			System.out.println("-- 전체 글 조회 --");
			
		} catch (Exception e) {
			System.out.println("getBoardCount() 내부에서 예외 발생 : "+e);
			e.printStackTrace();
		} finally {
			closeDB(); // 자원 해제
		} // try문 끝
		
		return count; // 조회한 글의 갯수를 반환한다.
	} // getBoardCount() 끝
	
	public List<FileBean> getBoardList(int startRow, int pageSize){ // 글의 목록을 검색해서 가져오는 메소드
		
		// 테이블로부터 검색한 글 정보들을 각각 한줄 단위로 fileBean객체에 저장한 후, 
		// fileBean객체들을 각각 ArrayList<>[]에 추가로 저장하기 위한 용도이다.
		List<FileBean> fileList = new ArrayList<FileBean>(); 
		
		try {
			// DB연결
			con = getConn();
			
			// SQL 구문 생성
			sql = "SELECT * FROM Fileboard ORDER BY re_ref DESC, re_seq ASC limit ?,?";
			// LIMIT는 가져오는 row의 수,  offset은 몇번째 로우부터 가져올지 / 첫번째 ?는 startRow, 두번쩨 ?는 pageSize
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow); // 첫번째 ?는 startRow
			pstmt.setInt(2, pageSize); // 두번쩨 ?는 pageSize
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				// 검색한 글 목록중에서 한줄 단위의 데이터를 저장할 용도의 객체를 생성한다. 
				FileBean fileBean = new FileBean();
				
				// rs : noticeBean객체의 각 변수에 저장한다.
				fileBean.setNum(rs.getInt("num"));
				fileBean.setName(rs.getString("name"));
				fileBean.setSubject(rs.getString("subject"));
				fileBean.setWritedate(rs.getTimestamp("writedate"));
				fileBean.setReadcount(rs.getInt("readcount"));
				
				// noticeBean 객체를 ArrayList[]에 추가한다.
				fileList.add(fileBean);
			} // while문 끝
			
		} catch (Exception e) {
			System.out.println("getBoardList() 내부에서 예외 발생 : "+e);
			e.printStackTrace();
		} finally {
			closeDB();; // 자원해제
		} // try문 끝
		
		return fileList; // 검색한 글 정보들(noticeBean객체들)을 저장하고 있는 배열 공간인 ArrayList를 notice.jsp로 반환한다.
	} // getBoardList() 끝
		
	public void closeDB(){ // 자원 해제 메서드
		
		try {
			if(rs != null){rs.close();}
			if(pstmt != null){pstmt.close();}
			if(con != null){con.close();}
		} catch (Exception e) {
			System.out.println("자원 해제 중 예외 발생 : "+ e);
			e.printStackTrace();
		} // try문 끝
	} //  closeDB() 끝
	
} //  BoardDAO 클래스 끝
