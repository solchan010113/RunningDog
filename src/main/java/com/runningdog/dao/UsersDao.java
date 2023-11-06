package com.runningdog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.UsersVo;


@Repository
public class UsersDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//회원가입
	public int insertUser(UsersVo usersVo) {
		System.out.println("UsersDao.insertUser()");
		
		int count = sqlSession.insert("users.insertUser", usersVo);
		//System.out.println(count);
		
		return count;
	}
	
	//유저 1명 찾아오기 (로그인)
	public UsersVo selectOneUser(UsersVo usersVo) {
		System.out.println("UsersDao.selectOneUser()");
		
		UsersVo authUser = sqlSession.selectOne("users.selectOneUser", usersVo);
		
		return authUser;
	}
	
}



