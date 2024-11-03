package com.test.cafe.seat.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationDTO {
	
	
	private String seq;
	private String seqUser;
	private String useDate;
	private String timeStart;
	private String timeEnd;	

}
