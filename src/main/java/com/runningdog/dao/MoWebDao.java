package com.runningdog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.TrailVo;

@Repository
public class MoWebDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// (1)
	public void trailSelect(){
		System.out.println("@Dao");
		
		
		
		
		return ;
	}	
	
	

}
