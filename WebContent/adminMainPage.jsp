<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지</title>
</head>
<body>
	<%String sessionId = (String)session.getAttribute("sessionID");
	String sessionAdminName = (String)session.getAttribute("sessionAdminName");%>
<h1> 관리자 페이지.</h1>
	<form method="post" action="logout.jsp"> 
		관리자 이름 : <%=sessionAdminName %>님 환영합니다
		<input type="submit" value="로그아웃" />
	</form>
<hr>
<h2> 관리자 기능 </h2>
<hr>
	<ol>
		<li><a href = "admin_User.jsp">유저 목록 추가 삭제 수정</a></li>
		<li><a href = "admin_Ranking.jsp">랭킹 유저 목록 추가 삭제 수정</a></li>
		<li><a href="admin_Comment.jsp">한줄 평 추가 삭제 수정</a></li>
	</ol>
	
<hr>

</body>
</html>