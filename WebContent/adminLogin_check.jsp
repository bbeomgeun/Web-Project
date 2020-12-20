<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="java.sql.*" %>

    <%
  		String id = request.getParameter("ID");
    	String pw = request.getParameter("PW");
    %>
    
    <%
    Class.forName("com.mysql.jdbc.Driver");
	   
  	Connection conn = DriverManager.getConnection(
 		"jdbc:mysql://localhost:3306/gamepage_db", "root", "wndgkrrmsl12!"); 
 	Statement stmt = conn.createStatement();

 	String sqlStr = "SELECT ID FROM admin_table";
 	ResultSet rsetID = stmt.executeQuery(sqlStr);
 	boolean checkID = false;
 	boolean checkPW = false;
 	String adminName = "";
 	while(rsetID.next()){
 		String dbID = rsetID.getString("ID");
 		
 		if(dbID.equals(id)){ // 일치하는 아이디를 찾은 경우
 			checkID = true;
 			String sqlStr2 = "SELECT PW, adminName FROM admin_table WHERE ID = ?"; // 아이디에 해당하는 비밀번호를 뽑아온다.
 			PreparedStatement pstmt = conn.prepareStatement(sqlStr2);
	 		pstmt.setString(1, id);
	 		ResultSet dbValue = pstmt.executeQuery();
	 		if(dbValue.next()){
		 		if(dbValue.getString("PW").equals(pw)){
		 			checkPW = true;
		 			adminName = dbValue.getString("adminName");
		 			pstmt.close();
		 			//return 넣었다가 로그인이 된 경우는 아예 끝나버림 (밑에 조건문에 안들어감)
	 			}
	 		}
 		}
 	}

 	if(checkID == false){ // 아이디가 일치하지 않은 경우
 		out.println("<script> alert('해당 아이디가 없습니다.'); history.back(); </script>");
 	}
 	else if(checkID == true && checkPW == false) // 비밀번호 일치 오류
 		out.println("<script> alert('비밀번호 오류입니다.'); history.back(); </script>");
 	else if(checkID == true && checkPW == true){ // 로그인 완료
 		out.println("<script> alert('로그인이 완료되었습니다.'); </script>");
 		session.setAttribute("sessionID", id);
		session.setAttribute("sessionAdminName", adminName);  // session에 nickname저장
		response.sendRedirect("adminMainPage.jsp");
 	}
 	conn.close();
 	stmt.close();
    %>
