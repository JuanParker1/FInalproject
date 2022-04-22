package kr.or.ddit;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//컨트롤러 어노테이션(Annotation)
//어노테이션이 있는 클래스
//스프링프레임워크(디자인패턴 + 라이브러리집합)가
//웹 브라우저(크롬)의 요청(request)을 받아들이는 컨트롤러라고
//인지해서 자바 빈(java bean)으로 등록해서 관리
@RequestMapping(value="/buyer")
@Controller
public class BuyerController {
	//DI(의존성 주입), IoC(제어의 역전)
	@Inject
	BuyerService buyerService;
	
	@RequestMapping(value="/list")
	public String list(Model model) {
		
		List<BuyerVO> list = this.buyerService.list();
		
		model.addAttribute("list", list);
		
		//뷰경로 지정, forward방식
		return "buyer/list";
	}
}






