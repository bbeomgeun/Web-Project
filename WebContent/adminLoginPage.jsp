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
		//�ڷΰ��� ���� �ڵ�	
    </script> �̰� �����ϱ� ID, PW üũ�Ҷ� alert�� ��� ���(history.back�� �۵��� �ȵǴ� ��)-->
    
<meta charset="EUC-KR">
<title>������ �α��� ������</title>
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
		alert("���̵� �Է��ϼ���!");
		return false;
	}
	if(!document.signIn.PW.value){
		alert("��й�ȣ�� �Է��ϼ���!");
		return false;
	}

</script>
</head>
<body>

	<h1 align="center">���� �μ��� ���� Ȩ������ ������ �α��� ȭ���Դϴ�.</h1>

	<form class="login-form" action="adminLogin_check.jsp" name="signIn" method="post" onsubmit="return check()">
		<input type="text" name="ID" class="text" placeholder="���̵�">
		<input type="password" name="PW" class = "text" placeholder="��й�ȣ">
		<input type="submit" value = "������ �α���" class = "btn_submit">
		<input type="button" onclick="location.href='loginPage.jsp'" class = "btn_submit" value = "�Ϲ� �α������� ��ȯ"></input>
		<!-- �α���, ������ �α����� onclick�� js function���� �����ͺ��̽� Ȯ������ ó���� �� -->
	</form>
</body>
</html>