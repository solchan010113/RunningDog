package com.runningdog.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.runningdog.dao.SettingDao;
import com.runningdog.vo.MainImageVo;
import com.runningdog.vo.UserVo;


@Service
public class SettingService {

	@Autowired
	private SettingDao settingDao;
	
	//유저 정보
	public UserVo selectUser(String id) {
		System.out.println("SettingService.selectUser()");
		
		//id로 userNo 가져오기
		int userNo = settingDao.selectUserNoWithId(id);
				
		UserVo selectUser = new UserVo();
		selectUser.setId(id);
		selectUser.setUserNo(userNo);
				
		selectUser = settingDao.selectUser(selectUser);
		
		return selectUser;
	}
	
	//파일 업로드
	public String uploadMyProfileImg(String id, MultipartFile file) {
		System.out.println("SettingService.uploadMyProfileImg()");
		
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
		
		
		//id로 userNo 가져오기
		int userNo = settingDao.selectUserNoWithId(id);
		
		
		//vo로 묶기
		MainImageVo mainImageVo = new MainImageVo(orgName, saveName, filePath, fileSize, userNo); 
		//System.out.println(mainImageVo);

		
		//기존 사진 지우기
		settingDao.deleteUserProfile(userNo);
		
		//dao 만들기 --> db 저장
		settingDao.insertUserProfile(mainImageVo);
		
		
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
		
		return saveName;
	}
	
	
}




