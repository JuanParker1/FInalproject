package kr.or.ddit.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;

//spring 프레임워크가 자바 빈(=객체)으로 등록해서 관리
@Service
public class MemberServiceImpl implements MemberService {
	//DI(의존성 주입)
	//데이터베이스에 접근을 위해 MemberDao 인스턴스를 주입받음
	@Autowired
	MemberDao memberDao;
	
	//회원가입
	@Override
	public int insert(MemberVO memberVO) {
		return memberDao.insert(memberVO);
	}
	
	//회원목록
	@Override
	public List<MemberVO> select(){
		return memberDao.select();
	}

}





