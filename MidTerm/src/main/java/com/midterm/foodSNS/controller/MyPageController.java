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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.mypage.service.IMyPageService;
import com.midterm.foodSNS.user.service.IUserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MyPageController {

	@Autowired
	private IMyPageService service;
	
	@Autowired
	private IUserService userService;

	@GetMapping("/mypageResult")
	public String mypageResult(HttpServletRequest request, Model model) {
				
		HttpSession session = request.getSession();
		MusersVO vo = new MusersVO();
		vo = (MusersVO) session.getAttribute("login");
		
		List<MfreeboardArticleVO> articleList = new ArrayList<>();		
		articleList = service.getArticleList(vo.getUserId());
		
		List<MfreeboardImgVO> imgList = new ArrayList<>();		
		imgList = service.getImgList(vo.getUserId());
		
		List<MusersVO> countFollower = service.countFollower(vo.getUserId());
		
					
		
		model.addAttribute("article",articleList);
		model.addAttribute("img",imgList);
		model.addAttribute("countFollower",countFollower);
		
		
		log.info("follower : " +countFollower.toString());
		
		
		return "mypage/mypageResult";	
	}
	
	@GetMapping("/userResult/{userId}")
	public String userResult(@PathVariable String userId, Model model,Map<String, String> map,HttpServletRequest request) {
		log.info("타겟유저아이디 : "+userId);
		
		HttpSession session = request.getSession();
		MusersVO vo = new MusersVO();
		vo = (MusersVO) session.getAttribute("login");	
		
		MusersVO user = new MusersVO();
		user=userService.userInfo(userId);		
		List<MfreeboardArticleVO> articleList = new ArrayList<>();	
		articleList = service.getArticleList(userId);		
		List<MfreeboardImgVO> imgList = new ArrayList<>();		
		imgList = service.getImgList(userId);	
		
		map.put("userId", vo.getUserId()); 
		map.put("targetId", userId);		
		
		
		log.info("회원정보:"+user.toString());	
		log.info("회원게시물:"+articleList.toString());	
		log.info("회원게시물 이미지:"+imgList.toString());
		log.info("팔로우 여부:"+service.checkFollowing(map));
		
		model.addAttribute("user",user);		
		model.addAttribute("article",articleList);
		model.addAttribute("img",imgList);
		model.addAttribute("followCheck",service.checkFollowing(map));
		
		return "mypage/userResult";
		
	}
	
	@ResponseBody
	@PostMapping("/addFollow/{targetId}")
	public void addFollowing(@PathVariable String targetId,HttpServletRequest request, Map<String, String> map) {
		
		HttpSession session = request.getSession();
		MusersVO vo = new MusersVO();
		vo = (MusersVO) session.getAttribute("login");		
		vo.getUserId();		
		map.put("userId", vo.getUserId()); 
		map.put("targetId", targetId);		
		log.info("타겟아이디 : "+targetId);
		log.info("유저아이디 : "+vo.getUserId());
		if(service.checkFollowing(map)==0) {
		service.addFollowing(map);
		}else {
			log.info("이미 팔로잉중");
		}
		service.addFollower(map);
		
	}
	
	@ResponseBody
	@DeleteMapping("/deleteFollow/{targetId}")
	public void deleteFollowing(@PathVariable String targetId,HttpServletRequest request, Map<String, String> map) {
		
		HttpSession session = request.getSession();
		MusersVO vo = new MusersVO();
		vo = (MusersVO) session.getAttribute("login");		
		vo.getUserId();		
		map.put("userId", vo.getUserId()); 
		map.put("targetId", targetId);		
		log.info("타겟아이디 : "+targetId);
		log.info("유저아이디 : "+vo.getUserId());
		if(service.checkFollowing(map)==1) {
		service.deleteFollowing(map);
		}else {
			log.info("이미 팔로잉중");
		}
		
	}
	
	
	

	


}
