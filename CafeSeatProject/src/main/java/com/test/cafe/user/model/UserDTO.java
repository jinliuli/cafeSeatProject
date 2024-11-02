package com.test.cafe.user.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {

	private String id;
	private String pw;
	private String checkPw;
	private String name;
	private String tel;
	private String email;
	private int ing;
	
}
