<%@page import="JoinMember.MemberDAO"%>
<%@page import="JoinMember.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 회원가입</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(function check() {
			
		$("#joinmember").submit(function() {
		
			// 이름 필수 입력 체크
			if($("#name").val() == ""){
				alert("이름을 입력하세요.");
				$("#name").focus();
				return false;
			} // #name if문 끝
			
			// 아이디 필수 입력 체크
			if($("#id").val() == ""){
				alert("아이디를 입력하세요.");			
				$("#id").focus();
				return false;
			} // #id if문 끝
			
			// 비밀번호 필수 입력 체크
			if($("#pwd").val() == ""){
				alert("비밀번호를 입력하세요.")
				$("#pwd").focus();
				return false;
			} // #pwd if문 끝

			// 비밀번호 길이 체크
			if($("#pwd").val().length <= 8){
				alert("비밀번호를 9자 이상 입력하세요.")
				$("#pwd").focus();
				return false;
			} // #pwd if문 끝
		
			// 비밀번호 확인 필수 입력 체크
			if($("#pwd2").val() == ""){
				alert("비밀번호 확인란을 입력하세요.")
				$("#pwd2").focus();
				return false;
			} // #pwd2 if문 끝

			// 비밀번호 입력란과 비밀번호 확인 입력란에 입력한 값이 동일한지 비교문
			if(document.joinmember.pwd.value != document.joinmember.pwd2.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            } // 비교문 끝
			
			// 성별 필수 입력 체크
			if(!($("#male").is(":checked")) && (!($("#female").is(":checked")))){
				alert("성별을 선택하세요.");
				$("#male").focus();
				return false;
			} // #gender if문 끝
			
			// 나이 필수 입력 체크
			if($("#age").val() == ""){
				alert("나이를 입력하세요.");
				$("#age").focus();
				return false;
			} // #age if문 끝
			
			// 전화번호 필수 입력 체크
			if($("#phone").val() == ""){
				alert("전화번호를 입력하세요.");
				$("#phone").focus();
				return false;
			} // #tel if문 끝
			
			// 이메일 필수 입력 체크
			if($("#email").val() == ""){
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return false;
			} // #email if문 끝
			
			// 주소 필수 입력 체크
			if($("#sample6_postcode").val() == "" || ($("#sample6_address").val() == "")
					|| ($("#sample6_detailAddress").val() == "") || ($("#sample6_extraAddress").val() == "")){
				alert("주소를 입력하세요.");
				$("#sample6_postcode").focus();
				return false;
			} // #address if문 끝
			
		}); // submit(){} 끝
	
	}); // check() 끝

	$(function (){ // 아이디 중복체크 버튼을 눌렀을 때 사용하는 메서드
			
		$("#idcheckbtn").on('click', function(){
		
				// 아이디 6자 이상 입력 체크
				if($("#id").val().length <= 5){
					alert("아이디를 6자 이상 입력하세요.");			
					$("#id").focus();
					return false;
				} // 아이디 6자 이상 입력  if문 끝	
			
				// 1. 아이디를 입력했는지 판단한다.
				// 2. DB와 연동하여 입력한 아이디가 DB에 존재하는지 판단한다.
				if(document.joinmember.id.value == ""){
					window.alert("아이디를 입력하세요.");
					
					document.joinmember.id.focus();
					return;
				} // if문 끝
				
				// 아이디를 입력했다면 중복체크를 한다.
				var checkid = document.joinmember.id.value;
				
				// 새로운 팝업창을 띄우면서 입력한 아이디를 전송한다.
				window.open("join_IDcheck.jsp?userid=" + checkid, "", "width = 400, height = 200");
							// Join.jsp?userid=" 주소창
		}); // on() 끝
	}); // function() 끝
</script>
<body>
<jsp:include page="../Layout/header.jsp"/>
<!-- 왼쪽 메뉴 -->
<div class="container">
  <div class="row">
	<div class="col-lg-3">
        <h1 class="my-4"><a href="../index.jsp">HKmall</a></h1>
        <div class="list-group">
          <a href="../Menu/outer.jsp" class="list-group-item" id="outer">상의/아우터</a>
          <a href="../Menu/pants.jsp" class="list-group-item" id="pants">하의/팬츠</a>
          <a href="../Menu/board.jsp" class="list-group-item" id="QnA">문의게시판</a>
           <a href="../Menu/fileboard.jsp" class="list-group-item" id="fileboard">자료실</a>
           <a href="../gallary/gallary.jsp" class="list-group-item" id="gallary">갤러리</a>
        </div>
    </div> <!-- 왼쪽 메뉴 -->
<article>
	<form name="joinmember" id="joinmember" method="post" action="JoinPro.jsp" class="container" style="float:2em; padding:0.9em">
	<h2>Join Us</h2>
	<h6>* 은 필수 입력 사항입니다.</h6><br>
		<b>* 이름</b> : &nbsp;<input type="text" name="name" id="name" maxlength="10"/><br><br>
		<b>* 아이디</b>  : &nbsp;<input type="text" name="id" id="id" placeholder="&nbsp;6자 이상 15자 이내" minlength="6" maxlength="15"/>
		<input type="button" value="아이디중복확인" id="idcheckbtn" name="idcheckbtn"><br><br>
		<b>* 비밀번호</b>  : &nbsp;<input type="password" name="pwd" id="pwd" placeholder="&nbsp;9자 이상 20자 이내" minlength="9" maxlength="20"/><br><br>
		<b>* 비밀번호 확인</b>  : &nbsp;<input type="password" name="pwd2" id="pwd2"/><br><br>
		<b>* 성별</b> &nbsp;&nbsp; 
		남 <input type="radio" name="gender" id="male" value="M">&nbsp;&nbsp; 
		여 <input type="radio" name="gender" id="female" value="F"><br><br>
		<b>* 나이</b> : &nbsp;<input type="text" name="age" id="age" size="1">&nbsp;세<br><br>
		<b>* 전화번호</b> : &nbsp;<input type="text" name="phone" id="phone" placeholder=" '-' 없이 입력해주세요."/><br><br>
		<b>* 이메일</b> : &nbsp;<input type="text" name="email" id="email" placeholder="예: hong01@naver.com"><br><br>
		<b>* 주소</b> :&nbsp;
		<input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="sample6_address" id="sample6_address" placeholder="주소">
		<input type="text" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소">
		<input type="text" name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목">

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
		<b>&nbsp;&nbsp;&nbsp;기타사항</b> : <br>
		&nbsp;&nbsp;&nbsp;<textarea name="etc" cols="84" rows="5"></textarea><br><br>
		&nbsp;&nbsp;&nbsp;<input type="submit" value="회원가입"/>
		&nbsp;<input type="reset" value="다시입력"/>
		</form>
	<br>
 </div>
</div>
</article>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>