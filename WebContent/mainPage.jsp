<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>벽돌부수기 메인 페이지</title>
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
	<!-- 헤더 시작 -->
	<div id = "mainTop">벽돌 부수기 게임 홈페이지</div>
	<h4>ID = <%=session.getAttribute("sessionID") %></h4>
	<header>
		<form method="post" action="logout.jsp"> session test용
			<%=session.getAttribute("sessionNickname") %>님 환영합니다
			<input type="submit" value="로그아웃" />
		</form>
		<ul>
		<li><a href = "mainPage">게임 페이지</a></li>
		<li><a href = "ranking.jsp">랭킹 페이지</a></li>
		<li><a href="community.jsp">한줄 평 게시판</a></li>
		</ul>
	</header>
	
	</div>
</div>


</body>
</html>