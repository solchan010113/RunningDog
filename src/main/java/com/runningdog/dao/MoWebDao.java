package com.runningdog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.ImagesVo;
import com.runningdog.vo.LocationVo;
import com.runningdog.vo.MoDogVo;
import com.runningdog.vo.MoTrailVo;
import com.runningdog.vo.MoWalkLogVo;
import com.runningdog.vo.MoWalkedDogVo;
import com.runningdog.vo.MotrailUsedVo;
import com.runningdog.vo.UseTrailVo;
import com.runningdog.vo.UserVo;
import com.runningdog.vo.XYVo;

@Repository
public class MoWebDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//유저 1명 찾아오기 (로그인)
	public UserVo selectOneUser(UserVo userVo) {
		System.out.println("다오 모바일웹 로그인");	
		System.out.println("다오 "+userVo);
		UserVo authUser = sqlSession.selectOne("walkLog.selectOneUser", userVo);	
		System.out.println("다오 "+authUser);
		return authUser;
	}
	
	// 동네번호 검색하기
	public int locationSelect(LocationVo locationVo){
		System.out.println("다오 동네번호로 검색하기");			
		int locationNo = sqlSession.selectOne("walkLog.locationSelect", locationVo);	
		return locationNo;
	}
	
	// 맵 산책로 불러오기 (동네전부)
	public List<UseTrailVo> mapTrailSelect(int locationNo){
		System.out.println("다오 산책로 검색하기");	
		System.out.println(locationNo);
		return sqlSession.selectList("walkLog.mapTrailSelect", locationNo);
	}	
	// 기록 산책로 불러오기 (3개)
	public List<UseTrailVo> threeTrailSelect(XYVo xyVo){
		System.out.println("다오 산책로 3개");	
		List<UseTrailVo> trailList = sqlSession.selectList("walkLog.threeTrailSelect" , xyVo);
		System.out.println("다오 산책로 3개 결과" + trailList);	
		return trailList;
	}	
	
	// 산책로 이용자 업데이트
	public void trailCount(MotrailUsedVo motrailUsedVo){
		System.out.println("산책로 이용자 카운트");	
		System.out.println(motrailUsedVo);
		sqlSession.insert("walkLog.trailCount",motrailUsedVo);
	}	
	
	
	// 기록 산책로 불러오기 (3개)
	public List<UseTrailVo> trailSelect(){
		System.out.println("@Dao");		
		return sqlSession.selectList("walkLog.endTrailSelect");
	}	
	
	
	
	// (2) 강아지정보 가져오기
	public List<MoDogVo> dogSelect(int userNo){
		System.out.println("다오 강아지가져오기");	
		System.out.println("다오 아이디 "+userNo);	
		List<MoDogVo> dogList = sqlSession.selectList("walkLog.dogSelect", userNo);
		System.out.println(dogList);	
		return dogList;
	}
	
	// (3) 산책기록하기
	public void walkLogInsert(MoWalkLogVo moWalkLogVo){
		System.out.println("다오 산책기록하기");
		moWalkLogVo.setMeetingNo(0); // 모임번호
		moWalkLogVo.setStatus('T');	
		moWalkLogVo.setStartTime("2023-11-17 11:31");
		moWalkLogVo.setEndTime("2023-11-17 11:45");
			
		System.out.println("셀렉트키 받기 전 " + moWalkLogVo);	              
		sqlSession.insert("walkLog.walkLogInsert", moWalkLogVo);
	}
	
	// 산책기록 좌표값 업데이트 (더미데이터용)
	public void coordsDelete(int walkLogNo){
		System.out.println("다오 산책기록 좌표값 업데이트 (더미데이터용)");		
		sqlSession.delete("walkLog.coordsDelete", walkLogNo);
	}
	
	// 산책기록 맵이미지 업데이트 (더미데이터용)
	public void mapImagDelete(int walkLogNo){
		System.out.println("다오 산책기록 맵이미지 업데이트 (더미데이터용)");		
		sqlSession.delete("walkLog.mapImagDelete", walkLogNo);
	}
	
	// (4) 강아지리스트기록하기
	public void dogListInsert(MoWalkedDogVo walkedDogVo){
		System.out.println("다오 강아지리스트기록하기");	
		sqlSession.insert("walkLog.walkedDogInsert", walkedDogVo);
	}
	
	// (5) 좌표리스트기록하기
	public void coordsListInsert(CoordsVo coordsVo){
		System.out.println("다오 좌표리스트기록하기");			
		sqlSession.insert("walkLog.coordsInsert", coordsVo);
	}
	
	// (6) 캡쳐용 좌표값 불러오기
	public List<CoordsVo> mapSelect(int walkLogNo){
		System.out.println("다오 캡쳐용 좌표값 불러오기");			
		return  sqlSession.selectList("walkLog.mapSelect", walkLogNo);
	}
	
	// 이미지 저장하기
	public void imgsSave(ImagesVo imagesVo){
		System.out.println("다오 첨부이미지 저장하기");	
		System.out.println(imagesVo);
		sqlSession.insert("walkLog.imgsSave", imagesVo);
	}
	
	
	// (0) 유사한 산책로 불러오기 (현재는 더미데이터 3개 불러오기)
	public List<MoTrailVo> trailSelect(int locationNo){
		System.out.println("다오 산책로 3개 불러오기");			
		return sqlSession.selectList("walkLog.trailSelect",locationNo);			
	}
	

}
