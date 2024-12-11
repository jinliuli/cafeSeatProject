package com.test.cafe.menu.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDTO {

	private String seq;
	private String seqPayment;
	private String seqProduct;
	private String seqOptions;
	private String totalCount;

	private String sequser;
	private String seqReservation;
	private String totalPrice;
	private String seqSeat;
	
	
}
