package kr.or.ddit.cus.vo;

public class UserAuth {
	private String username;
	private String auth;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "CusAuth [username=" + username + ", auth=" + auth + "]";
	}
	
}
