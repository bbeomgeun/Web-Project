<%@page import="java.io.Console"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 페이지</title>
<script>

function check(){
	if(!document.signUp.id.value){
		alert("아이디를 입력하세요!");
		return false;
	}
	if(!document.signUp.pw.value){
		alert("비밀번호를 입력하세요!");
		return false;
	}
	
	if(document.signUp.pw.value != document.signUp.pwCheck.value){
		alert("비밀번호를 동일하게 입력하세요.")
		return false;
	}
	if(!document.signUp.nickname.value){
		alert("닉네임을 입력하세요!")
		return false;
	}
}

function checkID() {
	
}

</script>

</head>
<body>

<h1 align="center">벽돌 부수기 게임 홈페이지 회원가입 화면입니다.</h1>
<form action = "signUp_check.jsp" method="post" name="signUp" onsubmit="return check()">
	<input type="text" name="id" class="text" placeholder="아이디">
	<input type="button" name="idCheck" class="text" value = "아이디 중복확인" onclick="checkID()">
	<input type="password" name="pw" class = "text" placeholder="비밀번호">
	<input type="password" name="pwCheck" class = "text" placeholder="비밀번호확인">
	<input type="text" name = "nickname" class = "text" placeholder="닉네임">
	<input type="button" name="nicknameCheck" class="text" value = "닉네임 중복확인" onclick="checkNickname()">
	<input type="submit" value = "회원가입" class = "btn_submit">
	<input type="reset" value = "취소" class = "btn_submit">
</form>

</body>
</html>