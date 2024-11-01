package com.test.cafe.cafe.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.cafe.cafe.model.CafeDTO;
import com.test.util.DBUtil;

public class CafeDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public CafeDAO() {
		this.conn = DBUtil.open("localhost", "yul", "java1234");
		
	}
	
//	public static CafeDAO getInstance() {
//		
//		
//	}

	public ArrayList<CafeDTO> listCafe() {
		
		try {
			
			String sql = "select * from vwCafeinfo";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<CafeDTO> list = new ArrayList<CafeDTO>();
			
			while (rs.next()) {
				//레코드 1줄 > DTO 1개
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
				list.add(dto);
			}
			
			return list;

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
