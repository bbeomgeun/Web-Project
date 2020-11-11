<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 페이지</title>
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
</head>
<body>

	<h1 align="center">벽돌 부수기 게임 홈페이지 로그인 화면입니다.</h1>

	<form class="login-form" action="mainPage.jsp" method="post">
		<input type="text" name="ID" class="text" placeholder="아이디">
		<input type="password" name="PW" class = "text" placeholder="비밀번호">
		<input type="submit" value = "로그인" class = "btn_submit">
		<input type="button" onclick="location.href='signUp.jsp'" class = "btn_submit" value = "회원가입"></input>
		<input type="button" onclick="location.href='signUp.jsp'" class = "btn_submit" value = "관리자 로그인"></input>
		<!-- 로그인, 관리자 로그인은 onclick시 js function으로 데이터베이스 확인으로 처리할 것 -->
	</form>
	
	
	
	
</body>
</html>