package com.midterm.foodSNS.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserLoginSuccessHandler implements HandlerInterceptor{


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle이 발동됨");
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(request.getMethod().equals("POST")) {
			ModelMap map = modelAndView.getModelMap(); //모델 객체 꺼내기
			String id = (String) map.get("user"); //모델 내에 user라는 이름의 데이터 꺼내기
			//log.info("인터셉터 내부에서 user 확인: " + vo.toString());
			
			if(id != null) { //로그인 성공
				//로그인 성공한 회원에게 세션 데이터를 생성해서 로그인 유지를 하게 해 줌.				
				HttpSession session = request.getSession();
				session.setAttribute("login", id);
				response.sendRedirect(request.getContextPath() + "/"); //
				
			} else { //vo == null -> 로그인 실패
				modelAndView.addObject("msg", "loginFail");
			}
			
		}
	}
}
