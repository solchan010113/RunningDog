package com.runningdog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.UsersDao;
import com.runningdog.vo.UsersVo;



@Service
public class UsersService {

	@Autowired
	private UsersDao usersDao;


	//회원가입
	public int insertUser(UsersVo usersVo) {
		System.out.println("UsersService.insertUser()");
		
		int count = usersDao.insertUser(usersVo);
		
		return count;
	}
	
	
	//유저 1명 찾아오기 (로그인)
	public UsersVo selectOneUser(UsersVo usersVo) {
		System.out.println("UsersService.selectOneUser()");
		
		UsersVo authUser = usersDao.selectOneUser(usersVo);
		
		return authUser;
	}
	
}




