package com.test.cafe.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.cafe.user.model.AdminDTO;
import com.test.util.DBUtil;

public class AdminDAO {

	//정적 변수(자기 자신의 인스턴스를 담을 변수)
	private static AdminDAO dao;
	
	private Connection conn;			//데이터베이스 연결을 위한 객체
	private Statement stat;				//SQL 쿼리 실행을 위한 객체
	private PreparedStatement pstat;	//파라미터가 있는 SQL 쿼리 실행을 위한 객체
	private ResultSet rs;				//쿼리 결과를 담을 객체
	
	public AdminDAO() {
		
		//this.conn = DBUtil.open("localhost", "jang", "java1234"); //데이터 베이스 연결
		
		//프로젝트 샘플용은 cafe@localhost로 통일		
		this.conn = DBUtil.open("localhost", "cafe", "java1234"); //데이터 베이스 연결
		
		 try {

			if (!conn.isClosed()) {
				System.out.println("DB 연결 성공!");
			} else {
				System.out.println("DB 연결 실패!");
			}

		} catch (Exception e) {
			System.out.println("AdminDAO.AdminDAO");
			e.printStackTrace();
		}
		 
	}
	
	public static AdminDAO getInstance() {
		
		if (dao == null) {
			dao = new AdminDAO();	//인스턴스 없으면 생성
		}
		return dao; 				//이미 생성된 인스턴스를 반환
		
	}
	
	//로그인 메서드
	public AdminDTO login(AdminDTO dto) {
		
		try {
			
			String sql = "select * from tblAdmin where id = ? and pw = ?"; 
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) { //결과가 있으면
				
				AdminDTO result = new AdminDTO();	//결과를 담을 AdminDTO 객체 생성
				
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setTel(rs.getString("tel"));
				result.setEmail(rs.getString("email"));
				result.setCompanyId(rs.getString("companyId"));
				result.setIng(rs.getInt("ing"));
				
				System.out.println("관리자 계정 연결 성공");
				return result;	//로그인 성공 시 AdminDTO 객체 반환
				
			} else {
				System.out.println("관리자 계정 연결 실패");
			}
		} catch (Exception e) {
			System.out.println("AdminDAO.login");
			e.printStackTrace();
	
		}
		
		return null;	//로그인 실패 시 null 반환
	}
		
}
