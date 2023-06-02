package com.midterm.foodSNS.controller;


import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.freeboard.service.IFreeBoardService;
import com.midterm.foodSNS.util.PageVO;

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
	
	

	@GetMapping("/modify/{faNum}")
	public String modify(@PathVariable int faNum, Model model){
		MfreeboardArticleVO avo = service.getArticle(faNum);
		List<MfreeboardImgVO> ivo = service.getCarousel(faNum);
		model.addAttribute("avo",avo);
		model.addAttribute("ivo",ivo);		
		 return "freeboard/modify";
	}
	

	//레시피 등록 페이지로
	@GetMapping("/uploadRecipe")
	public void uploadRecipe() {}

	@ResponseBody
	@PutMapping("/modify/{faNum}")
	public String modify(@PathVariable int faNum, @RequestBody Map<String,String> map2){
		log.info("번호 : "+ faNum);
//		log.info("글내용 : "+moditext.toString());
		log.info("글내용 : "+map2.get("moditext"));
		
		Map<String, Object> map = new HashMap<>();
		map.put("faNum", faNum); 
		map.put("content", map2.get("moditext")); 
		
		service.update(map);
		
		 return "redirect:/mypage/mypageResult";
	}
	

	
	//레시피 글 등록
	@PostMapping("/uploadRecipe")
	public String uploadRecipe(MfreeboardVO vo) {
		service.uploadRecipe(vo);
		
		return "redirect:recipeList";
	}
	
	//레시피 글 목록
	@GetMapping("/recipeList")
	public String recipeList(HttpServletRequest request, Model model) {	
			HttpSession session = request.getSession();
			MusersVO vo = (MusersVO) session.getAttribute("login");
			log.info("vo: " + vo);
			log.info("session: " + session);
			
			List<MfreeboardVO> articleList = new ArrayList<>();		
			articleList = service.getArticleList(vo.getUserId());
			
			log.info("articleList: " + articleList);			
			
			model.addAttribute("article",articleList);
			return "/freeboard/recipeList2";	
		}

}
