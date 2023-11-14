package com.runningdog.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.runningdog.dao.SettingDao;
import com.runningdog.vo.DogsVo;
import com.runningdog.vo.MainImageVo;
import com.runningdog.vo.UserVo;


@Service
public class SettingService {

	@Autowired
	private SettingDao settingDao;
	
	//유저 정보
	public UserVo selectUser(int userNo) {
		System.out.println("SettingService.selectUser()");
			
		UserVo selectUser = settingDao.selectUser(userNo);
		
		//이미지 가져오기
		MainImageVo userImg = new MainImageVo("users", userNo);
		String saveName = settingDao.selectImg(userImg);
		selectUser.setSaveName(saveName);
		
		return selectUser;
	}
	
	
	//프로필 이미지 업로드 form으로
	public int modifyMyProfile(UserVo userVo, int userNo, MultipartFile file) {
		System.out.println("SettingService.modifyMyProfile()");
		
		// 파일 null 예외처리
		if(!file.isEmpty()){
			//파일 저장 디렉토리
			String saveDir = "C:\\javaStudy\\rdimg\\userProfile";
			
			//파일 관련 정보 추출 //////////////////////////
			//오리지널 파일 명
			String orgName = file.getOriginalFilename();
			//System.out.println(orgName);
			
			//확장자
			String exName = orgName.substring(orgName.lastIndexOf("."));
			//System.out.println(exName);
			
			//저장 파일명(겹치지 않아야 함)
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
								//		 long		 	 +			String
			//System.out.println(saveName);
			
			//파일 사이즈
			long fileSize = file.getSize();
			//System.out.println(fileSize);
			
			//파일 전체 경로
			String filePath = saveDir + "\\" + saveName;
			//System.out.println(filePath);
			
			
			//vo로 묶기
			MainImageVo mainImageVo = new MainImageVo(orgName, saveName, filePath, fileSize, "users", userNo); 
			//System.out.println(mainImageVo);

			
			//기존 사진 지우기
			MainImageVo userImg = new MainImageVo("users", userNo);
			settingDao.deleteImg(userImg);
			
			//이미지 테이블에 저장
			settingDao.insertImg(mainImageVo);
			
			
			//파일 저장(서버쪽 하드 디스크에 저장) //////////////////////////////
			
			try {
				byte[] fileData;
				
				fileData = file.getBytes();
				
				OutputStream os = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(os);
				
				bos.write(fileData);
				bos.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//유저 정보 수정
		userVo.setUserNo(userNo);
		
		if("".equals(userVo.getBirth())) {
			userVo.setBirth(null);
		}
		
		int count = settingDao.updateUser(userVo);
		
		return count;
	}

	//동네 목록
	public List<UserVo> selectAddressList(String keyword){
		System.out.println("SettingService.selectAddressList()");
		
		List<UserVo> addressList = settingDao.selectAddressList(keyword);
		
		return addressList;
	}
	
	
	
/*   강아지   */
	
	//강아지 리스트
	public List<DogsVo> selectDogList(int userNo){
		System.out.println("SettingService.selectDogList()");
		
		List<DogsVo> dogList = settingDao.selectDogList(userNo);
		//System.out.println(dogList);

		return dogList;
	}
	
	//강아지 등록
	public void insertDog(int userNo, DogsVo dogsVo, MultipartFile file) {
		System.out.println("SettingService.insertDog()");

		//강아지 등록하기
		dogsVo.setUserNo(userNo);

		settingDao.insertDog(dogsVo);
		
		// 파일 null 예외처리
		if(!file.isEmpty()){
			//파일 저장 디렉토리
			String saveDir = "C:\\javaStudy\\rdimg\\dogProfile";
			
			//파일 관련 정보 추출 //////////////////////////
			//오리지널 파일 명
			String orgName = file.getOriginalFilename();
			//System.out.println(orgName);
			
			//확장자
			String exName = orgName.substring(orgName.lastIndexOf("."));
			//System.out.println(exName);
			
			//저장 파일명(겹치지 않아야 함)
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
								//		 long		 	 +			String
			//System.out.println(saveName);
			
			//파일 사이즈
			long fileSize = file.getSize();
			//System.out.println(fileSize);
			
			//파일 전체 경로
			String filePath = saveDir + "\\" + saveName;
			//System.out.println(filePath);
			
			
			//dog pk값
			int dogNo = dogsVo.getDogNo();
			
			//vo로 묶기
			MainImageVo mainImageVo = new MainImageVo(orgName, saveName, filePath, fileSize, "dog", dogNo); 
			//System.out.println(mainImageVo);

			
			//이미지 테이블에 저장
			settingDao.insertImg(mainImageVo);
			
			
			//파일 저장(서버쪽 하드 디스크에 저장) //////////////////////////////
			
			try {
				byte[] fileData;
				
				fileData = file.getBytes();
				
				OutputStream os = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(os);
				
				bos.write(fileData);
				bos.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}		
	}
	
	//강아지 하나
	public DogsVo selectDog(int dogNo){
		System.out.println("SettingService.selectDog()");
		
		DogsVo dogsVo = settingDao.selectDog(dogNo);
		
		return dogsVo;
	}
	
	//강아지 삭제 update
	public int deleteDog(int dogNo){
		System.out.println("SettingService.deleteDog()");
		
		int count = settingDao.deleteDog(dogNo);
		
		return count;
	}
	
	//강아지 정보 update
	public void updateDog(int userNo, DogsVo dogsVo, MultipartFile file){
		System.out.println("SettingService.updateDog()");
		
		//강아지 등록하기
		dogsVo.setUserNo(userNo);
		settingDao.updateDog(dogsVo);
		
		// 파일 null 예외처리
		if(!file.isEmpty()){
			//파일 저장 디렉토리
			String saveDir = "C:\\javaStudy\\rdimg\\dogProfile";
			
			//파일 관련 정보 추출 //////////////////////////
			//오리지널 파일 명
			String orgName = file.getOriginalFilename();
			//System.out.println(orgName);
			
			//확장자
			String exName = orgName.substring(orgName.lastIndexOf("."));
			//System.out.println(exName);
			
			//저장 파일명(겹치지 않아야 함)
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
								//		 long		 	 +			String
			//System.out.println(saveName);
			
			//파일 사이즈
			long fileSize = file.getSize();
			//System.out.println(fileSize);
			
			//파일 전체 경로
			String filePath = saveDir + "\\" + saveName;
			//System.out.println(filePath);
			
			
			//dog pk값
			int dogNo = dogsVo.getDogNo();
			
			//vo로 묶기
			MainImageVo mainImageVo = new MainImageVo(orgName, saveName, filePath, fileSize, "dog", dogNo); 
			//System.out.println(mainImageVo);

			
			//기존 사진 지우기
			MainImageVo dogImg = new MainImageVo("dog", dogNo);
			settingDao.deleteImg(dogImg);
			
			//이미지 테이블에 저장
			settingDao.insertImg(mainImageVo);
			
			
			//파일 저장(서버쪽 하드 디스크에 저장) //////////////////////////////
			
			try {
				byte[] fileData;
				
				fileData = file.getBytes();
				
				OutputStream os = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(os);
				
				bos.write(fileData);
				bos.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	
}




