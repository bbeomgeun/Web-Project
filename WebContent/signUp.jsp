<%@page import="java.io.Console"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ������</title>
<script>

function check(){
	if(!document.signUp.id.value){
		alert("���̵� �Է��ϼ���!");
		return false;
	}
	if(!document.signUp.pw.value){
		alert("��й�ȣ�� �Է��ϼ���!");
		return false;
	}
	
	if(document.signUp.pw.value != document.signUp.pwCheck.value){
		alert("��й�ȣ�� �����ϰ� �Է��ϼ���.")
		return false;
	}
	if(!document.signUp.nickname.value){
		alert("�г����� �Է��ϼ���!")
		return false;
	}
}

function checkID() {
	
}

</script>

</head>
<body>

<h1 align="center">���� �μ��� ���� Ȩ������ ȸ������ ȭ���Դϴ�.</h1>
<form action = "signUp_check.jsp" method="post" name="signUp" onsubmit="return check()">
	<input type="text" name="id" class="text" placeholder="���̵�">
	<input type="button" name="idCheck" class="text" value = "���̵� �ߺ�Ȯ��" onclick="checkID()">
	<input type="password" name="pw" class = "text" placeholder="��й�ȣ">
	<input type="password" name="pwCheck" class = "text" placeholder="��й�ȣȮ��">
	<input type="text" name = "nickname" class = "text" placeholder="�г���">
	<input type="button" name="nicknameCheck" class="text" value = "�г��� �ߺ�Ȯ��" onclick="checkNickname()">
	<input type="submit" value = "ȸ������" class = "btn_submit">
	<input type="reset" value = "���" class = "btn_submit">
</form>

</body>
</html>