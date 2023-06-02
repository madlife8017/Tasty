package com.midterm.foodSNS.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.mypage.mapper.IMyPageMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageService implements IMyPageService {
	
	
	@Autowired
	private IMyPageMapper mapper;
	
	
	@Override
	public List<MfreeboardArticleVO> getArticleList(String userId) {
		return mapper.getArticleList(userId);
		
	}
	@Override
	public List<MfreeboardImgVO> getImgList(String userId) {
		log.info(userId);
		return mapper.getImgList(userId);
	}
	
	@Override
	public void addFollowing(Map<String, String> map) {
		mapper.addFollowing(map);
	}
	
	@Override
	public int checkFollowing(Map<String, String> map) {		
		return mapper.checkFollowing(map);
	}
	@Override
	public void deleteFollowing(Map<String, String> map) {
		 mapper.deleteFollowing(map);
		
	}

	@Override
	public List<MusersVO> countFollower(String userId) {
		return mapper.countFollower(userId);
	}
	@Override
	public void addFollower(Map<String, String> map) {
		mapper.addFollower(map);
		
	}
	

}
