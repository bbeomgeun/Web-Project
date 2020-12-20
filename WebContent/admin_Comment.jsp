<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>코멘트 수정</title>
</head>
<h1> 코멘트 목록 추가, 수정, 삭제 </h1>
<button onclick="toMain()">메인으로</button>

<script>
	function toMain(){
		location.href = "adminMainPage.jsp"
	}
</script>

<body>
<h2> 코멘트 목록 </h2>
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
   
   <hr>
   
  <form name = "ranking" method = "post" action = "admin_Comment_Check.jsp">
<table border="1">
	<tr bgcolor = "yellow">
		<td align = "center" colspan = 2><b>댓글 정보 입력</b></td>
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
		<td align = "right">변경할 코멘트 : </td>
		<td><input type = "text" name = "comment"></td>
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