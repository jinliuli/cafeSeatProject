package com.test.cafe.seat.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.cafe.cafe.model.CafeDTO;
import com.test.util.DBUtil;

public class SeatDAO {

	private static SeatDAO dao;

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	private SeatDAO() {

		//개인 테스트용은 cafe로 통일!
		this.conn = DBUtil.open("localhost", "cafe", "java1234");

	}

	public static SeatDAO getInstance() {

		if (dao == null) {
			dao = new SeatDAO();
		}

		return dao;

	}
	
	public CafeDTO selectCafe(String cseq) {
		
		try {
			
			String sql = "select * from vwCafeinfo where cseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cseq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				CafeDTO dto = new CafeDTO();
				dto.setCseq(rs.getString("cseq"));
				dto.setAdseq(rs.getString("adseq"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setIsOpen(rs.getString("isOpen"));
				dto.setAddress(rs.getString("address"));
				dto.setLotAddress(rs.getString("lotaddress"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				
				return dto;				
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	
	public List<Map<String, Object>> getSeatInfo(String cseq){
		try {
					
			String sql = "SELECT s.numSeat AS seatId, "
	                   + "COALESCE(s.attrOutlet, 0) AS outlet, "
	                   + "CASE "
	                   + "WHEN MAX(CASE WHEN r.isCompleted = 'N' THEN 1 ELSE 0 END) = 1 THEN 'booked' "
	                   + "ELSE 'available' END AS status "
	                   + "FROM tblSeat s "
	                   + "LEFT JOIN tblSeatReservation sr ON s.seq = sr.seqSeat "
	                   + "LEFT JOIN tblReservation r ON sr.seqReservation = r.seq "
	                   + "WHERE s.seqCafe = ? "
	                   + "GROUP BY s.numSeat, s.attrOutlet "
	                   + "ORDER BY s.numSeat";
					
			List<Map<String, Object>> seatDetails = new ArrayList<>();
	        
	        pstat = conn.prepareStatement(sql);
	        pstat.setString(1, cseq);
	        rs = pstat.executeQuery();

	        while (rs.next()) {
	            Map<String, Object> seat = new HashMap<>();
	            seat.put("seatId", rs.getInt("seatId"));
	            seat.put("outlet", rs.getInt("outlet"));
	            seat.put("status", rs.getString("status"));
	            
	            
	            seatDetails.add(seat);
	        }
					
					return seatDetails;
					
				} catch (Exception e) {
					e.printStackTrace();
				}
		
			return null;
	}
	
	
	
	
	
	
	

}
