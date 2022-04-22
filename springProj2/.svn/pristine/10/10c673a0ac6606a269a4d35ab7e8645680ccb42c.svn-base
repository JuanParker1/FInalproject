package kr.or.ddit.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.book.service.BookService;
import kr.or.ddit.book.vo.BookVO;
//컨트롤러 어노테이션(Annotation)
//어노테이션이 있는 클래스
//스프링프레임워크(디자인패턴 + 라이브러리집합)가
//웹 브라우저(크롬)의 요청(request)을 받아들이는 컨트롤러라고
//인지해서 자바 빈(java bean)으로 등록해서 관리
@Controller
public class BookController {
	private static final Logger logger = 
			LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	BookService bookService;
	
	//Model : 컨트롤러가 반환할 데이터(VO객체, List, List<VO>, Map, List<Map>, JSONG)를 담당
	//        반환? 1) forward(데이터 담기O)   2) redirect(데이터 담기X)
	//View : 화면 담당
	//localhost:8090/create
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public ModelAndView create(@ModelAttribute("bookVO") BookVO bookVO) {
		ModelAndView mav = new ModelAndView();
		//localhost:8090/WEB-INF/views/book/create.jsp
		//servlet-context.xml에서..
		//prefix : /WEB-INF/views/
		mav.setViewName("book/create");
		//suffix : .jsp
		return mav;
	}
	
	//HTTP파라미터 : 웹 브라우저(크롬)에서 서버(톰캣)로 전달하는 데이터
	//			     제목, 분류, 가격..
	//?title=검은태양&category=드라마&price=10000
	//스프링은 HTTP파라미터를 자바 메소드의 파라미터로 변환해서 컨트롤러 메소드를 호출해줌
	//map으로 받을 때에는 RequestParam 어노테니션..
	//{"title":"톰소여의모험","category":"소설"....
	//vo로 받을 때에는 ModelAttribute 어노테이션..
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public ModelAndView createPost(ModelAndView mav,
			@ModelAttribute BookVO bookVO) {
		logger.info("bookVO : " + bookVO.toString());
		
		//20220127숙제
		//map -> BookVO로 변환(public BookVO mapToVo(map)..메소드로 처리)
		//result : insert된 book_id의 값(p.k)
		int result = bookService.insert(bookVO);
		logger.info("result : " + result);
		
		if(result==0) {	//insert가 안됨 -> 책 입력 화면으로 돌아가라
			//데이터를 담지 않고 단순히 되돌아감..
			mav.setViewName("redirect:/create");
		}else {	//insert 성공 -> 상세 페이지를 요청
			//?bookId=1 <- 쿼리스트링/파라미터목록
			mav.setViewName("redirect:/detail?bookId="+result);
		}
		
		return mav;
	}
	
