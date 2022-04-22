package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

//AccessDeniedHandler를 구현할 클래스를 선언.
//override할 handle 메서드에 보유 권한별 동작을 정의할 수 있다.
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	private static final Logger logger=
			LoggerFactory.getLogger(CustomAccessDeniedHandler.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		logger.error("handle");
		
		response.sendRedirect("/accessError");
	}
	
	
}
