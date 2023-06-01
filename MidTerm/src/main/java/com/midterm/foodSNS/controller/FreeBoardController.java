package com.midterm.foodSNS.controller;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.freeboard.service.IFreeBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/freeboard")
@Slf4j
public class FreeBoardController {
	
	@Autowired
	private IFreeBoardService service;
	
	//등록페이지이동
	@GetMapping("/regist")
	public String regist() {
		return "freeboard/regist";	
	}
	
	//유저 게시물(+이미지들) 등록저장처리
	@PostMapping("/regist")
	public String profile(@RequestParam("file")List<MultipartFile> file,MfreeboardArticleVO avo,MfreeboardImgVO ivo) {	
		service.registArticle(avo);
		service.registImg(ivo,file);		
		return "redirect:/mypage/mypageResult";
	}
	
	//비동기클릭시글찾아오기
	@ResponseBody
	@GetMapping("/getArticle/{faNum}")
	public MfreeboardArticleVO getArticle(@PathVariable int faNum){
		return service.getArticle(faNum);		
	}
	
	@ResponseBody
	@GetMapping("/getCarousel/{faNum}")
	public List<MfreeboardImgVO> getCarousel(@PathVariable int faNum){
		return 	service.getCarousel(faNum);
	}
	
	@ResponseBody
	@DeleteMapping("/delete/{faNum}")
	public void delete(@PathVariable int faNum){
		 service.delete(faNum);		 
	}
	
	@ResponseBody
	@DeleteMapping("/modifyImgDelete/{iNum}")
	public void deleteimg(@PathVariable int iNum){
		 service.deleteimg(iNum);		 
	}
	

	@GetMapping("/modify/{faNum}")
	public String modify(@PathVariable int faNum, Model model){
		MfreeboardArticleVO avo = service.getArticle(faNum);
		List<MfreeboardImgVO> ivo = service.getCarousel(faNum);
		model.addAttribute("avo",avo);
		model.addAttribute("ivo",ivo);
		
		 return "freeboard/modify";
	}
	
	@GetMapping("uploadRecipe")
	public void uploadRecipe() {}
	
	@PostMapping("uploadRecipe")
	public String uploadRecipe(MfreeboardVO vo) {
		service.uploadRecipe(vo);
		
		return "freeboard/recipeList";
	}
	
	
	
	
	

}
