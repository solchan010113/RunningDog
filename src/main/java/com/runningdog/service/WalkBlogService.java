package com.runningdog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.runningdog.dao.WalkBlogDao;
import com.runningdog.vo.BlogInfoVo;
import com.runningdog.vo.ShowLogVo;

@Service
public class WalkBlogService {
	
	@Autowired
	private WalkBlogDao walkBlogDao;

	public BlogInfoVo selectBlogInfo(String paramId, String authId) {
		
		System.out.println("selectBlogInfo");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("paramId",paramId);
		map.put("authId",authId);
		
		BlogInfoVo blogInfoVo = new BlogInfoVo();
		
		blogInfoVo.setName(walkBlogDao.selectBlogOwner(paramId));
		blogInfoVo.setAuthId(authId);
		blogInfoVo.setParamId(paramId);
		
		
		blogInfoVo.setFollowerNum(walkBlogDao.selectfollowerNum(paramId));
		
		blogInfoVo.setFollowingNum(walkBlogDao.selectfollowingNum(paramId));
		
		blogInfoVo.setFollowNo(walkBlogDao.didIFollow(map));
		
		
		
		
		return blogInfoVo; 
	}

	public List<ShowLogVo> walkLogList(String paramId) {
		
		List<ShowLogVo> walkLogList = walkBlogDao.walkLogList(paramId);
		
		return walkLogList;
	}



}
