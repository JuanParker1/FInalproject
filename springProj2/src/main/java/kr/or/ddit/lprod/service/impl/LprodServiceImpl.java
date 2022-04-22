package kr.or.ddit.lprod.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.BuyerVO;
import kr.or.ddit.lprod.mapper.LprodMapper;
import kr.or.ddit.lprod.service.LprodService;
import kr.or.ddit.lprod.vo.LprodVO;
import kr.or.ddit.member.vo.MemberVO;

@Service
public class LprodServiceImpl implements LprodService {
	//DI
	@Autowired
	private LprodMapper lprodMapper;
	
	//상품분류 별 거래처 목록
	//메소드 재정의
	@Override
	public List<LprodVO> list(Map<String,Object> map){
		return this.lprodMapper.list(map);
	}
	
	//상품분류 별 거래처 목록 행의 수
	@Override
	public int listCount(Map<String, Object> map) {
		return this.lprodMapper.listCount(map);
	}
	
	//거래처 상세 정보
	@Override
	public BuyerVO detail(String buyerId) {
		return this.lprodMapper.detail(buyerId);
	}
	
	//거래처 수정
	@Override
	public int modify(BuyerVO buyerVO) {
		return this.lprodMapper.modify(buyerVO);
	}
	
	//로그인 
	//메소드 재정의
	@Override
	public MemberVO loginPost(MemberVO memberVO) {
		return lprodMapper.loginPost(memberVO);
	}
}










