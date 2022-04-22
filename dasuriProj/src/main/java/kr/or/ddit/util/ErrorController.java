package kr.or.ddit.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	private static final Logger logger = 
		LoggerFactory.getLogger(ErrorController.class);
	
	@GetMapping("/error/400")
	public String error400() {
		return "error/400";
	}
	@RequestMapping("/error/404")
	public String error404() {
		return "error/404";
	}
	@RequestMapping("/error/500")
	public String error500() {
		return "error/500";
	}
	
//	@GetMapping(value="/error/{errorNo}")
//	public String errorHandler(@PathVariable("errorNo") int errorNo, Model model) {
//		
//		model.addAttribute("errorNo", errorNo);
//		logger.info("에러번호 : "+ errorNo);
//		
//		return "error/errorHandler";
//	}
}
