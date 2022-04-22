package kr.or.ddit.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.cus.mapper.CusMapper;
import kr.or.ddit.cus.vo.CusVO;


public class CustomUserDetailService implements UserDetailsService{
	private static final Logger logger =
			LoggerFactory.getLogger(CustomUserDetailService.class);
	@Autowired
	private CusMapper cusMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		logger.warn("Load User by Username : "+userName);
		//userName: 로그인한 사람의 정보. 사용자명이 아니라 사용자의 아이디를 의미
		//사용자 아이디를 조건으로 넘기면 해당 사용자 1행이 MemberVO 객체타입으로 리턴된다.
		CusVO cus = cusMapper.read(userName);

		logger.warn("queried by member mapper : "+cus.toString());
		//member값이 null일때 새로운 커스텀유저객체 생성
		return cus==null?null:new CustomUser(cus);
//		return member == null?null:new CustomUser();
	}
	
}
