package com.test.cafe.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.util.DBUtil;

public class UserDAO {

	public static UserDAO dao;
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	private UserDAO() {
		this.conn = DBUtil.open("localhost", "jang", "java1234");
	}
	
	public static UserDAO getInstance() {
		
		if (dao == null) {
			dao = new UserDAO();
			
			return dao;
		}
	}
	
	//
	public int register(UserDTO dto) {
		
		try {
			
			String sql = "INSERT INTO tblAdmin (seq, id, pw) VALUES (?, ?, ?)";
			
			
		}
	}
	
}
