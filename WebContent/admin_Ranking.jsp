<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>랭킹 수정</title>
</head>
<h1> 랭킹 목록 추가, 수정, 삭제 </h1>
<button onclick="toMain()">메인으로</button>

<script>
	function toMain(){
		location.href = "adminMainPage.jsp"
	}
</script>

<body>
<h2> 랭킹 목록 </h2>
<table width = "100%" border = "1">
       <tr>
       		<td>유저 Number</td>
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
		<td align = "center" colspan = 2><b>랭킹 정보 입력</b></td>
	</tr>
	
	<tr>
		<td align = "right">변경할 유저 number(insert시 아무 숫자나 넣기) :  </td>
		<td><input type = "text" name = "userid"></td>
	</tr>
	
	<tr>
		<td align = "right">변경할 닉네임 :  </td>
		<td><input type = "text" name = "nickname"></td>
	</tr>
	
	<tr>
		<td align = "right">변경할 점수 : </td>
		<td><input type = "text" name = "score"></td>
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