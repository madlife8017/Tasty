package com.midterm.foodSNS.util.interceptor;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class MailSenderService {

	@Autowired
	private JavaMailSender mailSender;
	private int authNum;
	
	
	public int makeRandomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		
		log.info("인증번호: " + checkNum);
		return checkNum;
	}
	
	
	
	
	
	//이메일 양식을 결정하는 메서드
	public String joinEmail(String email) { //컨트롤러가 부를꺼에요~
		
		authNum = makeRandomNumber();
		
		String setFrom = "sdj799@naver.com"; //여기에 각자 이메일 적으면 됩니다.
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해 주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 <strong>" + authNum + "</strong> 입니다." +
                "<br>" +
                "해당 인증 번호를 인증번호 확인란에 기입해 주세요."; 
		mailSend(setFrom, toMail, title, content);
		
		return Integer.toString(authNum);
		
	}
		
	
	private void mailSend(String setFrom, String toMail, String title, String content) {
		
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
}
