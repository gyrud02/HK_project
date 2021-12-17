<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JoinMember.MemberDAO"%>
<script type="text/javascript">

	// 아래에 사용함 버튼을 클릭하면 호출되는 함수로 join_IDcheck.jsp(자식창)에 입력한 아이디를 얻어 
	// join.jsp(부모창)의 아이디 입력 <input>의 value속성에 값을 넣어 출력시킨다.
	function result(){

		// 현재 작은창의 <input>에 입력한 아이디를 얻어서
		// = 대입연산자를 기준으로 해서 뒤쪽의 값을 앞으로 저장한다.
		// 앞 : join.jsp(부모창)의 아이디 입력 <input>의 value값으로 설정해서 출력한다.
		opener.document.joinmember.id.value = document.getElementById("finallyId").value;
		
		// join.jsp(부모창)의 아이디 입력<input>에 더 이상 입력하지 못하도록 막아버린다.
//		opener.document.joinmember.id.disabled = "disabled"; // 비활성화 시 오류 발생
		
		// join.jsp(부모창)의 아이디중복체크 버튼인? <input>태그에 더 이상 클릭하지 못하도록 막아버린다.
		opener.document.getElementById("idcheckbtn").disabled = "disabled";
		
		// 자식창(join_IDcheck.jsp) 닫기
		window.close();
	}
</script>
 <%
 	// 1. 한글 처리
 	request.setCharacterEncoding("UTF-8");
 
 	// 2. join.jsp의 function에 의해 전달받은 id값(입력한 아이디를) 얻는다.
 	// 3. 중복확인 버튼을 클릭했을 때 <form>으로부터 전달받은 id값(다시 입력한 아이디를) 얻는다.
 	String id = request.getParameter("userid");

 	// 4. 입력한 아이디와 DB에 저장되어 있는 아이디를 비교하기위해 DB작업을 해야한다.
 	MemberDAO memberDAO = new MemberDAO();
 	
 	// 아이디 중복 체크 유무 값을 전달받기 위해 idCheck() 호출 시 입력한 아이디를 전달한다.
 	int check = memberDAO.idCheck(id);
 	
 	// 5. 응답 받은 값 check가 == 1일때  --> "사용중인 아이디입니다." <-- 아이디가 있다, 중복이다
		if(check == 1){
			out.println("사용중인 아이디입니다.");
		
		}else{
	// 			  check가 == 0일때  --> "사용 가능한 아이디입니다." <-- 입력한 아이디가 DB에 존재하지 않는다. 
	//														 중복이 아니다.
			out.println("사용 가능한 아이디입니다.");
%>	
	<%-- 6. 사용가능한 ID이면 사용함 버튼을 눌러서 부모창(join.jsp)에 사용 가능한 ID출력해주기 --%>
	<button type="button" onclick="result()">사용함</button>
<%
	}
%>
 	<form action="join_IDcheck.jsp">
 
 	<%-- join.jsp(부모창)에서 입력한 아이디를 request영역에서 얻어 아래의 input에 출력한다. --%>
 	<b>아이디 :</b> <input type="text" size="11" name="userid" value="<%=id%>" id="finallyId" minlength="6" maxlength="15"/>
 		  <input type="submit" value="중복확인" />
 	</form>