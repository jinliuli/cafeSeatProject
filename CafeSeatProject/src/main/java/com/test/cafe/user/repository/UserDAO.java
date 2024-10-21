package com.test.cafe.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.cafe.user.model.UserDTO;
import com.test.util.DBUtil;

public class UserDAO {
	
	//정적 변수(자기 자신의 인스턴스를 담을 변수)
	private static UserDAO dao;
	
	private Connection conn;			//DB와의 연결 나타내는 객체(DB와의 연결 설정 or 종료)
	private Statement stat;				//SQL 쿼리(SELECT, UPDATE, DELETE) 실행하기 위한 객체(SQL문을 DB에 전달 -> 실행결과 가져옴)
	private PreparedStatement pstat;	//매개변수를 포함한 SQL 쿼리(사용자 입력을 포함한 쿼리) 실행하기 위한 객체
	private ResultSet rs;				//SQL 쿼리 실행결과 담는 객체
	
	private UserDAO() {
		this.conn = DBUtil.open("localhost", "jang", "java1234");	//DB에 연결시켜주는 코드
	}

	public static UserDAO getInstance() {
		
		if (dao == null) {
			dao = new UserDAO();	
		}
		
		return dao;
		
		/*	
		
			UserDAO는 DB와 상호작용하는 역할을 하는 클래스 -> 클래스의 인스턴스는 오직 하나만 있어야 함
			=> 클래스의 인스턴스 오직 하나만 존재하도록 보장함
			=> 그 인스턴스를 전역적으로 접근할 수 있게 해줌
	
		 */
	}
	

	//사용자 등록 메서드
	public int register(UserDTO dto) {
		
		try {
		
			String sql = "INSERT INTO tblAdmin(seq, id, pw, adminPw, name, tel, email, companyId, ing) VALUES (?, ?, ?, ?, ?, ?, ?, ?, default)";
			pstat = conn.prepareStatement(sql);	//conn의 prepareStatement 객체를 생성하여 SQL쿼리를 담음
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getAdminPw());
			pstat.setString(4, dto.getName());
			pstat.setString(5, dto.getTel());
			pstat.setString(6, dto.getEmail());
			pstat.setString(7, dto.getCompanyId());
			pstat.setString(8, dto.getIng());
					
		} catch (Exception e) {
			System.out.println(UserDAO.register);
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	//탈퇴 만든다면? 여기에 추가하기
	
	
	//로그인
	public UserDTO login(UserDTO dto) {
		
		//queryParamDTOReturn
		try {
			
			String sql = "select * from tblAdmin where id = ? and pw = ?";
			pstat = conn.prepareStatement(sql);
			pstat = setString(1, dto.getId());
			pstat = setString(1, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				UserDTO result = new UserDTO();
				result.setId(rs.getString("id"));
				//result.setPw(rs.getString("pw"));			//비밀번호는 보안상의 이유로 객체에 저장하지 않는다
				result.setAdminPw(rs.getString("adminPw"));
				result.setName(rs.getString("name"));
				result.setTel(rs.getString("tel"));
				result.setEmail(rs.getString("email"));
				result.setCompayId(rs.getString("companyId"));
				result.setId(rs.getString("ing"));

				return result;
				
			}
			
		}
	}
	

	
	
}
