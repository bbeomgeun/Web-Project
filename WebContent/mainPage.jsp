<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����μ��� ���� ������</title>
<style>
	body{
		text-align: center;
		color: black;
		background-color: black;
		width : 100%;
		height : 100%;
		margin : 0 auto;
	}
	#board{
		background-color: white;
		margin : 0 auto;
		height : 1300px;
		width : 1200px;
	}
	
	div#wrapper{
		width:90%;
		text-align : left;
		min-height : 300px;
		margin : 0 auto;
	}
	
	header {
		height : 40%;
		background-color: WHITE;
		border-top:2px solid black;
		border-bottom : 2px solid black;
	}
	
	div header ul li{
		list-style: none;
		float : left;
		padding-left : 30px;
		padding-right : 30px;
		color : black;
	}
	
</style>
</head>
<body>
<div id = "board">
	<div id="wrapper">
	<!-- ��� ���� -->
	<div id = "mainTop">���� �μ��� ���� Ȩ������</div>
	<h4>ID = <%=session.getAttribute("sessionID") %></h4>
	<header>
		<form method="post" action="logout.jsp"> session test��
			<%=session.getAttribute("sessionNickname") %>�� ȯ���մϴ�
			<input type="submit" value="�α׾ƿ�" />
		</form>
		<ul>
		<li><a href = "mainPage">���� ������</a></li>
		<li><a href = "ranking.jsp">��ŷ ������</a></li>
		<li><a href="community.jsp">���� �� �Խ���</a></li>
		</ul>
	</header>
	
	</div>
</div>


</body>
</html>