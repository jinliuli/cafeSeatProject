package com.test.cafe.user.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {

	private String seq;
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private int ing;
	
}
