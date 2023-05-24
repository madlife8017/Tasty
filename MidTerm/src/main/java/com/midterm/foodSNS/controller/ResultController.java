package com.midterm.foodSNS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.midterm.foodSNS.command.MSearchConditionVO;
import com.midterm.foodSNS.result.service.IResultService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/result")
@Slf4j
public class ResultController {
	
	@Autowired
	private IResultService service;
	
	//home으로
	
	
	//메인 추천 결과 이동
	@PostMapping("/mainResult")
	public String resultMain (String weather, String condition, String feeling, Model model) {
		log.info("resultMain operate");
		MSearchConditionVO vo = new MSearchConditionVO();
		vo.setWeather(weather);
		vo.setCondition(condition);
		vo.setFeeling(feeling);
		
		model.addAttribute("searchCondition",vo);
		return "result/mainResult";		
	}
	
	@GetMapping("/resultDetail")
	public String resultDetail() {
		
		return "result/resultDetail";		
	}	
	
}
