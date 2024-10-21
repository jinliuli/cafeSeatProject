package com.test.cafe.user.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserDTO {

	private int seq;			
	private String id;
	private String pw;
	private String adminPw;		//관리자 비밀번호
	private String name;
	private String tel;
	private String email;
	private String companyId;
	private int ing;			//가입상태(1:활동, 0:탈퇴)
	
}
