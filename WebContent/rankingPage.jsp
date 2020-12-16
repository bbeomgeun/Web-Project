
<%@page import="com.dao.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@page import="com.dao.MyBatisConnectionFactory"%>
	<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
	<%@page import="org.apache.ibatis.session.SqlSession"%>

 	<%@page import="java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
    SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
    SqlSession sqlSession = sqlSessionFactory.openSession();

    User user1 = new User();
    user1.setNickname("please");
    user1.setScore(25);
    user1.setDate("2020-12-17");
    
    try{
        //int cnt = sqlSession.selectOne("com.dao.UserDao.getCount");
        sqlSession.insert("com.dao.UserDao.insert", user1);
		sqlSession.commit();
        //System.out.println("��ü Cnt : " + cnt);

      /*  // ������ ��������
        HashMap hm = sqlSession.selectOne("Test.getContents") ;
        // ����Ʈ ��������
        List list = sqlSession.selectList("Test.getList") ;
        // ������ ����Ʈ ����ϱ�
        if(list.size() > 0){
            for(int i=0; i < list.size(); i++){
                HashMap rs = (HashMap)list.get(i) ;
            }
        }
        // String parameter �Ѱܼ� ���� �� ��������
        String name = "������";
        int pCnt = sqlSession.selectOne("Test.getCountP", name) ;
        // HashMap parameter �Ѱܼ� ���� �� ��������
        HashMap pHm = new HashMap();
        pHm.put("name", "ȫ�浿") ;
        pHm.put("age", "28") ;       
        HashMap pRs = sqlSession.selectOne("Test.getContentsP", pHm) ;*/
    }catch(Exception e){
        e.printStackTrace() ;
    }finally{
        sqlSession.close() ;
    }
%>
</body>
</html>