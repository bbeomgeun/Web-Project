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
 		
 		if(dbID.equals(id)){ // ��ġ�ϴ� ���̵� ã�� ���
 			checkID = true;
 			String sqlStr2 = "SELECT PW, adminName FROM admin_table WHERE ID = ?"; // ���̵� �ش��ϴ� ��й�ȣ�� �̾ƿ´�.
 			PreparedStatement pstmt = conn.prepareStatement(sqlStr2);
	 		pstmt.setString(1, id);
	 		ResultSet dbValue = pstmt.executeQuery();
	 		if(dbValue.next()){
		 		if(dbValue.getString("PW").equals(pw)){
		 			checkPW = true;
		 			adminName = dbValue.getString("adminName");
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
		session.setAttribute("sessionAdminName", adminName);  // session�� nickname����
		response.sendRedirect("adminMainPage.jsp");
 	}
 	conn.close();
 	stmt.close();
    %>
