package com.test.cafe.menu;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	private static Connection conn = null;

	public static Connection open() {
	
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		//학원용
		//String id = "cafeseat";
		
		//집용
		//String id = "sideproject";

		//프로젝트 샘플용
		//String id = "cafe";
		
		
		String pw = "java1234";
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, id, pw);
			//conn.setAutoCommit(false); //자동 커밋 설정 (false 자동 commit X)
			
			return conn;
			
		} catch (Exception e) {
			System.out.println("DBUtil.open");
			e.printStackTrace();
		}
		
		return null;
		
	}//open

	public static Connection open(String serverIP, String id, String pw) {
		
		String url = "jdbc:oracle:thin:@" + serverIP + ":1521:xe";
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, id, pw);
			//conn.setAutoCommit(false); //자동 커밋 설정 (false 자동 commit X)
			
			return conn;
			
		} catch (Exception e) {
			System.out.println("DBUtil.open");
			e.printStackTrace();
		}
		
		return null;
		
	}//open
	
	public static boolean close() {
		
		try {
			
			if (conn != null) {
				conn.close();
				return conn.isClosed();
			}

		} catch (Exception e) {
			System.out.println("DBUtil.close");
			e.printStackTrace();
		}
		
		return false; //조금 이상..(찜찜)
		
	}//close
}
