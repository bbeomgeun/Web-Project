<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		
		String date = simpleDateFormat.format(new Date());
		out.println(id + pw + nickname);
	%>

	<%
	 	Class.forName("com.mysql.jdbc.Driver");
	   
	  	Connection conn = DriverManager.getConnection(
	 		"jdbc:mysql://localhost:3306/gamepage_db", "root", "wndgkrrmsl12!"); 
	 	Statement stmt = conn.createStatement();
	
	 	String sqlStr = "SELECT ID FROM user_table";
	 	ResultSet rsetID = stmt.executeQuery(sqlStr);
	 	boolean checkID = true;
	 	while(rsetID.next()){
	 		String dbID = rsetID.getString("ID");
	 		out.println(dbID);
	 		if(dbID.equals(id)){
	 			out.println("<script> alert('아이디가 중복되었습니다.'); history.back(); </script>");
	 			checkID = false;
			   	stmt.close();
			    conn.close();
	 			return;
	 		}
	 	}
	 	
	 	String sqlStr2 = "SELECT nickname FROM user_table";
	 	ResultSet rsetNickName = stmt.executeQuery(sqlStr2);
	 	boolean checkNickName = true;
	 	while(rsetNickName.next()){
	 		String dbNickName = rsetNickName.getString("nickname");
	 		out.println(dbNickName);
	 		if(dbNickName.equals(nickname)){
	 			out.println("<script> alert('닉네임이 중복되었습니다.'); history.back(); </script>");
	 			checkNickName = false;
			   	stmt.close();
			    conn.close();
	 			return;
	 		}
	 	}
	 	
	 	if(checkID == true && checkNickName == true){
	 		String sqlStr3 = "INSERT INTO user_table(ID, PW, dob, nickname) VALUES (?,?,?,?)";
	 		
	 		PreparedStatement pstmt = conn.prepareStatement(sqlStr3);
	 		pstmt.setString(1, id);
	 		pstmt.setString(2, pw);
	 		pstmt.setString(3, date);
	 		pstmt.setString(4, nickname);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}
		%>
		<script>
		alert('회원가입이 완료되었습니다.');
		location.href = "loginPage.jsp";
		</script>