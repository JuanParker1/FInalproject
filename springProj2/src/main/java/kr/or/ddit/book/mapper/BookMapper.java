package kr.or.ddit.book.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.book.vo.BookVO;

public interface BookMapper {
	public int insert(BookVO bookVO);
	
	//책 상세보기
	public BookVO detail(BookVO bookVO);
	
	//책 수정하기
	public boolean update(BookVO bookVO);
	
	//책 목록
	//map : {"keyword","방원"}
	public List<BookVO> list(Map<String, Object> map);
	
	//책 삭제하기
	public boolean delete(Map<String,Object> map);
}





