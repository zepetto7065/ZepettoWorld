package com.zepetto.world.bo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
			
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("signedUser") == null) {
			logger.info("current user is not logged");
			response.sendRedirect("/login/login");
			return false;
		}
		return true;
	}
	
}
