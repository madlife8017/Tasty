package com.midterm.foodSNS.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserAuthHandler implements HandlerInterceptor {

	@Override //HandlerInterceptor에서 오버라이드
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) { //세션에 "login"이 없을 경우
			response.sendRedirect(request.getContextPath() + "/user/userLogin"); //로그인 요청을 보냄
			return false;
		}
		return true; // 로그인이 있다면 통과
	}
}
