package kr.or.ddit;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

//자바빈 클래스
public class CardVO {
	private String memberid;
	private String no;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date validMonth;
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public Date getValidMonth() {
		return validMonth;
	}
	public void setValidMonth(Date validMonth) {
		this.validMonth = validMonth;
	}
	@Override
	public String toString() {
		return "CardVO [memberid=" + memberid + ", no=" + no + ", validMonth=" + validMonth + "]";
	}
	
}
