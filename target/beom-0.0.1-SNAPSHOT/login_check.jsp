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

 	String sqlStr = "SELECT ID FROM user_table";
 	ResultSet rsetID = stmt.executeQuery(sqlStr);
 	boolean checkID = false;
 	boolean checkPW = false;
 	String nickname = "";
 	while(rsetID.next()){
 		String dbID = rsetID.getString("ID");
 		//out.println(dbID);
 		
 		//���� �α��� �Ϸ�� �ؿ� �۵� X
 		
 		
 		if(dbID.equals(id)){ // ��ġ�ϴ� ���̵� ã�� ���
 			checkID = true;
 			String sqlStr2 = "SELECT PW, nickname FROM user_table WHERE ID = ?"; // ���̵� �ش��ϴ� ��й�ȣ�� �̾ƿ´�.
 			PreparedStatement pstmt = conn.prepareStatement(sqlStr2);
	 		pstmt.setString(1, id);
	 		ResultSet dbValue = pstmt.executeQuery();
	 		if(dbValue.next()){
	 			//out.println(dbValue.getString("PW"));
	 			//out.println(dbValue.getString("nickname"));
		 		if(dbValue.getString("PW").equals(pw)){
		 			checkPW = true;
		 			nickname = dbValue.getString("nickname");
		 			pstmt.close();
		 			//return �־��ٰ� �α����� �� ���� �ƿ� �������� (�ؿ� ���ǹ��� �ȵ�)
	 			}
	 		}
 		}
 	}

 	if(checkID == false){ // ���̵� ��ġ���� ���� ���
 		out.println("<script> alert('�ش� ���̵� �����ϴ�.'); history.back(); </script>");
 	}
 	else if(checkID == true && checkPW == false) // ��й�ȣ ��ġ ����
 		out.println("<script> alert('��й�ȣ �����Դϴ�.'); history.back(); </script>");
 	else if(checkID == true && checkPW == true){ // �α��� �Ϸ�
 		out.println("<script> alert('�α����� �Ϸ�Ǿ����ϴ�.'); </script>");
 		session.setAttribute("sessionID", id);
		session.setAttribute("sessionNickname", nickname);  // session�� nickname����
		response.sendRedirect("mainPage.jsp");
 	}
 	conn.close();
 	stmt.close();
    %>
