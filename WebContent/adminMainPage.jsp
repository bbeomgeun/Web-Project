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
	<form method="post" action="logout.jsp"> 
		������ �̸� : <%=sessionAdminName %>�� ȯ���մϴ�
		<input type="submit" value="�α׾ƿ�" />
	</form>
<hr>
<h2> ������ ��� </h2>
<hr>
	<ol>
		<li><a href = "admin_User.jsp">���� ��� �߰� ���� ����</a></li>
		<li><a href = "admin_Ranking.jsp">��ŷ ���� ��� �߰� ���� ����</a></li>
		<li><a href="admin_Comment.jsp">���� �� �߰� ���� ����</a></li>
	</ol>
	
<hr>

</body>
</html>