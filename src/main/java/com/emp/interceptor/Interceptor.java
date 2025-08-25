package com.emp.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class Interceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		/* 기존 세션만 가져온다. 없으면 Null */
		HttpSession session = request.getSession(false);
		
		/* 세션이 아에 없는 경우 */
		if(session == null) {
			response.sendRedirect("/");
			return false;
		}
		
		boolean isManager = session.getAttribute("valueManager") != null;
		boolean isEmployee = session.getAttribute("valueEmployee") != null;
		
		String uri = request.getRequestURI();
		
		/* 매니저 권한만 필요한 페이지 */
		if(uri.startsWith("/manage")) {
			if(!isManager) {
				response.sendRedirect("/");
				return false;
			}
		}
		
		/* 직원 권한만 필요한 페이지 */
		if(uri.startsWith("/leave") || uri.startsWith("/lateness") || uri.startsWith("/atted") || uri.startsWith("/emp")) {
			if(!isEmployee) {
				response.sendRedirect("/");
				return false;
			}
		}
		
		
		return true;
	}

}
