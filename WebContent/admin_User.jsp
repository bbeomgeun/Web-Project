<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
</head>
<h1> ���� ��� �߰�, ����, ���� </h1>
<body>
<h2> ���� ��� </h2>
<table width = "100%" border = "1">
      <tr>
      		<td>���� number</td>
            <td>ID</td>
            <td>PW</td>
            <td>��¥</td>
            <td>�г���</td>
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
		<td align = "center" colspan = 2><b>���� ���� �Է�</b></td>
	</tr>
	
	<tr>
		<td align = "right">������ ���� number : </td>
		<td><input type = "text" name = "userid"></td>
	</tr>
	
	<tr>
		<td align = "right">������ ID :  </td>
		<td><input type = "text" name = "ID"></td>
	</tr>
	
	<tr>
		<td align = "right">������ PW : </td>
		<td><input type = "text" name = "PW"></td>
	</tr>
	
	<tr>
		<td align = "right">������ �г��� :  </td>
		<td><input type = "text" name = "nickname"></td>
	</tr>
	
	<tr>
		<td align = "right">�߰�, ����, ���� </td>
		<td>
			<select name = "database">
				<option SELECTED value = "insert">insert</option>
				<option value="update">update</option>
				<option value="delete">delete</option>
			</select>
		</td>
	</tr>
</table>
	<input type = "submit" value = "�����ϱ�">
	<input type="reset" value = "�ٽþ���">

</form>
   
</body>
</html>