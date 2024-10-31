package com.test.cafe.menu.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.cafe.menu.model.MenuDTO;
import com.test.util.DBUtil;

public class MenuDAO {

	private static MenuDAO dao;
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	private MenuDAO() {
		this.conn = DBUtil.open("localhost", "cafeseat", "java1234");
	}//MenuDAO DB연동 -----------------------------
	
	public static MenuDAO getInstance() {
		if (dao == null) {
			dao = new MenuDAO();
		}
		
		return dao;
	}//getInstance --------------------------------

	public ArrayList<MenuDTO> list() {
		
		//queryNoParamListReturn
		try {
			
			String sql = "select * from tblProduct";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<MenuDTO> list = new ArrayList<MenuDTO>();
			
			while (rs.next()) {
				
				MenuDTO dto = new MenuDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSeqCategory(rs.getString("seqCategory"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setImage(rs.getString("image"));
				dto.setDescription(rs.getString("description"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}//list -----------------------------------------

	//상세 옵션창
	public MenuDTO get(String seq) {

		try {
			
			String sql = "select * from tblProduct where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				MenuDTO dto = new MenuDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSeqCategory(rs.getString("seqCategory"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setImage(rs.getString("image"));
				dto.setDescription(rs.getString("description"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}//get -------------------------------------------
	
	
	
}















