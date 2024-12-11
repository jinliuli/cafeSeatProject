package com.test.cafe.cafe.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.cafe.cafe.model.CafeDTO;
import com.test.cafe.user.repository.UserDAO;
import com.test.util.DBUtil;

public class CafeDAO {
	
	//정적 변수(자기 자신의 인스턴스를 담을 변수)
	private static CafeDAO dao;
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	private CafeDAO() {

		//개인 테스트용은 cafe로 통일!
		this.conn = DBUtil.open("localhost", "cafe", "java1234");
		
		//프로젝트 공용
		//this.conn = DBUtil.open("52.78.251.201", "cafe", "java1234");
		
	}
	
	public static CafeDAO getInstance() {
		
			
			if (dao == null) {
				dao = new CafeDAO();	//인스턴스 없으면 생성
			}
			return dao; 				//이미 생성된 인스턴스를 반환
			
		
		
	}

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
