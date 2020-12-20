<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	    <%@page import="com.dao.User"%>
    <%@page import="com.dao.MyBatisConnectionFactory"%>
	<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
	<%@page import="org.apache.ibatis.session.SqlSession"%>
	<%@page import="java.util.Date"%>
	<%@page import="java.text.SimpleDateFormat"%>
	

	<%
    SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
    SqlSession sqlSession = sqlSessionFactory.openSession();
   
	int userid = Integer.parseInt(request.getParameter("userid"));
	String nickname = request.getParameter("nickname");
	int score = Integer.parseInt(request.getParameter("score"));
	
	String database = request.getParameter("database");
	String pattern = "yyyy-MM-dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	String date = simpleDateFormat.format(new Date());

	User recordUser = new User();
    recordUser.setNickname(nickname);
    recordUser.setScore(score);
    recordUser.setDate(date);
    
	if(database.equals("insert")){
	    sqlSession.insert("com.dao.UserDao.insert", recordUser);
	    sqlSession.commit();
	    sqlSession.close();
	}
	else if(database.equals("update")){
		sqlSession.update("com.dao.UserDao.update", recordUser);
		sqlSession.commit();
		sqlSession.close();
	}
	else if(database.equals("delete")){
		sqlSession.delete("com.dao.UserDao.delete", userid);
		sqlSession.commit();
		sqlSession.close();
	}
    %>
    
   <script>
		alert('데이터베이스가 수정되었습니다.');
		location.href = "admin_Ranking.jsp";
	</script>