<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    	<%@page import="java.util.Date"%>
	<%@page import="java.text.SimpleDateFormat"%>

<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="comment" class="javabean.UserCommentBean" scope = "page"></jsp:useBean>
<jsp:setProperty name = "comment" property = "*" />

    <%
    	String database = request.getParameter("database");
    	String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
    %>
    
    <%
    
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/gamepage_db??useUnicode=true&characterEncoding=UTF-8", "root", "wndgkrrmsl12!"); 
 	Statement stmt = conn.createStatement();

	if(database.equals("insert")){
		String sqlStr = "INSERT INTO comment_table(userid, nickname, comment, dob) VALUES (null,?,?,?)";
 		
 		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
 		pstmt.setString(1, comment.getNickname());
		pstmt.setString(2, comment.getComment());
		pstmt.setString(3,date);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	else if(database.equals("update")){
		String sqlStr = "UPDATE comment_table SET nickname=?, comment=? WHERE userid = ?;";

        PreparedStatement  pstmt = conn.prepareStatement(sqlStr);
            pstmt.setString(1, comment.getNickname());
            pstmt.setString(2, comment.getComment());
            pstmt.setInt(3, comment.getUserid());
            pstmt.executeUpdate();
    		pstmt.close();
    		conn.close();
	}
	else if(database.equals("delete")){
		 String sqlStr = "DELETE from comment_table WHERE userid = ?;";

	     PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	     	pstmt.setInt(1, comment.getUserid());
	        pstmt.executeUpdate();
    		pstmt.close();
    		conn.close();
	}
	
	%>
	 <script>
		alert('�����ͺ��̽��� �����Ǿ����ϴ�.');
		location.href = "admin_Comment.jsp";
	</script>

