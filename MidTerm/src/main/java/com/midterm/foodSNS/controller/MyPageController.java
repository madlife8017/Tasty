package com.midterm.foodSNS.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.mypage.service.IMyPageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MyPageController {

	@Autowired
	private IMyPageService service;

	@GetMapping("/mypageResult")
	public String mypageResult(HttpServletRequest request, Model model) {
		MusersVO vo = new MusersVO();		
		HttpSession session = request.getSession();
		vo = (MusersVO) session.getAttribute("login");

		
		List<MfreeboardArticleVO> articleList = new ArrayList<>();		
		articleList = service.getArticleList(vo.getUserId());
		
		//List<MfreeboardImgVO> imgList = new ArrayList<>();		
		//imgList = service.getImgList(vo.getUserId());
		
		//log.info("eeeee"+imgList.toString());
		
		
		model.addAttribute("article",articleList);
		//model.addAttribute("img",imgList);

		return "mypage/mypageResult";	
	}
	

	


}
