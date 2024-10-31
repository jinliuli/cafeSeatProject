package com.test.cafe.seat.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.cafe.seat.model.ReservationDTO;
import com.test.cafe.seat.model.SeatReservationDTO;
import com.test.util.DBUtil;

public class SeatDAO {
	
	private static SeatDAO dao;
	
	
	// 멤버선언
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	
	private SeatDAO() {
		
		this.conn = DBUtil.open("localhost", "cafeproject", "java1234");
		
	}
	
	public static SeatDAO getInstance() {
		
		
		if(dao==null) {
		dao = new SeatDAO(); //자기 자신을 만든다
		}
		
		
		return dao; //만든걸 리턴한다		
	}

//	public int reservation(ReservationDTO dto) {
//		try {
//			String sql = "insert into tblReservation (seq, seqUser, date, timeStart, timeEnd, seatNum, person) values(seqReservation.nextVal, '1', default, default, default, ?, ?)";
//				
//			pstat = conn.prepareStatement(sql);
//			pstat.setString(1, dto.getSeatNum());
//			pstat.setString(2, dto.getPerson());
//			
//			return pstat.executeUpdate();
//				
//		} catch (Exception e) {
//			
//		}
//		return 0;
//	}

	// 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
