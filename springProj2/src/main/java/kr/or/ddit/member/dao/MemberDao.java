package kr.or.ddit.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.vo.MemberVO;

@Repository
public class MemberDao {
	
	//sqlSessionTemplate 타입 객체를 BookDao 객체에 주입(사용가능하게)함
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//회원 가입
	public int insert(MemberVO memberVO) {
		//namespace.id
		//result가 0이면 입력 실패, 1이면 입력 성공
		int result = this.sqlSessionTemplate.insert("member.insert", memberVO);
		
		return result;
	}
	//회원정보 목록
	public List<MemberVO> select(){
		//namespace.id
		return this.sqlSessionTemplate.selectList("member.select");
	}
}






