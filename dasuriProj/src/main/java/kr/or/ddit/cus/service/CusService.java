package kr.or.ddit.cus.service;


import java.util.List;
import java.util.Map;

import kr.or.ddit.cus.vo.CusVO;

public interface CusService {
	
	//등록
	public int insert(CusVO cusVO);

	
	//리스트
	public List<CusVO> list(Map<String, Object> map);


	//페이지네이션 카운트
	public int cusCount(Map<String, Object> map);

	//상세보기
	public List<CusVO> detail(String cusNum);


	
	
}
