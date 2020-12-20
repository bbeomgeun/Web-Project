<%@page import="java.io.Console"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 페이지</title>
<style>
<style>
	* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
  border-radius: 5px;
}
 
body {
  margin: 0;
  background-color: #1BBC9B;
}
 
.login-form {
    width: 300px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 50px;
    padding: 20px;
    text-align: center;
    border: none;
}
.text {
      font-size: 14px;
      padding: 10px;
      border: none;
      width: 260px;
      margin-bottom: 10px;
}
.btn_submit {
  font-size: 14px;
  border: none;
  padding: 10px;
  width: 260px;
  background-color: #1BBC9B;
  margin-bottom: 30px;
  color: white;
}
</style>
</style>

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
	if(!document.signUp.nickname.value){
		alert("닉네임을 입력하세요!")
		return false;
	}
}
function PWcheck(){
	if(document.signUp.pw.value != document.signUp.pwCheck.value){
		alert("비밀번호를 동일하게 입력하세요.")
		return false;
	}
}
function reload(){
	location.href = "loginPage.jsp"
}

</script>

</head>
<body>

<h1 align="center">벽돌 부수기 게임 홈페이지 회원가입 화면입니다.</h1>

	<form class="login-form" action = "signUp_check.jsp" method="post" name="signUp" onsubmit="return check()">
		<input type="text" name="id" class="text" placeholder="아이디"><p>
		<input type="password" name="pw" class = "text" placeholder="비밀번호"><p>
		<input type="text" name = "nickname" class = "text" placeholder="닉네임""><p>
		<input type="submit" value = "회원가입" class = "btn_submit">
		<input type="button" value = "취소" onclick = "reload()"class = "btn_submit">
	</form>


</body>
</html>