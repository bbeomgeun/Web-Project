<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    	<%@page import="java.util.Date"%>
	<%@page import="java.text.SimpleDateFormat"%>

<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="comment" class="javabean.UserCommentBean" scope = "page"></jsp:useBean>
<jsp:setProperty name = "comment" property = "*" />

 <%
	 String pattern = "yyyy-MM-dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);	
	String date = simpleDateFormat.format(new Date());
	
	Class.forName("com.mysql.jdbc.Driver");

      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/gamepage_db??useUnicode=true&characterEncoding=UTF-8", "root", "wndgkrrmsl12!"); 

      String sqlStr = "INSERT INTO comment_table(userid, nickname, comment, dob) VALUES (null,?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		//pstmt.setInt(1, comment.getId() );
		pstmt.setString(1, comment.getNickname());
		pstmt.setString(2, comment.getComment());
		pstmt.setString(3,date);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
      %>
       <script>
		alert('한줄 코멘트가 기록되었습니다.');
		location.href = "communityPage.jsp";
	</script>
</body>
</html>