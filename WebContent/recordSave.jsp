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
    String pattern = "yyyy-MM-dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);	
	String date = simpleDateFormat.format(new Date());
	
	String nickName = request.getParameter("nickName");
	int score = Integer.parseInt(request.getParameter("score"));
	
    User recordUser = new User();
    recordUser.setNickname(nickName);
    recordUser.setScore(score);
    recordUser.setDate(date);
    
    sqlSession.insert("com.dao.UserDao.insert", recordUser);
    sqlSession.commit();
    %>
    
    <script>
		alert('����� ��ŷ�� ����Ǿ����ϴ�.');
		location.href = "rankingPage.jsp";
	</script>