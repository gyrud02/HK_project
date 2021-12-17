<%@page import="JoinMember.MemberDAO"%>
<%@page import="JoinMember.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HKmall - 로그인</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(function(){
	
		$("#logincheck").submit(function (){
			
			if($("#id").val() == ""){
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return false;
			} // #id if문 끝
			
			if($("#pwd").val() == ""){
				alert("비밀번호를 입력하세요.");
				$("#pwd").focus();
				return false;
			} // #pwd if문 끝
			
		$(function(){ // 아이디 기억하기 체크를 눌렀을 때 발생하는 기능
				
			$("#id").val(Cookies.get('key'));
			if($("#id").val() != "") $("#rememberid").attr("checked", true);
			
			$("#rememberid").change(function(){
				if($("rememberid").is(":checked")) Cookies.set('key', $("#id").val(), { expires: 900});
				else Cookies.remove('key');												
				
			}); // change(function() 끝
			
			$("#rememberid").keyup(function(){
				if($("rememberid").is(":checked")) Cookies.set('key', $("#id").val(), { expires: 900});
																						
			}); // keyup(function() 끝

		}); // $(function() 끝
	}); // submit() 끝
}); // $(function() 끝

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
	<br>
	<br>
	<form action="loginPro.jsp" method="post" name="logincheck" id="logincheck" style="text-align: center; float:2em; padding:0.9em; margin-left:8em;">
		<table>
			<th colspan="2" style="text-align:center;"><h4> < WELCOME > </h4></th>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td width="50%">&nbsp;&nbsp;아이디 :</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td width="50%"> 비밀번호 :&nbsp;</td>
				<td> <input type="password" name="pwd" id="pwd"></td>
			</tr>	
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td colspan="2"> ID 저장하기 &nbsp; <input type="checkbox" name="rememberid" id="rememberid"></td>
			</tr>	
		</table>
			<br>
			<small><i><a href="Join.jsp">회원가입</a>을 하셔야 이용 가능합니다.</i></small>
			<br>
			<br>
				<input type="submit" value="로그인" name="loginbtn">
				<input type="button" value="회원가입" onclick="location.href='Join.jsp'">
	</form>
</article>   
 </div>
</div>    
<br>
<br>
<br>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>