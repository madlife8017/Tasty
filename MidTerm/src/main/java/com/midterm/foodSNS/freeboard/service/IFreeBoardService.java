package com.midterm.foodSNS.freeboard.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.util.PageVO;

public interface IFreeBoardService {

	//글 이미지저장
	void registImg(MfreeboardImgVO ivo, List<MultipartFile> file);
	
	//글 등록
	void registArticle(MfreeboardArticleVO avo);
	
	//글 목록
	List<MfreeboardArticleVO> getList(PageVO vo);
	
	MfreeboardArticleVO getArticle(int faNum);
	
	//총 게시물 수 구하기
	int getTotal(PageVO vo);
	
	//상세보기
	MfreeboardArticleVO getContent(int bno);	
	
	//수정
	void update(MfreeboardArticleVO vo);
	
	//삭제
	void delete(int bno);

	List<MfreeboardImgVO> getCarousel(int faNum);
	
	
}
