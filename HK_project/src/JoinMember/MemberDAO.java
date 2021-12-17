package JoinMember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO { // 회원 가입, 탈퇴, 정보수정과 관련된 클래스

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private Connection getConnection() throws Exception{ // DB 연결하는 메서드
		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;
	} // getConnection() 끝
	
	public void insertMember(MemberBean memberBean){ // 회원 등록 메서드
		
		try {
			// 1 & 2. 연결
			con = getConnection();
			System.out.println("DB 연결 성공!");
		
			// 3. SQL구문 작성
			sql = "INSERT INTO JoinMember (joindate, name, id, pwd, gender, age, phone, email, postcode, address, etc) "
										+ "VALUES (now(),?,?,?,?,?,?,?,?,?,?) ";
											// joindate, name, id, pwd, gender, age, phone, email, address, etc
			// 4. pstmt 객체 실행
			pstmt = con.prepareStatement(sql);
			
			// 5. 해당되는 데이터를 가져온다.
			pstmt.setString(1, memberBean.getName()); // 이름
			pstmt.setString(2, memberBean.getId()); // 아이디
			pstmt.setString(3, memberBean.getPwd()); // 비밀번호
			pstmt.setString(4, memberBean.getGender()); // 성별
			pstmt.setString(5, memberBean.getAge()); // 나이
			pstmt.setString(6, memberBean.getPhone()); // 전화번호
			pstmt.setString(7, memberBean.getEmail()); // 이메일
			pstmt.setString(8, memberBean.getPostcode()); // 주소
			pstmt.setString(9, memberBean.getAddress()); // 주소
			pstmt.setString(10, memberBean.getEtc()); // 기타사항
			
			// 6. SQL 구문 쿼리 실행
			pstmt.executeUpdate();
			
			System.out.println("회원 가입이 완료되었습니다.");
			
		} catch (Exception e) {
			System.out.println("insertMember() 내부에서 오류 발생 : "+ e);
		} finally{
			closeDB(); // 자원 해체
		} // try문 끝
	} // JoinMember() 끝
	
	public int idCheck(String id){ // 아이디 중복 체크하는 메서드
		
		int check = 0;
		
		try {
			
		 // 1 & 2. 연결
		 con = getConnection();
		 System.out.println("DB 연결 성공!");
		 
		 // 3. SQL 구문 작성
		 sql = "SELECT * FROM JoinMember WHERE id = ?";
		
		 // 4. SQL 구문 실행
		 pstmt = con.prepareStatement(sql);
		 
		 // 5. ?에 해당하는 값 설정하기
		 pstmt.setString(1, id);
		 
		 // 6. SQL 구문 실행
		 rs = pstmt.executeQuery();
		 
		 System.out.println("아이디 중복 체크 성공!");	
		 
			 // 7. 입력한 아이디가 DB에 존재한다면 
			 if(rs.next()){ // 1 = 아이디가 존재한다.
				 check = 1; 
			 }else{
				 check = 0; // 0 = 아이디가 존재하지 않는다.
			 } // if문 끝
			 
		} catch (Exception e) {
			System.out.println("idCheck() 내부에서 오류 발생 : "+ e);
		} finally {
			closeDB(); // 자원 해제
		} // try문 끝
		 
		return check; // 1 또는 0을 join_IDcheck.jsp로 리턴한다.
	} // idCheck() 끝 
	
	public int userCheck(String id, String pwd){ // 로그인 창의 id, pwd와 DB의 데이터가 일치하는지 확인하는 메서드
		
		int check = -1; // check가 1 = id & pwd 일치
						// check가 0 = id 일치
						// check가 -1 = 불일치
		try {
			// 1. DB연결
			con = getConnection();
			System.out.println("DB 연결 성공!");
			
			// 2. SQL 구문 작성
			sql = "SELECT * FROM JoinMember WHERE id = ?";
			
			// 3. pstmt 객체 얻기
			pstmt = con.prepareStatement(sql);
			
			// 4. ?의 값을 설정한다
			pstmt.setString(1, id);
			
			// 5. 검색 실행
			rs = pstmt.executeQuery(); // 조회는 Query()
			
			// 6. 입력한 id가 DB에 있다면
			if(rs.next()){
				
				if(rs.getString("pwd").equals(pwd)){ // 비밀번호와 일치하는지 확인한다.
					check = 1; // check가 1 = id & pwd 일치
				}else{
					check = 0; // check가 0 = id만 일치
				} // 안쪽 if문 끝
				
			}else{
				check = -1; // check가 -1 = 둘 다 불일치
				
			} // 바깥 if문 끝
			
		} catch (Exception e) {
			System.out.println("userCheck() 내부에서 오류 발생 : " + e);
		} finally {
			closeDB(); // 자원 해제
		} // try문 끝

		return check; // loginPro.jsp에 check값을 돌려준다.
	} // userCheck() 끝
	
	public MemberBean selectUser(String id){ // 회원정보 수정할 때 조회하는 메서드
		
		MemberBean memberBean = new MemberBean();
		
		try {
			// 1. DB 연결
			con = getConnection();
			System.out.println("DB 연결 성공!");

			// 2. SQL 작성
			sql = "SELECT * FROM JoinMember WHERE id = ?";
			
			// 3. pstmt객체 생성
			pstmt = con.prepareStatement(sql);
			
			// 4. ?에 값을 넣기
			pstmt.setString(1, id);
			
			// 5. 실행 후 데이터를 rs에 담기
			rs = pstmt.executeQuery();
			
			System.out.println(id);
			
			if(rs.next()){ 
				memberBean.setName(rs.getString("name"));
				memberBean.setId(rs.getString("id"));
				memberBean.setPwd(rs.getString("pwd"));
				memberBean.setAge(rs.getString("age"));
				memberBean.setPhone(rs.getString("phone"));
				memberBean.setEmail(rs.getString("email"));
				memberBean.setPostcode(rs.getString("postcode"));
				memberBean.setAddress(rs.getString("address"));
				memberBean.setEtc(rs.getString("etc"));
			}// if문 끝
			
			System.out.println("회원 정보 조회 완료!");
			
		} catch (Exception e) {
			System.out.println("updateUser() 내부에서 예외 발생 : "+ e);
		} finally { // 자원해제
			closeDB();
		} // try문 끝
		
		return memberBean;
	} // updateUser() 끝
	
	// 회원 정보 중 전화번호, 이메일, 기타사항의 내용을 변경하는 메서드
	public boolean updateUser(MemberBean memberBean){ // 회원 정보 수정 시 사용되는 메서드
		
		boolean tf = false;
		
		try {
			// 1. DB 연결
			con = getConnection();
			
			// 2. sql & pstmt생성
			sql = "UPDATE joinmember SET phone = ?, email = ?, etc = ? WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			// 3. '?'값 넣기
			pstmt.setString(1, memberBean.getPhone());
			pstmt.setString(2, memberBean.getEmail());
			pstmt.setString(3, memberBean.getEtc());
			pstmt.setString(4, memberBean.getId());
			
			// 4. pstmt 실행
			pstmt.executeUpdate();
			
			if(pstmt.executeUpdate() > 0){ // 해당되는 데이터가 있다면
				tf = true;
			}else{
				tf = false;
			} // if문 끝	
			
			System.out.println("회원 정보 수정 완료!");
					
		} catch (Exception e) {
			System.out.println();
		} finally { // 자원 해제
			closeDB();
		} // try문 끝
		
		return tf;
	} // updateUser() 끝
	
	public int deleteUser(String id){ // 회원 삭제하는 메서드

		int result = 0; // 해당하는 아이디가 없다
		
		try {
			// 1. DB 연결
			con = getConnection();
			System.out.println("DB 연결 성공!");
			
			// 2. sql 작성 및 pstmt객체 생성
			sql = "DELETE FROM joinmember WHERE id = ?";
			
			pstmt = con.prepareStatement(sql);

			// 3. '?'값 설정
			pstmt.setString(1, id);
			
			// 4. 실행
			result = pstmt.executeUpdate();
			
			System.out.println("회원 탈퇴 완료!");
			
		} catch (Exception e) {
			System.out.println("deleteUser() 내부에서 예외 발생 : " + e);
			e.printStackTrace();
		}finally { // 자원 해제
			closeDB();
		} // try문 끝
		
		return result;
	} // deleteUser() 끝

	public void closeDB(){ // 자원 해제하는 메서드
		
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (Exception e) {
			System.out.println("자원 해제 중 오류 발생 : "+ e);
			e.printStackTrace();
		} // try문 끝
	} // closeDB() 끝
	
} // MemberDAO 클래스 끝
