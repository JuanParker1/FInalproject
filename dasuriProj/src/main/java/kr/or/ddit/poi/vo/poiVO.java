package kr.or.ddit.poi.vo;

public class poiVO {

	private int num;
	private String name;
	private String password;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
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
	@Override
	public String toString() {
		return "poiVO [num=" + num + ", name=" + name + ", password=" + password + "]";
	}
	
	
}
