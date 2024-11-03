package com.test.cafe.user.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminDTO {
	
	private String seq;
	private String id;
	private String pw;
//	private String checkPw;
	private String name;
	private String tel;
	private String email;
	private String companyId;
	private int ing;
	
}
