package kr.or.ddit.member.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.CardVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//자바빈 클래스
public class MemberVO {
	private String memberid;
	private String password;
	private String name;
	private String email;
	private String introduction;	//자기소개
	private String memberSertPic;	//회원 증명 사진
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private String enabled;
	
	private String[]     hobbyArray;	//취미
	private List<String> hobbyList;	//취미
	
	private String gender;	//성별
	
	//MemberVO : CardVO = 1 : n 의 관계
	private List<CardVO> cardList;
	//사용자 권한
	private List<MemberAuth> authList;
	
	//기본 생성자
	public MemberVO() {
		super();
	}
	
	public MemberVO(String memberid, String password, String name, 
				    String email, Date regdate) {
		this.memberid = memberid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.regdate = regdate;
	}
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	//비밀번호 변경 기능 구현 시 사용
	public boolean matchPassword(String pwd) {
		return password.contentEquals(pwd);
	}
	
	

	public List<String> getHobbyList() {
		return hobbyList;
	}

	public void setHobbyList(List<String> hobbyList) {
		this.hobbyList = hobbyList;
	}
	

	public String[] getHobbyArray() {
		return hobbyArray;
	}

	public void setHobbyArray(String[] hobbyArray) {
		this.hobbyArray = hobbyArray;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public List<CardVO> getCardList() {
		return cardList;
	}

	public void setCardList(List<CardVO> cardList) {
		this.cardList = cardList;
	}
	
	

	public String getMemberSertPic() {
		return memberSertPic;
	}

	public void setMemberSertPic(String memberSertPic) {
		this.memberSertPic = memberSertPic;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	
	

	public List<MemberAuth> getAuthList() {
		return authList;
	}

	public void setAuthList(List<MemberAuth> authList) {
		this.authList = authList;
	}

	@Override
	public String toString() {
		return "MemberVO [memberid=" + memberid + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", introduction=" + introduction + ", memberSertPic=" + memberSertPic + ", regdate=" + regdate
				+ ", enabled=" + enabled + ", hobbyArray=" + Arrays.toString(hobbyArray) + ", hobbyList=" + hobbyList
				+ ", gender=" + gender + ", cardList=" + cardList + ", authList=" + authList + "]";
	}

}






