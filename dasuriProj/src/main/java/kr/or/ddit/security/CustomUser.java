package kr.or.ddit.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.cus.vo.UserAuth;
import kr.or.ddit.cus.vo.CusVO;


public class CustomUser extends User {
	
	private CusVO cus;
	
	//loginForm.jsp에서 보내서 받음
	public CustomUser(String username, String password,
		Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	//return member==null?null:new CustomUser(member);
	//사용자가 정의한 MemberVO타입을
	//스프링 시큐리티 UsersDetails 타입으로 변환
//	public CustomUser(MemberVO member) {
//		super(member.getMemberid(),member.getPassword(),
//				member.getAuthList().stream().map(auth->new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
//	}
	public CustomUser(CusVO cus) {
		
		super(cus.getUsername(),cus.getPassword(),getList(cus));
		
		this.cus = cus;
	}
	
	
	public CusVO getMember() {
		return this.cus;
	}	
	
	
	public static List<SimpleGrantedAuthority>getList(CusVO cus){
	//cus: 1) VW_USER(1) 
	//	   2) VW_USER_AUTH(N) 
	List<SimpleGrantedAuthority> authorities =
			new ArrayList<SimpleGrantedAuthority>();
	//authList : {"a001":
	List<UserAuth> authList = cus.getAuthList();
	for(UserAuth auth : authList) {
		SimpleGrantedAuthority authority = new SimpleGrantedAuthority(auth.getAuth());
		authorities.add(authority);
		}
	return authorities;
	}
	
	
}
