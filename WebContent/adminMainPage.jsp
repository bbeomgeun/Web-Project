<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������</title>
</head>
<body>
	<%String sessionId = (String)session.getAttribute("sessionID");
	String sessionAdminName = (String)session.getAttribute("sessionAdminName");%>
<h1> ������ ������.</h1>
<h2> ������ �̸� : <%= sessionAdminName %> ��</h2>
<hr>
<h2> ������ ��� </h2>
<hr>
	<ol>
		<li><a href = "admin_User.jsp">���� ��� �߰� ���� ����</a></li>
		<li><a href = "admin_Ranking.jsp">��ŷ ���� ��� �߰� ���� ����</a></li>
		<li><a href="admin_Comment.jsp">���� �� �߰� ���� ����</a></li>
	</ol>
	
<hr>
<h2> ������ ���� ���� </h2>
<!-- ���̵� ���� : <input type="text"

UPDATE `gamepage_db`.`admin_table` SET `ID` = 'testere' WHERE (`userid` = '2');
 -->

</body>
</html>