package com.midterm.foodSNS.mypage.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.midterm.foodSNS.command.MfreeboardArticleVO;

import com.midterm.foodSNS.mypage.mapper.IMyPageMapper;

@Service
public class MyPageService implements IMyPageService {
	
	
	@Autowired
	private IMyPageMapper mapper;
	
	
	@Override
	public List<MfreeboardArticleVO> getArticleList(String userId) {
		return mapper.getArticleList(userId);
		
	}

}
