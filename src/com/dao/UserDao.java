package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.myBatis.MyBatisConnectionFactory;


public class UserDao {
	private SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
	private SqlSession sqlSession;
	
	
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
	    this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public List<User> selectList() throws SQLException {
	 
	    // myBatis - SqlSession: SQL ����
	    // openSession(): SqlSession ���
	    sqlSession = sqlSessionFactory.openSession();
	 
	    try {
	        // selectList(): SELECT
	        // �Ķ����: SQL ������ ���� �����̽�(com.dao.UserDao) + SQL�� ID(selectList)
	        return sqlSession.selectList("com.dao.UserDao.selectList");
	    } finally {
	        sqlSession.close();
	    }
	}

	public User selectById(String nickname) { // Ư���� �� ��������
		sqlSession = sqlSessionFactory.openSession();
	    
		try {
	        return sqlSession.selectOne("com.dao.UserDao.selectOne", nickname);
	    } finally {
	        sqlSession.close();
	    }
	}
		
	public int insert(User user) { // ����
		sqlSession = sqlSessionFactory.openSession();
		 
	    try {
	        // insert(): INSERT
	        int count = sqlSession.insert("com.dao.UserDao.insert", user);
	        sqlSession.commit();
	 
	        return count;
	    } finally {
	        sqlSession.close();
	    }
	
	}
	
	public int update(User user) { // ������Ʈ
		 sqlSession = sqlSessionFactory.openSession();
		    try {
		        int count = sqlSession.update("com.dao.UserDao.update", user);
		        sqlSession.commit();
		        	return count;
		    } finally {
		        sqlSession.close();
		    }
	}
	
	public int delete(int id) { // ����
		 sqlSession = sqlSessionFactory.openSession();
		    try {
		        int count = sqlSession.delete("com.dao.UserDao.delete", id);
		        sqlSession.commit();
		        return count;
		    } finally {
		        sqlSession.close();
		    }
	}
}
