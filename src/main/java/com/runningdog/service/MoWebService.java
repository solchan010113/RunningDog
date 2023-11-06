package com.runningdog.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.MoWebDao;

@Service	
public class MoWebService {
	
	@Autowired
	private MoWebDao moWebDao;
	
	// (1)
	public void trailSelect(){
		System.out.println("@Service");
		
		moWebDao.trailSelect();
		
		return ;
	}

}
