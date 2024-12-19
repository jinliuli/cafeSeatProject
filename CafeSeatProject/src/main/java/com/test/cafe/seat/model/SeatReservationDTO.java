package com.test.cafe.seat.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SeatReservationDTO {
	
	private String seq;
	private String seqReservation;
	private String seqSeat;
	
	private String[] selectedSeats;

}
