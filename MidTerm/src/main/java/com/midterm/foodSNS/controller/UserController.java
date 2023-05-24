package com.midterm.foodSNS.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.user.service.IUserService;
import com.midterm.foodSNS.util.interceptor.MailSenderService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {
	
	@Autowired
	private IUserService service;
	@Autowired
	private MailSenderService mailService;
	
	//회원가입 페이지로 이동
	@GetMapping("/userJoin")
	public void userJoin() {}
	
	//아이디 중복 확인
	@ResponseBody //비동기
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		log.info("아이디 중복체크: "+ userId);
		if(service.idCheck(userId) == 1) return "duplicated"; //중복일 경우 "duplicated"를 전달
		else return "ok"; //중복이 아닐경우 "ok"를 전달
	}
	
	//회원 가입 처리
	@PostMapping("/userJoin")
	public String userJoin(MusersVO vo, RedirectAttributes ra) {
		service.join(vo);
		ra.addFlashAttribute("msg", "joinSuccess");
		return "redirect:/user/userLogin";
	}
	
	//이메일 인증
	@ResponseBody//비동기
	@GetMapping("/mailCheck")
	public String mailCheck(String email) {
		log.info("메일 인증: " + email);
		mailService.joinEmail(email);
		return mailService.joinEmail(email);
	}
	
	//로그인 페이지로 이동 요청
	@GetMapping("userLogin")
	public void userLogin() {}
	
	
	//로그인 요청
	@PostMapping("/userLogin")
	public void login(String userId, String userPw, Model model) {
		log.info("UserController의 로그인 요청!");
		model.addAttribute("user", service.login(userId, userPw));
	}
	

	
	
	
	
}


	