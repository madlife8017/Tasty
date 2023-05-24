package com.midterm.foodSNS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.midterm.foodSNS.mypage.IMyPageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MyPageController {
	
	@Autowired
	private IMyPageService service;
	
	@GetMapping
	public String mypageResult() {
		return "mypage/mypageResult";	
	}
	
	

}
