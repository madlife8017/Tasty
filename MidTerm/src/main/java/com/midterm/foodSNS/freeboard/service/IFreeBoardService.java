package com.midterm.foodSNS.freeboard.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.util.PageVO;

public interface IFreeBoardService {

	//글 이미지저장
	void registImg(MfreeboardImgVO ivo, List<MultipartFile> file);
	
	//글 등록
	void registArticle(MfreeboardArticleVO avo);
	
	//글 목록
	List<MfreeboardArticleVO> getList(PageVO vo);
	
	MfreeboardArticleVO getArticle(int faNum);
	


	
	//삭제
	void delete(int fanNum);

	List<MfreeboardImgVO> getCarousel(int faNum);
	
	void deleteimg(int iNum);

	//레시피 등록
	void uploadRecipe(MfreeboardVO vo);
	
	
}
