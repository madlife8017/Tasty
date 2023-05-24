package com.midterm.foodSNS.freeboard.service;

import java.util.List;

import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.util.PageVO;

public interface IFreeBoardService {

	//글 등록
	void regist(MfreeboardVO vo);
	
	//글 목록
	List<MfreeboardVO> getList(PageVO vo);
	
	//총 게시물 수 구하기
	int getTotal(PageVO vo);
	
	//상세보기
	MfreeboardVO getContent(int bno);	
	
	//수정
	void update(MfreeboardVO vo);
	
	//삭제
	void delete(int bno);
	
	
}
