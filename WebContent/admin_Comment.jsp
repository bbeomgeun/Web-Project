<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ڸ�Ʈ ����</title>
</head>
<h1> �ڸ�Ʈ ��� �߰�, ����, ���� </h1>
<button onclick="toMain()">��������</button>

<script>
	function toMain(){
		location.href = "adminMainPage.jsp"
	}
</script>

<body>
<h2> �ڸ�Ʈ ��� </h2>
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
   
   <hr>
   
  <form name = "ranking" method = "post" action = "admin_Comment_Check.jsp">
<table border="1">
	<tr bgcolor = "yellow">
		<td align = "center" colspan = 2><b>��� ���� �Է�</b></td>
	</tr>
	
	<tr>
		<td align = "right">������ ���� number(insert�� �ƹ� ���ڳ� �ֱ�) :  </td>
		<td><input type = "text" name = "userid"></td>
	</tr>
	
	<tr>
		<td align = "right">������ �г��� :  </td>
		<td><input type = "text" name = "nickname"></td>
	</tr>
	
	<tr>
		<td align = "right">������ �ڸ�Ʈ : </td>
		<td><input type = "text" name = "comment"></td>
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