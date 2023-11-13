package com.runningdog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.DogListVo;
import com.runningdog.vo.MainImageVo;
import com.runningdog.vo.UserVo;


@Repository
public class SettingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//유저 정보 (이미지 제외)
	public UserVo selectUser(int userNo) {
		System.out.println("SettingDao.selectUser()");
		
		UserVo selectUser = sqlSession.selectOne("setting.selectUser", userNo);
		//System.out.println(selectUser);
		
		return selectUser;
	}
	
	//이미지 한 개 가져오기
	public String selectImg(MainImageVo mainImageVo) {
		System.out.println("SettingDao.selectImg()");
		
		String saveName = sqlSession.selectOne("setting.selectImg", mainImageVo);
		//System.out.println(selectUser);
		
		return saveName;
	}
	
	// 이미지 삭제
	public int deleteImg(MainImageVo mainImageVo) {
		System.out.println("SettingDao.deleteImg()");
		
		int count = sqlSession.delete("setting.deleteImg", mainImageVo);
		
		return count;
	}
	
	//이미지 저장
	public int insertImg(MainImageVo mainImageVo) {
		System.out.println("SettingDao.insertImg()");
		
		int count = sqlSession.insert("setting.insertImg", mainImageVo);
		
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
	
	
	
/*	강아지	*/
	
	//강아지 카드 리스트
	public List<DogListVo> selectDogList(int userNo) {
		System.out.println("SettingDao.selectDogList()");
		
		List<DogListVo> dogList = sqlSession.selectList("setting.selectDogList", userNo);
		
		return dogList;
	}

	//강아지 등록
	public int insertDog(DogListVo dogListVo) {
		System.out.println("SettingDao.insertDog()");
		
		System.out.println(dogListVo.getDogNo());
		int count = sqlSession.insert("setting.insertDog", dogListVo);
		//selectkey로 추가한 값이 나옴
		System.out.println(dogListVo.getDogNo());
		
		return count;
	}
	
	//강아지 수정
	public DogListVo selectDog(int dogNo) {
		System.out.println("SettingDao.selectDog()");

		DogListVo dogVo = sqlSession.selectOne("setting.selectDog", dogNo);
		
		return dogVo;
	}
	
	
}






