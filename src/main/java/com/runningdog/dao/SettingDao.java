package com.runningdog.dao;

import java.util.List;

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
	public UserVo selectUser(int userNo) {
		System.out.println("SettingDao.selectUser()");
		
		UserVo selectUser = sqlSession.selectOne("setting.selectUser", userNo);
		//System.out.println(selectUser);
		
		return selectUser;
	}
	
	
	//user profile 이미지 삭제
	public int deleteUserProfile(int useNo) {
		System.out.println("SettingDao.deleteUserProfile()");
		
		int count = sqlSession.delete("setting.deleteUserProfile", useNo);
		
		return count;
	}
	
	//user profile 이미지 저장
	public int insertUserProfile(MainImageVo mainImageVo) {
		System.out.println("SettingDao.insertUserProfile()");
		
		int count = sqlSession.insert("setting.insertUserProfile", mainImageVo);
		
		return count;
	}
	
	//user 정보 수정
	public int updateUser(UserVo userVo) {
		System.out.println("SettingDao.updateUser()");
		
		int count = sqlSession.update("setting.updateUser", userVo);
		
		return count;
	}
	
	
	//동네 찾기
	public List<UserVo> selectAddressList(String keyword) {
		System.out.println("SettingDao.selectAddressList()");
		
		List<UserVo> addressList  = sqlSession.selectList("setting.selectAddressList", keyword);
		
		return addressList;
	}
	
	
	
	
}









