package com.test.cafe.menu.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MenuDTO {

	private String seq;
	private String seqCategory;
	private String name;
	private String price;
	private String image;
	private String description;
	
}
