package com.test.cafe.order.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.util.DBUtil;

public class OrderDAO {

	private static OrderDAO dao;

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	private OrderDAO() {

		//개인 테스트용은 cafe로 통일!
		//this.conn = DBUtil.open("localhost", "cafe", "java1234");

		//프로젝트 공용
		this.conn = DBUtil.open("52.78.251.201", "cafe", "java1234");

	}

	public static OrderDAO getInstance() {

		if (dao == null) {
			dao = new OrderDAO();
		}

		return dao;

	}

}
