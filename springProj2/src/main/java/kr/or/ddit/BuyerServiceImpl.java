package kr.or.ddit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//어노테이션.. 스프링에게 이 클래스는 서비스 클래스임을 알려줌
//스프링이 자바 빈(java bean)으로 등록하여 관리
@Service
public class BuyerServiceImpl implements BuyerService {
	//DI(의존성 주입)
	@Autowired
	BuyerDao buyerDao;
	
	//거래처 별 상품 목록
	//메소드 재정의
	@Override
	public List<BuyerVO> list(){
		return this.buyerDao.list();
	}
}






