<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�͸� ���� �Խ���</title>
</head>
<body>
<ul>
	<li><a href = "mainPage.jsp">���� ������</a></li>
	<li><a href = "rankingPage.jsp">��ŷ ������</a></li>
	<li><a href="communityPage.jsp">���� �� �Խ���</a></li>
</ul>

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

</body>
</html>