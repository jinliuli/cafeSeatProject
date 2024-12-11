package com.test.cafe.seat.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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

		//프로젝트 공용
		//this.conn = DBUtil.open("52.78.251.201", "cafe", "java1234");

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
	
	
	
	
	
	
	

}
