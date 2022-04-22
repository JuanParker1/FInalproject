package kr.or.ddit.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;

/*
 * 비밀번호 암호화 처리기
 * - 스프링 시큐리티 5부터는 기본적으로 PasswordEncoder를 지정해야함
 * - 그러므로 원래는 DB에 비밀번호를 암호화하여 저장해야한다.
 * - 연습이므로 암호화하지 않고 insert을 할 것. -> 로그인시 오류 발생
 * - 그래서 암호화를 하지 않는 PasswordEncoder를 메서드 재정의하여 직접 구현하면
 *   로그인 시 암호화를 고려하지 않으므로 로그인이 잘 된다.
 */

public class CustomNoOpPasswordEncoder implements PasswordEncoder{
	
	private static final Logger logger = 
			LoggerFactory.getLogger(CustomNoOpPasswordEncoder.class);
	
	@Override
	public String encode(CharSequence rawPassword) {
		logger.warn("before encode :"+rawPassword);
		//CharSequence를 통하여 들어오는 문자값을 암호화해야하지만
		//toString값으로 빼기때문에 순수 입력값이 출력된다.
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		logger.warn("rawPassword: "+rawPassword+"/ encodedPassword : "+encodedPassword);
		
		//맞는지 다른지를 따짐
		return rawPassword.toString().equals(encodedPassword);
	}

}
