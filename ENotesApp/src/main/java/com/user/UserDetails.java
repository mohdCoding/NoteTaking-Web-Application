package com.user;

public class UserDetails {

    private Integer id;
	private String name;
	private String email;
	private String password;
    
	public UserDetails() {
		super();
	}

	public UserDetails(String name, String email, String password,Integer id) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.id = id;
		
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	
	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password= password;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}
	
	public Integer getId() {
		return id;
	}
	

	

}
