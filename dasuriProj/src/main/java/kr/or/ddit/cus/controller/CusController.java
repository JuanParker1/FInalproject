package kr.or.ddit.cus.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.ArticlePage;
import kr.or.ddit.cus.service.CusService;
import kr.or.ddit.cus.vo.CusVO;
import kr.or.ddit.util.UserUtil;

@RequestMapping(value="/cus")

@Controller
public class CusController {
	
	@Autowired CusService cusService;
	
	
	private static final Logger logger = 
			LoggerFactory.getLogger(CusController.class);
	
	//------------------------------------list-----------------------------------------------
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public String list(Model model
			, @RequestParam(defaultValue = "1",required = false) int currentPage
			, @RequestParam(required=false,defaultValue="10") int size
			, @RequestParam(required = false)String keyWord) {
		//페이지제목
		//userutil을 통하여 공유됨
		model.addAttribute("pageHeader",UserUtil.getPageHeader("Customer", "고객목록"));
		
		
		//페이지네이션
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("keyWord",keyWord);
		map.put("currentPage",currentPage);
		map.put("size", size);
		
		logger.info("currentPage: "+currentPage);
		logger.info("size: "+size);
		logger.info("keyWord: "+keyWord);
		
		List<CusVO>list = this.cusService.list(map);
		int total = this.cusService.cusCount(map);
		
		logger.info("total: "+total);
		
		//ArticlePage안에 이미 vo배열 값을 넣었기에 따로 안 만들어도된다.
//		model.addAttribute("list", list);
		//new ArticlePage(total, currentPage, size, pagingCount, content)
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, list));
		model.addAttribute("total", total);
		model.addAttribute("size", size);
		
		return "cus/list";
	}
	
	
	//------------------------------------insert----------------------------------------------
	
	@GetMapping("/insert")
	public String insert(Model model) {
		model.addAttribute("pageHeader",UserUtil.getPageHeader("Customer", "고객등록"));
		model.addAttribute("cusVO", new CusVO());
		//forwarding
		return "cus/insert";
	}
	
	
	@RequestMapping(value="/insert",method = RequestMethod.POST)
	public String insertPost(@Validated CusVO cusVO,
			BindingResult error) {
		//검증오류 발생
		if(error.hasErrors()) {
			List<ObjectError> allErrors = error.getAllErrors();
			List<ObjectError> globErrors = error.getGlobalErrors();
			List<FieldError> fieldErrors = error.getFieldErrors();
			//validation중에 어떤 오류가 나왔는지 확인..
			for(int i=0; i<allErrors.size(); i++) {
				ObjectError objectError = allErrors.get(i);
				logger.info("objectError :" + objectError);
			}
			for(ObjectError objectError : globErrors) {
				logger.info("objectError :" + objectError);
			}
			for(FieldError fieldError : fieldErrors) {
				logger.info("fieldError :" + fieldError);
			}
			//redirect(x) => 데이터를 보낼수 없기때문에 forwarding
			return "cus/insert";
		}
		//검증오류가 없으면 그대로 입력으로 들어감
		logger.info("cusVO: "+cusVO);
		int res = this.cusService.insert(cusVO);
		logger.info("result: "+res);
		if(res>0) {
			//입력 성공시
			return "redirect: /cus/list";
		}else {
			//실패시 돌아감
			return "cus/insert";
			}
		}
	
	//------------------------------------detail---------------------------------------------
	@GetMapping(value="/detail")
	public String detail(Model model, @RequestParam String cusNum) {
		model.addAttribute("pageHeader",UserUtil.getPageHeader("Customer", "회원상세정보"));
		
		List<CusVO> list = this.cusService.detail(cusNum);
		logger.info("상세정보: "+list);
	
		//다중 이미지를 모두 보이고 싶을때..
//		model.addAttribute("cusVO", list);
		
		for (CusVO cusVO : list) {
			model.addAttribute("cusVO", cusVO);
		}
		//배열안에 있기 때문에 0으로 하나만 빼온다.
		return "cus/detail";
	}
	
	
	@GetMapping(value="/profile")
	public String profile(){
		return "cus/profile";
	}
	
	
}
