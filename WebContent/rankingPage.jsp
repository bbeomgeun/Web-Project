
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>랭킹 페이지</title>
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
		<div id = "mainTop"><h1>벽돌 부수기 게임 홈페이지</h1></div>

		<header>
			<ul>
				<li><a href = "mainPage.jsp">게임 페이지</a></li>
				<li><a href = "rankingPage.jsp">랭킹 페이지</a></li>
				<li><a href="community.jsp">한줄 평 게시판</a></li>
			</ul>
			<p>
	<h1>테트리스 게임 랭킹</h1>
	<hr>

<table width = "100%" border = "1">
      <tr>
      		<td>등수</td>
            <td>닉네임</td>
            <td>점수</td>
            <td>날짜</td>
      </tr>
<%
    Class.forName("com.mysql.jdbc.Driver");
	   
  	Connection conn = DriverManager.getConnection(
 		"jdbc:mysql://localhost:3306/gamepage_db", "root", "wndgkrrmsl12!"); 
 	Statement stmt = conn.createStatement();

 	String sqlStr = "SELECT * FROM record_table ORDER BY score DESC";
 	ResultSet records = stmt.executeQuery(sqlStr);
 %>
 	<%
 	int i = 1;
 	while(records.next()) {
 		%>
 		<tr>
 			<td><%= i %></td>
	        <td><%= records.getString("nickname") %></td>
	        <td><%= records.getString("score") %></td>
	        <td><%= records.getString("dob") %></td>
   		</tr>
   		<% 
   		i++;
   		}
   		stmt.close();
		conn.close();%>
   </table>

</body>
</html>