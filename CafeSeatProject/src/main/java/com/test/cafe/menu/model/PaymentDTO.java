package com.test.cafe.menu.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentDTO {

	private String seq;
	private String seqReservation;
	private String payType;
	private String cardBrand;
	private String totalPrice;
	private String payDate;
	
}