	//book 상세 보기
	//파라미터 목록(쿼리스트링) : bookId=1
	//map = {bookId,1}
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String,Object> map) {
		logger.info("map : " + map);
		
		BookVO bookVO = new BookVO();
		bookVO.setBookId(Integer.parseInt((String)map.get("bookId")));
		//{bookId:1,나머지는null}
		logger.info("bookVO(before) : " + bookVO.toString());
		
		//상세보기 데이터 가져오기
		bookVO = this.bookService.detail(bookVO);
		//{bookId:1,나머지도 있음}
		logger.info("bookVO(after) : " + bookVO.toString());		
		
		ModelAndView mav = new ModelAndView();
		// book/detail : 뷰 경로
		//forwarding
		mav.addObject("data", bookVO);	//데이터를 담음
		mav.setViewName("book/detail");
		
		return mav;
	}
	
	// /update?bookId=3
	//쿼리스트링 : bookId=3
	//map : {bookId:3}
	//책 수정 화면 = 책 입력 화면(jsp) + 책 상세 서비스 로직
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, String> map) {
		logger.info("map : " + map);
		//책 상세 서비스 로직 사용
		BookVO bookVO = new BookVO();
		bookVO.setBookId(Integer.parseInt(map.get("bookId")));
		bookVO = this.bookService.detail(bookVO);
		
		ModelAndView mav = new ModelAndView();
		//request.setAttribute("data", bookVO);
		mav.addObject("data", bookVO);
		//forwarding
		mav.setViewName("book/update");
		
		return mav;
	}
	
	//책 수정 post
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public ModelAndView updatePost(@ModelAttribute BookVO bookVO,
			ModelAndView mav) {
		logger.info("bookVO : " + bookVO.toString());
		//true : update성공, false : update실패
		boolean isUpdateSuccess = this.bookService.update(bookVO);
		
		if(isUpdateSuccess) { //성공
			//상세페이지로 이동
			mav.setViewName("redirect:/detail?bookId="+bookVO.getBookId());
		}else {//실패
			//책 수정 화면으로 돌아가기
			//방법1)
//			mav.setViewName("redirect:/update?bookId="+bookVO.getBookId());
			//방법2)
			Map<String,String> map = new HashMap<String, String>();
			map.put("bookId", ""+bookVO.getBookId());
			mav = this.update(map);
		}
		return mav;
	}
	//http://localhost:8090/list?keyword=어쩌구
	//map : {"keyword":"어쩌구"}
	@RequestMapping(value="/list" ,method=RequestMethod.GET)
	public ModelAndView list(@ModelAttribute BookVO bookVO, ModelAndView mav,
			@RequestParam Map<String, Object> map) {
		List<BookVO> list = this.bookService.list(map);
		logger.info("bookVO : " + bookVO.toString());
		// 데이터를 View (jsp) 에 전달 할 수 있도록 mav 객체에 add 함
		mav.addObject("data",list);
		//forwarding
		mav.setViewName("book/list");
		return mav;
	}
	

	@RequestMapping(value="/make", method=RequestMethod.GET)
	public ModelAndView make() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/make");
		return mav;
	}
	//RequestMapping어노테이션 : 웹 브라우저의 요청에 실행되는 자바 메소드를 지정해줌
	//method : 속성. http 요청 메소드를 의미함
	//		  1) GET : 데이터를 변경하지 않는 경우 사용
	//		  2) POST : 데이터가 변경될 경우 사용
	//웹 브라우저에 화면을 보여줄 뿐 데이터의 변경이 일어나지 않으므로 GET 메소드를 사용한것임
	//jjajang() 메소드는 웹 브라우저에서 /jjajang 주소가 GET 방식으로 입력되었을 때
	// book/jjajang 경로의 뷰를 보여줌
	@RequestMapping(value="/jjajang", method=RequestMethod.GET)
	public ModelAndView jjajang(ModelAndView mav) {
		//book/jjajang : 뷰의 경로
		mav.setViewName("book/jjajang");
		return mav;
	}
	
	//delete 	<form method ="post" action ="/delete">
	
	@RequestMapping(value ="/delete" , method = RequestMethod.POST )
	public ModelAndView deletePost(@RequestParam Map<String,Object> map , ModelAndView mav) {
		//map : {bookId =3}
		boolean isDeleteSuccess = this.bookService.delete(map);
		
		if(isDeleteSuccess) {//성공
			//목록화면으로 redirect(요청 흐름을 이동시킴, 단, 데이터는 이동 못함.)
			mav.setViewName("redirect:/list");
		}else {//실패
			//상세화면으로 redirect
			mav.setViewName("redirect:/detail?bookId="+map.get("bookId").toString());
		}
		return mav;
	}
	
	//map -> BookVO로 변환
	public BookVO mapToVo(Map<String, Object> map) {
		BookVO bookVO = new BookVO();
		bookVO.setTitle((String)map.get("title"));
		bookVO.setCategory((String)map.get("category"));
		bookVO.setPrice(Integer.parseInt((String)map.get("price")));
		return bookVO;
	}
}









