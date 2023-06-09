package com.midterm.foodSNS.controller;

import java.beans.Encoder;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.User;
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

import com.midterm.foodSNS.command.MKakaoUserVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.user.service.IUserService;
import com.midterm.foodSNS.util.KakaoService;
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
	@Autowired
	private KakaoService kakaoService;

	@GetMapping("/userJoin")
	public void userJoin() {
		
	}

	// 개인정보 페이지 이동
	@GetMapping("/userMypage")
	public void userMypage(HttpSession session, Model model) {
		MusersVO vo = (MusersVO) session.getAttribute("login");

		model.addAttribute("userInfo", service.userInfo(vo.getUserId()));
	}

	// 회원 탈퇴 요청
	@PostMapping("/userDelete")
	public String userDelete(MusersVO vo, HttpServletRequest request) {

		service.userDelete(vo);
		request.getSession().invalidate();
		return "redirect:/";
		
	}

// 탈퇴 페이지로 이동
	@GetMapping("/userDelete")
	public  void delete(HttpSession session, Model model) {
		MusersVO vo = (MusersVO) session.getAttribute("login");
		model.addAttribute("userInfo", service.userInfo(vo.getUserId()));
		
	}

	// 탈퇴를 위한 비밀번호 체크
	@PostMapping("/passChk")
	@ResponseBody
	public String delPasschk(@RequestBody String pwInput, HttpSession session) throws Exception {

		MusersVO vo = (MusersVO) session.getAttribute("login");

		int result = service.passChk(pwInput, vo);

		if (result == 1) {
			return "1";
		} else if (result == 0) {
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

	
	
	
	// 이메일 인증
	@ResponseBody // 비동기
	@GetMapping("/mailCheck")
	public String mailCheck(String email) {

		mailService.joinEmail(email);
		return mailService.joinEmail(email);
	}

	
	
	
	// 로그인 페이지로 이동 요청
	@GetMapping("/userLogin")
	public void login(Model model, HttpSession session) {
		/* 카카오 URL을 만들어서 userLogin.jsp로 보내야 합니다. */
		String kakaoAuthUrl = kakaoService.getAuthorizationUrl(session);

		model.addAttribute("urlKakao", kakaoAuthUrl);
	}

	
	
	
	// 로그인 성공시 콜백
	@GetMapping("/kakao_callback")
	public String callbackKakao(String code, String state, HttpSession session, Model model) {

		String accessToken = kakaoService.getAccessToken(session, code, state);
		log.info("access 토큰값: {}", accessToken);

		// accessToken을 이용하여 로그인 사용자 정보를 읽어오자.
		MKakaoUserVO vo = kakaoService.getUserProfile(accessToken);

		return "redirect:/";

		// 여기까지가 카카오 로그인 api가 제공하는 기능의 끝.
		// 추가 입력 정보가 필요하다면 추가 입력할 수 있는 페이지로 보내셔서 입력을 더 받아서
		// 데이터베이스에 데이터를 집어넣으시면 됩니다.

	}

	
	
	//로그인 요청 +비번검증해야함
	@PostMapping("/userLogin")
	public  void login(String userId, String userPw, Model model) {
		MusersVO vo = service.userInfo(userId);
		model.addAttribute("user", service.login(userId, userPw));	
		model.addAttribute("vo",vo);

	}

	
	
	
	// 로그아웃 요청
	@GetMapping("/userLogout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}

	
	
	
	// 프로필수정페이지이동
	@GetMapping("/userProfileModify")
	public String profileModify() {
		return "user/userProfileModify";

	}

	
	
	
	// 프로필수정처리
	@PostMapping("/userProfileModify")
	public String profile(@RequestParam("file") MultipartFile file, MusersVO vo, Model model,
			HttpServletRequest request) {
		service.profilemodify(vo, file);
		HttpSession session = request.getSession();
		session.setAttribute("login", vo);
		model.addAttribute("user", service.userInfo(vo.getUserId()));
		return "redirect:/mypage/mypageResult";
	}

	
	
	
	
	@GetMapping("/display/{fileLoca}/{fileName}")
	public ResponseEntity<byte[]> getFile(@PathVariable String fileLoca, @PathVariable String fileName) {

		File file = new File("C:/test/upload/" + fileLoca + "/" + fileName);
		log.info(file.toString());
		// 응다에 대한 여러가지 정보를 전달할 수 있는 객체 ResponseEntity
		// 응답 내용, 응답이 성공했는지에 대한 여부, 응답에 관련된 여러 설정들을 지원합니다.
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		// probeContetnType 매개값으로 전달받은 파일의 타입이 무엇인지를 문자열로반환
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			// ResponseEntity 객체에 전달하고자 하는 파일을 byte[]로 변환해서 전달.
			// header 내용도 같이 포함, 응답상태코드를 원하는 형태로 전달이 가능.
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
			result = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@ResponseBody
	@GetMapping("/getArticle/{userId}")
	public MusersVO getArticle(@PathVariable String userId) {
		return service.userInfo(userId);
	}


	

}
