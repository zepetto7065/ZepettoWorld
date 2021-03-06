package com.zepetto.world.ca;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zepetto.world.domain.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zepetto.world.service.MemberService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Inject
	private MemberService memberService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String home(HttpServletRequest request, HttpServletResponse response, Model model, MemberVO vo, HttpSession session) {
		logger.info("Zepetto World 환영합니다.");
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1. 세션 컨트롤
		 response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		 response.setHeader("Expires", "0"); // Proxies.
		 
		return "/index";
	}
	
	
	/**
	 * @MethodName : HomeController
	 * @author : 유상문
	 * @since : 2019. 8. 26.
	 * @see : 아이디 중복 체크 팝업
	 */
	@RequestMapping(value = "/idCheckForm", method = RequestMethod.GET)
	public String idCheckForm() {
		return "/popup/idCheckForm";
	}
	
	/**
	 * @MethodName : HomeController
	 * @author : 유상문
	 * @since : 2020. 01. 03.
	 * @see : 로그인 팀룸 메인화면
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "/portlet/login";
	}
	
	
	
	/**
	 * @MethodName : HomeController
	 * @author : 유상문
	 * @since : 2019. 9. 16.
	 * @see : Resume 
	 */
	@RequestMapping(value = "/resume", method = RequestMethod.GET)
	public String resume() {
		return "/resume";
	}
	
	
	/**
	 * @MethodName : HomeController
	 * @author : 유상문
	 * @since : 2019. 9. 16.
	 * @see : Resume 
	 */
	@RequestMapping(value = "/overview", method = RequestMethod.GET)
	public String overview() {
		return "/overview";
	}
	
	/**
	 * @MethodName : HomeController
	 * @author : 유상문
	 * @since : 2019. 9. 16.
	 * @see : FAQ 
	 */
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return "/faq";
	}
	
	
	/**
	 * @MethodName : HomeController
	 * @author : 유상문
	 * @since : 2019. 9. 24.
	 * @see : portofolio
	 */
	@RequestMapping(value = "/aboutme/portofolio", method = RequestMethod.GET)
	public void portofolio() {
		
	}
	
	
}
