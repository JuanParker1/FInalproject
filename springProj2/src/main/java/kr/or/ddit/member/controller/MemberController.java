package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;
//클래스 레벨 매핑
@RequestMapping(value="/member")
@Controller
public class MemberController {
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberController.class);
	//DI(Dependency Injection : 의존성 주입)
	@Autowired
	MemberService memberService;
	
	//컨트롤러의 insert메서드의 매개변수로 자바빈즈 객체가 전달이 되면 
	//기본적으로 다시 화면(view(jsp))으로 전달함
	//컨트롤러와 뷰 사이에 자바빈즈 객체를 서로 공유함
	//1) 폼 객체의 속성명을 직접 지정
	//2) 폼 객체의 속성명은 직접 지정하지 않으면 * 폼 객체의 클래스명의 맨 처음 문자를 소문자로 변환하여 처리
	//3) ModelAttribute 애너테이션으로 폼 객체의 속성명을 gaeddongi라고 지정했다면.. 
	//스프링 폼의 modelAttribute 속성의 값도 똑같이 gaeddongi라고 작성해줘야 함
	//MemberVO -> memberVO
	@RequestMapping("/insert")
	public String insert(Model model, @ModelAttribute("memberVO") MemberVO memberVO) {
		//modelAttribute="memberVO"
		//폼 객체의 속성명과 스프링 폼 태그의 modelAttribute 속성값이 같아야 함
//		model.addAttribute("memberVO", new MemberVO());
		//폼 객체의 프로퍼티 값을 지정..
		//모델을 통해서 뷰(jsp)로 전달이 됨
		memberVO.setMemberid("a001");
		memberVO.setName("개똥이");
		//<form:password -> 값을 설정해서 뷰(jsp)에 전달하더라도 패스워드 필드에 반영되지 않음
		memberVO.setPassword("java");
		memberVO.setEmail("test@test.com");
		
		String introduction = "안녕하세요.\n반갑습니다.";
		memberVO.setIntroduction(introduction);
		
		//취미 세팅
		Map<String, String> hobbyMap = new HashMap<String, String>();
		hobbyMap.put("01", "야구");
		hobbyMap.put("02", "BTS Music");
		hobbyMap.put("03", "스파이더맨 시리즈");
		
		model.addAttribute("hobbyMap", hobbyMap);
		
		//성별 세팅
		Map<String,String> genderMap = 
				new HashMap<String, String>();
		genderMap.put("Male", "남성");
		genderMap.put("Female", "여성");
		genderMap.put("Other", "기타");
		
		//session.setAttribute("genderMap",genderMap);
		model.addAttribute("genderMap", genderMap);
		
		return "member/joinForm";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertPost(@ModelAttribute MemberVO memberVO) {
		
		logger.info(memberVO.getMemberid());
		logger.info(memberVO.getName());
		logger.info(memberVO.getPassword());
		logger.info(memberVO.getEmail());
		logger.info(memberVO.getIntroduction());
		List<String> hobbyList = memberVO.getHobbyList();
		for(String hobby : hobbyList) {
			logger.info(hobby);
		}
		String[] hobbyArray = memberVO.getHobbyArray();
		for(String str : hobbyArray) {
			logger.info(str);
		}
		//성별
		logger.info(memberVO.getGender());
		
		//뷰의 경로(mav.setViewName("member/result"))
		//forwarding
		return "member/result";
	}
	
//  골뱅이RequestMapping(value="/member/list", method=RequestMethod.GET)
//	public ModelAndView list(ModelAndView mav) {
	//속성이 하나이면 생략이 가능함
	@RequestMapping("/list")
	public String list(Model model) {
		List<MemberVO> memberVO = this.memberService.select();
		
		//1) 데이터
		model.addAttribute("list", memberVO);
		
		//2) 뷰의 경로. forwarding방식(데이터를 끌어감)
		return "member/list";
	}
	
}








