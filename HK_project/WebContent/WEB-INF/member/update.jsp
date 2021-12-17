<%@page import="JoinMember.MemberBean"%>
<%@page import="JoinMember.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 마이페이지:회원정보</title>
</head>
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
	          <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
<%      
	}else{
%>		
	          <a href="../Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
	          <a href="../Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
	          <a href="../Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
	          <a href="../Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
	          <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
		      <a href="../member/logout.jsp" class="list-group-item" id="delete">로그아웃</a>
<% 
	} // if문 끝
%> 
	        </div>
	    </div> <!-- 왼쪽 메뉴 -->
<article>	
	<form action="updatePro.jsp" method="post" name="update" id="update" style="padding:1em;">
	<h2>My page</h2>
	<br>
<%
	MemberDAO memberDAO = new MemberDAO();
	
	if(loginid != null){
		
		MemberBean mb = memberDAO.selectUser(loginid);
%>
		<b>&nbsp;이름</b> : &nbsp;<input type="text" name="name" id="name" maxlength="3" value="<%=mb.getName() %>" readonly="readonly"/><br><br>
		<b>&nbsp;아이디</b> : &nbsp;<input type="text" name="id" id="id" value="<%=mb.getId() %>" readonly="readonly"/>
		<br><br>
		<b>&nbsp;비밀번호</b> : &nbsp;<input type="password" name="pwd" id="pwd" value="<%=mb.getPwd() %>" readonly="readonly"/><br><br>
		<b>&nbsp;나이</b> : &nbsp;<input type="text" name="age" id="age" size="1" value="<%=mb.getAge() %>" readonly="readonly">&nbsp;세<br><br>
		<b>&nbsp;전화번호</b> : &nbsp;<input type="text" name="phone" id="phone" value="<%=mb.getPhone() %>"/><br><br>
		<b>&nbsp;이메일</b> : &nbsp;<input type="text" name="email" id="email" value="<%=mb.getEmail() %>"><br><br>
		<b>&nbsp;주소</b> :&nbsp;
		<input type="text" name="address1" id="sample6_postcode" placeholder="우편번호" value="<%=mb.getPostcode()%>" readonly="readonly">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="address2" id="sample6_address" value="<%=mb.getAddress() %>" placeholder="주소" readonly="readonly">
		<input type="text" name="address3" id="sample6_detailAddress" placeholder="상세주소" disabled="disabled">
		<input type="text" name="address4" id="sample6_extraAddress" placeholder="참고항목" disabled="disabled"><br>

		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
		<br>
		<small>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<b>* 도로명 주소로 입력해주세요.</b></small>
		<br><br>	
		<b>&nbsp;기타사항</b> : <br>
		&nbsp;<textarea name="etc" cols="84" rows="5"><%=mb.getEtc() %></textarea><br>
		&nbsp;<input type="submit" value="회원정보수정"/>
		<input type="reset" value="다시입력"/>
		<input type="button" value="회원탈퇴" id="deletebtn" name="deletebtn">
	</form>
	</div>
</div>
<%
	}else if(loginid == null){
%>		
 		<script type="text/javascript">
			alert("로그인을 하셔야 이용 가능합니다.");
			location.href="login.jsp";
		</script> 
<%
	} // if문 끝
	
	/* 회원 탈퇴 버튼을 누르면 실행 */
	String id = request.getParameter("id");
%>	
<script type="text/javascript">
	
	// 회원탈퇴 버튼을 누르면 새 창이 뜬다.
	$("#deletebtn").on('click', function (){
			
	var result = confirm("회원 탈퇴를 하시겠습니까?");

		if(result == true){ // 삭제하려는 아이디를 조회했을 때 해당하는 아이디가 있다면
		
				location.href="deletePro.jsp";
				alert("회원 탈퇴 처리되었습니다.");
		
		} // 바깥쪽 if문 끝
	}); // on() 끝
</script>
</article>
<br>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>