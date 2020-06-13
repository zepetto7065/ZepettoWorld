package com.zepetto.world.ca;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("reply")
public class ReplyTestController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyTestController.class);

		
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String replyAjaxTest() {
		return "/tutorial/reply_test";
	}

	
}
