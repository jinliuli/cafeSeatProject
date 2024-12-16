package com.test.cafe.order.model;

import com.test.cafe.menu.model.MenuDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//사용 안함
@Getter
@Setter
@ToString
public class OrderDTO {

	private String seq;
	private String seqPayment;
	private String seqProduct;
	private String seqOptions;
	private String totalCount;

	private MenuDTO seqMenu;
	private MenuDTO seqCategory;
	private MenuDTO name;
	private MenuDTO price;
	private MenuDTO image;
	private MenuDTO description;
	
}