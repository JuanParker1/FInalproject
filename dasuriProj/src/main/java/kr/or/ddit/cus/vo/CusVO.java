package kr.or.ddit.cus.vo;

import java.util.Arrays;
import java.util.List;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

//자바빈 클래스(고객)
//1) cus테이블
//2) vw_cus 뷰테이블
public class CusVO {
	
	private String cusNum;
	
	@NotBlank
	private String cusNm;
	
	@NotBlank
	private String cusPost;
	@NotBlank
	private String cusAddr;
	@NotBlank
	private String cusAddr2;
	
	@NotEmpty
	private String cusPw;//비밀번호
	
	@NotBlank
	@Pattern(regexp = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$", message = "핸드폰번호 양식 01x-xxxx-xxxx")
	private String cusPne;
	
	//다중 파일 객체
	private MultipartFile[] uploadFile;
	
	//다중 파일 업로드 객체
	private List<AttachFilesVO> attachFilesVO;
	
	private String uploadFileName;
	
	
	
	private int rnum;
	private String username;
	private String password;
	private String sal;
	private String enabled;
	
	//CusVO: UserAuth = 1:N
	
	private List<UserAuth>authList;
	
	//----------------------getter / setter-------------------------


	public String getCusNm() {
		return cusNm;
	}

	public String getCusNum() {
		return cusNum;
	}

	public void setCusNum(String cusNum) {
		this.cusNum = cusNum;
	}

	public void setCusNm(String cusNm) {
		this.cusNm = cusNm;
	}

	public String getCusPost() {
		return cusPost;
	}

	public void setCusPost(String cusPost) {
		this.cusPost = cusPost;
	}

	public String getCusAddr() {
		return cusAddr;
	}

	public void setCusAddr(String cusAddr) {
		this.cusAddr = cusAddr;
	}

	public String getCusAddr2() {
		return cusAddr2;
	}

	public void setCusAddr2(String cusAddr2) {
		this.cusAddr2 = cusAddr2;
	}

	public String getCusPne() {
		return cusPne;
	}

	public void setCusPne(String cusPne) {
		this.cusPne = cusPne;
	}

	public MultipartFile[] getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile[] uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<AttachFilesVO> getAttachFilesVO() {
		return attachFilesVO;
	}

	public void setAttachFilesVO(List<AttachFilesVO> attachFilesVO) {
		this.attachFilesVO = attachFilesVO;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getCusPw() {
		return cusPw;
	}

	public void setCusPw(String cusPw) {
		this.cusPw = cusPw;
	}

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSal() {
		return sal;
	}

	public void setSal(String sal) {
		this.sal = sal;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	
	public List<UserAuth> getAuthList() {
		return authList;
	}

	public void setAuthList(List<UserAuth> authList) {
		this.authList = authList;
	}

	@Override
	public String toString() {
		return "CusVO [cusNum=" + cusNum + ", cusNm=" + cusNm + ", cusPost=" + cusPost + ", cusAddr=" + cusAddr
				+ ", cusAddr2=" + cusAddr2 + ", cusPw=" + cusPw + ", cusPne=" + cusPne + ", uploadFile="
				+ Arrays.toString(uploadFile) + ", attachFilesVO=" + attachFilesVO + ", uploadFileName="
				+ uploadFileName + ", rnum=" + rnum + ", username=" + username + ", password=" + password + ", sal="
				+ sal + ", enabled=" + enabled + ", authList=" + authList + "]";
	}


		
}
