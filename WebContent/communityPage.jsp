<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>익명 게임 게시판</title>
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
	
	
	}
</style>
</head>
<body>
<div id = "board">
	<div id="wrapper">
	<div id = "mainTop"><h1>벽돌 부수기 게임 홈페이지</h1>
	<header>
<ul>
	<li><a href = "mainPage.jsp">게임 페이지</a></li>
	<li><a href = "rankingPage.jsp">랭킹 페이지</a></li>
	<li><a href="communityPage.jsp">한줄 평 게시판</a></li>
</ul>

<h1>테트리스 한줄 코멘트 페이지</h1>

<form method="post" action = "commentSave.jsp" name = "commentForm" onsubmit="check()">
	<input type="text" name="nickname"  placeholder="익명 닉네임">
	<input type="text" name="comment" placeholder="코멘트 작성">
	<input type="submit" value = "글 작성"> 
</form>


<script>
function check(){
	if(!document.commentForm.nickname.value){
		alert("익명 닉네임을 입력하세요!");
		return false;
	}
	if(!document.commentForm.commentValue.value){
		alert("글 내용을 입력하세요!");
		return false;
	}
}
</script>

<hr>

<table width = "100%" border = "1">
      <tr>
      		<td>글 번호</td>
            <td>익명 닉네임</td>
            <td>한줄 코멘트</td>
            <td>날짜</td>
      </tr>
<%
    Class.forName("com.mysql.jdbc.Driver");
	   
  	Connection conn = DriverManager.getConnection(
 		"jdbc:mysql://localhost:3306/gamepage_db", "root", "wndgkrrmsl12!"); 
 	Statement stmt = conn.createStatement();

 	String sqlStr = "SELECT * FROM comment_table";
 	ResultSet comments = stmt.executeQuery(sqlStr);
 %>
 	<%
 	while(comments.next()) {
 		%>
 		<tr>
 			<td><%= comments.getString("userid") %></td>
	        <td><%= comments.getString("nickname") %></td>
	        <td><%= comments.getString("comment") %></td>
	        <td><%= comments.getString("dob") %></td>
   		</tr>
   		<% 
 	}
   		stmt.close();
		conn.close();%>
   </table>
</header>
	</div>
</div>
</body>
</html>