package com.test.cafe.seat.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.util.DBUtil;

public class SeatDAO {
	
	private static SeatDAO dao;
	
	
	// 멤버선언
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	
	private SeatDAO() {

		//개인 테스트용은 cafe로 통일!
		//this.conn = DBUtil.open("localhost", "cafe", "java1234");
		
		//프로젝트 공용
		this.conn = DBUtil.open("52.78.251.201", "cafe", "java1234");
		
	}
	
	public static SeatDAO getInstance() {
		
		
		if(dao==null) {
		dao = new SeatDAO(); //자기 자신을 만든다
		}
		
		
		return dao; //만든걸 리턴한다		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
