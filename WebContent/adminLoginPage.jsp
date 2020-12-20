<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
	<!-- <script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
		//뒤로가기 방지 코드	
    </script> 이거 넣으니까 ID, PW 체크할때 alert가 계속 뜬다(history.back이 작동이 안되는 듯)-->
    
<meta charset="EUC-KR">
<title>관리자 로그인 페이지</title>
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
<script>
function check(){
	if(!document.signIn.ID.value){
		alert("아이디를 입력하세요!");
		return false;
	}
	if(!document.signIn.PW.value){
		alert("비밀번호를 입력하세요!");
		return false;
	}

</script>
</head>
<body>

	<h1 align="center">벽돌 부수기 게임 홈페이지 관리자 로그인 화면입니다.</h1>

	<form class="login-form" action="adminLogin_check.jsp" name="signIn" method="post" onsubmit="return check()">
		<input type="text" name="ID" class="text" placeholder="아이디">
		<input type="password" name="PW" class = "text" placeholder="비밀번호">
		<input type="submit" value = "관리자 로그인" class = "btn_submit">
		<input type="button" onclick="location.href='loginPage.jsp'" class = "btn_submit" value = "일반 로그인으로 전환"></input>
		<!-- 로그인, 관리자 로그인은 onclick시 js function으로 데이터베이스 확인으로 처리할 것 -->
	</form>
</body>
</html>