package kr.or.ddit.excel.vo;

public class ExcelVO {
	
	
	private String name;
	private String password;
	private String tel;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "ExcelVO [name=" + name + ", password=" + password + ", tel=" + tel + "]";
	}
	

}
