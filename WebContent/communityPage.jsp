<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�͸� ���� �Խ���</title>
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
	<div id = "mainTop"><h1>���� �μ��� ���� Ȩ������</h1>
	<header>
<ul>
	<li><a href = "mainPage.jsp">���� ������</a></li>
	<li><a href = "rankingPage.jsp">��ŷ ������</a></li>
	<li><a href="communityPage.jsp">���� �� �Խ���</a></li>
</ul>

<h1>��Ʈ���� ���� �ڸ�Ʈ ������</h1>

<form method="post" action = "commentSave.jsp" name = "commentForm" onsubmit="check()">
	<input type="text" name="nickname"  placeholder="�͸� �г���">
	<input type="text" name="comment" placeholder="�ڸ�Ʈ �ۼ�">
	<input type="submit" value = "�� �ۼ�"> 
</form>


<script>
function check(){
	if(!document.commentForm.nickname.value){
		alert("�͸� �г����� �Է��ϼ���!");
		return false;
	}
	if(!document.commentForm.commentValue.value){
		alert("�� ������ �Է��ϼ���!");
		return false;
	}
}
</script>

<hr>

<table width = "100%" border = "1">
      <tr>
      		<td>�� ��ȣ</td>
            <td>�͸� �г���</td>
            <td>���� �ڸ�Ʈ</td>
            <td>��¥</td>
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