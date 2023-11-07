package com.runningdog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.UserVo;


@Repository
public class SettingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//유저 정보
	public UserVo selectUser(String id) {
		System.out.println("SettingDao.selectUser()");
		
		UserVo count = sqlSession.selectOne("setting.selectUser", id);
		//System.out.println(count);
		
		return count;
	}
	
}









