package kh.web.utils;

public class LoginDTO {
	private int seq;
	private String id;
	private String password;
	private String name;
	public LoginDTO(int seq, String id, String password, String name) {
		super();
		this.seq = seq;
		this.id = id;
		this.password = password;
		this.name = name;
	}
	public LoginDTO() {
		
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
}
