package com.test.cafe.order.repository;

public class OrderDAO {

		//개인 테스트용은 cafe로 통일!
		//this.conn = DBUtil.open("localhost", "cafe", "java1234");
		
		//프로젝트 공용
		this.conn = DBUtil.open("52.78.251.201", "cafe", "java1234");

}
