package kr.or.ddit.cus.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cus.vo.AttachFilesVO;
import kr.or.ddit.cus.vo.CusVO;

public interface CusMapper {

	//고객등록
	public int insert(CusVO cusVO);
	
	//다중 파일 업로드
	public int insertAttachFiles(List<AttachFilesVO> attachFilesVO);
	
	//고객리스트
	public List<CusVO>list(Map<String, Object>map);
	
	//페이지네이션을 위한 카운트
	public int cusCount (Map<String, Object>map);
	
	//상세보기(cusNum을 통해 넘어감)
	public List<CusVO>detail (String cusNum);

	//스프링시큐리티의 로그인 처리
	public CusVO read(String userName);
	
}
