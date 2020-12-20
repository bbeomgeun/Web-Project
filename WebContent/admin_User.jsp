<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>유저 수정</title>
</head>
<h1> 유저 목록 추가, 수정, 삭제 </h1>
<body>
<h2> 유저 목록 </h2>
<table width = "100%" border = "1">
      <tr>
      		<td>유저 number</td>
            <td>ID</td>
            <td>PW</td>
            <td>날짜</td>
            <td>닉네임</td>
      </tr>
<%
    Class.forName("com.mysql.jdbc.Driver");
	   
  	Connection conn = DriverManager.getConnection(
 		"jdbc:mysql://localhost:3306/gamepage_db", "root", "wndgkrrmsl12!"); 
 	Statement stmt = conn.createStatement();

 	String sqlStr = "SELECT * FROM user_table";
 	ResultSet comments = stmt.executeQuery(sqlStr);
 %>
 	<%
 	while(comments.next()) {
 		%>
 		<tr>
 			<td><%= comments.getString("userid") %></td>
	        <td><%= comments.getString("ID") %></td>
	        <td><%= comments.getString("PW") %></td>
	        <td><%= comments.getString("dob") %></td>
	         <td><%= comments.getString("nickname") %></td>
   		</tr>
   		<% 
 	}
   		stmt.close();
		conn.close();%>
   </table>
   
   <hr>
   
  <form name = "student" method = "post" action = "admin_User_Check.jsp">
<table border="1">
	<tr bgcolor = "yellow">
		<td align = "center" colspan = 2><b>유저 정보 입력</b></td>
	</tr>
	
	<tr>
		<td align = "right">변경할 유저 number : </td>
		<td><input type = "text" name = "userid"></td>
	</tr>
	
	<tr>
		<td align = "right">변경할 ID :  </td>
		<td><input type = "text" name = "ID"></td>
	</tr>
	
	<tr>
		<td align = "right">변경할 PW : </td>
		<td><input type = "text" name = "PW"></td>
	</tr>
	
	<tr>
		<td align = "right">변경할 닉네임 :  </td>
		<td><input type = "text" name = "nickname"></td>
	</tr>
	
	<tr>
		<td align = "right">추가, 수정, 삭제 </td>
		<td>
			<select name = "database">
				<option SELECTED value = "insert">insert</option>
				<option value="update">update</option>
				<option value="delete">delete</option>
			</select>
		</td>
	</tr>
</table>
	<input type = "submit" value = "수정하기">
	<input type="reset" value = "다시쓰기">

</form>
   
</body>
</html>