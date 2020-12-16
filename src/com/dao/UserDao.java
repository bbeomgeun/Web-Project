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
	 
	    // myBatis - SqlSession: SQL 실행
	    // openSession(): SqlSession 얻기
	    sqlSession = sqlSessionFactory.openSession();
	 
	    try {
	        // selectList(): SELECT
	        // 파라미터: SQL 맵퍼의 네임 스페이스(com.dao.UserDao) + SQL문 ID(selectList)
	        return sqlSession.selectList("com.dao.UserDao.selectList");
	    } finally {
	        sqlSession.close();
	    }
	}

	public User selectById(String nickname) { // 특정한 행 가져오기
		sqlSession = sqlSessionFactory.openSession();
	    
		try {
	        return sqlSession.selectOne("com.dao.UserDao.selectOne", nickname);
	    } finally {
	        sqlSession.close();
	    }
	}
		
	public int insert(User user) { // 삽입
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
	
	public int update(User user) { // 업데이트
		 sqlSession = sqlSessionFactory.openSession();
		    try {
		        int count = sqlSession.update("com.dao.UserDao.update", user);
		        sqlSession.commit();
		        	return count;
		    } finally {
		        sqlSession.close();
		    }
	}
	
	public int delete(int id) { // 삭제
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
