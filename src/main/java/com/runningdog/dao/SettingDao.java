package com.runningdog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.MainImageVo;
import com.runningdog.vo.UserVo;


@Repository
public class SettingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//유저 정보
	public UserVo selectUser(UserVo userVo) {
		System.out.println("SettingDao.selectUser()");
		
		UserVo selectUser = sqlSession.selectOne("setting.selectUser", userVo);
		//System.out.println(selectUser);
		
		return selectUser;
	}
	
	
	//id로 no 찾기
	public int selectUserNoWithId(String id) {
		System.out.println("SettingDao.selectUserNoWithId()");
		
		int userNo = sqlSession.selectOne("setting.selectUserNoWithId", id);
		
		return userNo;
	}
	
	
	//user profile 삭제
	public int deleteUserProfile(int useNo) {
		System.out.println("SettingDao.deleteUserProfile()");
		
		int count = sqlSession.delete("setting.deleteUserProfile", useNo);
		
		return count;
	}
	
	//user profile 저장
	public int insertUserProfile(MainImageVo mainImageVo) {
		System.out.println("SettingDao.insertUserProfile()");
		
		int count = sqlSession.insert("setting.insertUserProfile", mainImageVo);
		
		return count;
	}
	
	
}









