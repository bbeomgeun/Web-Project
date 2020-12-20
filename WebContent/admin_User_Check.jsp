<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="java.sql.*" %>
        <%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

    <%
    	int userid = Integer.parseInt(request.getParameter("userid"));
  		String id = request.getParameter("ID");
    	String pw = request.getParameter("PW");
    	String nickname = request.getParameter("nickname");
    	String database = request.getParameter("database");
    	String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
    %>
    
    <%
    Class.forName("com.mysql.jdbc.Driver");
	   
  	Connection conn = DriverManager.getConnection(
 		"jdbc:mysql://localhost:3306/gamepage_db", "root", "wndgkrrmsl12!"); 
 	Statement stmt = conn.createStatement();

	if(database.equals("insert")){
		String sqlStr = "INSERT INTO user_table(ID, PW, dob, nickname) VALUES (?,?,?,?)";
 		
 		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
 		pstmt.setString(1, id);
 		pstmt.setString(2, pw);
 		pstmt.setString(3, date);
 		pstmt.setString(4, nickname);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	else if(database.equals("update")){
		String sqlStr = "UPDATE user_table SET ID=?, PW=?, nickname=? WHERE userid = ?;";

        PreparedStatement  pstmt = conn.prepareStatement(sqlStr);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            pstmt.setString(3, nickname);
            pstmt.setInt(4, userid);
            pstmt.executeUpdate();
    		pstmt.close();
    		conn.close();
	}
	else if(database.equals("delete")){
		 String sqlStr = "DELETE from user_table WHERE userid = ?;";

	     PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	     	pstmt.setInt(1, userid);
	        pstmt.executeUpdate();
    		pstmt.close();
    		conn.close();
	}
	
	%>
	 <script>
		alert('데이터베이스가 수정되었습니다.');
		location.href = "admin_User.jsp";
	</script>

