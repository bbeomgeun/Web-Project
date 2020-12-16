package com.dao;

import org.apache.ibatis.session.SqlSession;

public class Main {
	public static void main(String args[]) {

		// Mybatis 세션연결
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSessionFactory()
				.openSession(true);
		
		// Mapper 연결
		UserDao user = sqlSession.getMapper(UserDao.class);

//		// Select
//		List users = null;
//		users = user.selectList();
//		for (int i = 0; i < users.size(); i++) {
//			System.out.println("User Name : " + users.get(i)());
//		}

		// Insert
		User p = new User();
		p.setNickname("testDB");
		p.setScore(15);
		p.setDate("2020-12-16");
		user.insert(p);
		System.out.println("return key : " + p.getUserid());

//		// update
//		p.setId(14);
//		p.setName("Terry");
//		person.update(p);
//		System.out.println("return key : " + p.getId());
//
//		// Delete
//		p.setId(16);
//		person.delete(p.getId());
//		System.out.println("return key : " + p.getId());
	}
}
