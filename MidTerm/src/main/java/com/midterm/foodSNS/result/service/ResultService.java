package com.midterm.foodSNS.result.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midterm.foodSNS.command.LikeVO;
import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.command.MSearchConditionVO;
import com.midterm.foodSNS.result.mapper.IResultMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ResultService implements IResultService {
	
	@Autowired
	private IResultMapper mapper;
	


	@Override
	public List<MRecipeVO> recommand(MSearchConditionVO vo) {
				
		return mapper.recommand(vo);
	}
	
	@Override
	public MRecipeVO recipeDetail(int cooknum) {
		return mapper.recipeDetail(cooknum);
		 
	}
	
	@Override
	public int getLike(int cooknum) {
		return mapper.getLike(cooknum);
	}
	
	@Override
	public LikeVO updateLike(int cooknum, LikeVO vo) {
		vo.setCooknum(cooknum);
		log.info("좋아요 체크"+mapper.chkLike(vo));
		log.info("vo=" + vo.toString());
		if(mapper.chkLike(vo) == 1) { //이 회원이 좋아요를 이미 눌렀는지 확인
			mapper.deleteLike(vo); // 좋아요를 눌렀다면 좋아요 취소
		} else {
			mapper.insertLike(vo); // 좋아요를 누르지 않은 상태면 추가
		}
		return null;
	}

}
