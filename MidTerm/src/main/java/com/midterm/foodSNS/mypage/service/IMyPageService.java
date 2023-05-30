package com.midterm.foodSNS.mypage.service;

import java.util.List;

import com.midterm.foodSNS.command.MfreeboardArticleVO;

public interface IMyPageService {
	
	List<MfreeboardArticleVO> getArticleList(String userId);

}
