package com.runningdog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.SettingDao;
import com.runningdog.vo.UserVo;


@Service
public class SettingService {

	@Autowired
	private SettingDao settingDao;
	
	//유저 정보
	public UserVo selectUser(String id) {
		System.out.println("SettingService.selectUser()");
		
		UserVo authUser = settingDao.selectUser(id);
		
		return authUser;
	}
	
}




