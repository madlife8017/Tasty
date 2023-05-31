package com.midterm.foodSNS.controller;
import java.io.File;



import java.io.File;

import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.midterm.foodSNS.command.MfreeboardArticleVO;
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

	// 회원가입 페이지로 이동
	@GetMapping("/userJoin")
	public void userJoin() {

	}

	
	// 개인정보 페이지 이동
	@GetMapping("/userMypage")
	public void userMypage(HttpSession session, Model model) {
		MusersVO vo = (MusersVO) session.getAttribute("login");
		log.info(vo.toString());
		model.addAttribute("userInfo", service.userInfo(vo.getUserId()));
	}


	// 탈퇴 페이지로 이동
	@PostMapping("/userDelete")
	public void userDelete(MusersVO vo) {
		log.info(vo.toString());
		service.userDelete(vo);
	}

	// 회원 탈퇴 요청
	@GetMapping("/userDelete")
	public void delete(HttpSession session, Model model) {
		MusersVO vo = (MusersVO) session.getAttribute("login");
		model.addAttribute("userInfo", service.userInfo(vo.getUserId()));
	}

	// 탈퇴를 위한 비밀번호 체크
	@PostMapping("/passChk")
	@ResponseBody
	public String delPasschk(@RequestBody String pwInput, HttpSession session) throws Exception {
		log.info("패치오냐" + pwInput);
		MusersVO vo = (MusersVO) session.getAttribute("login");
		log.info("비법너너너: "+vo.getUserPw());
		
		int result = service.passChk(pwInput,vo);
		log.info("리턴오냐" + result);	
		
		if(result==1) {
			return "1";
		}
		else if(result==0){
			return "0";
		}
		return null;
		
		
	}

	
	// 개인정보 변경 페이지 이동
	@GetMapping("/userUpdate")
	public void userUpdate(HttpSession session, Model model) {
		MusersVO vo = (MusersVO) session.getAttribute("login");
		model.addAttribute("userInfo", service.userInfo(vo.getUserId()));
	}

	
	// 개인정보 변경 요청
	@PostMapping("/userUpdate")
	public String userUpdate(MusersVO vo) {
		service.updateMusers(vo);
		return "redirect:/user/userMypage";
	}

	
	// 아이디 중복 확인
	@ResponseBody // 비동기
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		log.info("아이디 중복체크: " + userId);
		if (service.idCheck(userId) == 1)
			return "duplicated"; // 중복일 경우 "duplicated"를 전달
		else
			return "ok"; // 중복이 아닐경우 "ok"를 전달
	}

	
	// 회원 가입 처리
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
	@GetMapping("/userLogin")
	public void userLogin() {}
	
	
	//로그인 요청
	@PostMapping("/userLogin")
	public void login(String userId, String userPw, Model model) {
		log.info("UserController의 로그인 요청!");
		model.addAttribute("user", service.userInfo(userId));
	}
	
	//프로필수정페이지이동
	@GetMapping("/userProfileModify")
	public String profileModify() {
		return "user/userProfileModify";
		
	}
	//프로필수정처리
	@PostMapping("/userProfileModify")
	public String profile(@RequestParam("file")MultipartFile file, MusersVO vo, Model model,HttpServletRequest request) { 
		service.profilemodify(vo, file);		
		HttpSession session = request.getSession();
		session.setAttribute("login", vo);	
		model.addAttribute("user", service.userInfo(vo.getUserId()));		
		return "redirect:/mypage/mypageResult";
	}
	
	@GetMapping("/display/{fileLoca}/{fileName}")
	public ResponseEntity<byte[]> getFile(@PathVariable String fileLoca,
			@PathVariable String fileName){		
		log.info("filename : " +fileName);
		log.info("fileLoca : " +fileLoca);
		File file = new File("C:/test/upload/"+fileLoca+"/"+fileName);
		log.info(file.toString());		
		//응다에 대한 여러가지 정보를 전달할 수 있는 객체 ResponseEntity
		//응답 내용, 응답이 성공했는지에 대한 여부, 응답에 관련된  여러 설정들을 지원합니다.	
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		//probeContetnType 매개값으로 전달받은 파일의 타입이 무엇인지를 문자열로반환
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));	
			//ResponseEntity 객체에 전달하고자 하는 파일을 byte[]로 변환해서 전달.
			//header 내용도 같이 포함, 응답상태코드를 원하는 형태로 전달이 가능.
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);			
		} catch (IOException e) {			
			e.printStackTrace();
			result = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}	
		return result;
	}
	
	@ResponseBody
	@GetMapping("/getArticle/{userId}")
	public MusersVO getArticle(@PathVariable String userId){
		return service.userInfo(userId);		
	}
	
	@GetMapping("/test")
	public void move(){	
		
		
	}
	@PostMapping("/test")
	public void move(String content){
		
		log.info(content);
		
		
	}
	
	
	
}


	