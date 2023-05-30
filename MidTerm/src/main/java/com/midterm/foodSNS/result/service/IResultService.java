package com.midterm.foodSNS.result.service;

import java.util.List;

import com.midterm.foodSNS.command.MRecipeVO;

public interface IResultService {
	
	//추천결과보여주기
	List<MRecipeVO> recommand(MRecipeVO vo);

}
