<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ŷ ����</title>
</head>
<h1> ��ŷ ��� �߰�, ����, ���� </h1>
<button onclick="toMain()">��������</button>

<script>
	function toMain(){
		location.href = "adminMainPage.jsp"
	}
</script>

<body>
<h2> ��ŷ ��� </h2>
<table width = "100%" border = "1">
       <tr>
       		<td>���� Number</td>
      		<td>���</td>
            <td>�г���</td>
            <td>����</td>
            <td>��¥</td>
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
 			<td><%= records.getInt("userid") %></td>
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
   
   <hr>
   
  <form name = "ranking" method = "post" action = "admin_Ranking_Check.jsp">
<table border="1">
	<tr bgcolor = "yellow">
		<td align = "center" colspan = 2><b>��ŷ ���� �Է�</b></td>
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
		<td align = "right">������ ���� : </td>
		<td><input type = "text" name = "score"></td>
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