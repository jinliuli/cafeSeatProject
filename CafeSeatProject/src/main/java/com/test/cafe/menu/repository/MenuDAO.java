package com.test.cafe.menu.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.cafe.menu.model.MenuDTO;
import com.test.cafe.menu.model.OrderDTO;
import com.test.cafe.menu.model.PaymentDTO;
import com.test.cafe.seat.model.ReservationDTO;
import com.test.cafe.seat.model.SeatReservationDTO;
import com.test.util.DBUtil;

public class MenuDAO {

	private static MenuDAO dao;
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MenuDAO() {

		//개인 테스트용은 cafe로 통일!
		this.conn = DBUtil.open("localhost", "cafe", "java1234");
		
		//프로젝트 공용
		//this.conn = DBUtil.open("52.78.251.201", "cafe", "java1234");
		
		
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
	
	
	public int orderAdd(OrderDTO orderdto, ReservationDTO resdto, PaymentDTO paydto, SeatReservationDTO seatdto) {
		
		try {
			
			int resultRes = resAdd(resdto);
			int resultSeat = seatAdd(seatdto, resultRes);
			int resultPay = payAdd(paydto, resultRes);
			
			String sql = "INSERT INTO tblOrder(seq, seqPayment, seqProduct, seqOptions, totalCount) VALUES(seqOrder.nextVal, ?, ?, 1, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, resultPay);
			pstat.setString(2, orderdto.getSeqProduct());
			/* pstat.setString(2, orderdto.getSeqOptions()); */
			pstat.setString(3, orderdto.getTotalCount());

			return pstat.executeUpdate();		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}// ----------------------------------------------------------------------------------------------------------------------------

	public int payAdd(PaymentDTO paydto, int resultRes) {

		try {
			
			String sql = "INSERT INTO tblPayment(seq, seqReservation, payType, cardBrand, totalPrice, payDate) VALUES(seqPayment.nextVal, ?, '간편결제', '카카오페이', ?, '2024-11-02')";

			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, resultRes);
			pstat.setString(2, paydto.getTotalPrice());

			if (pstat.executeUpdate() == 1) {
				sql = "select max(seq) from tblPayment";
				pstat = conn.prepareStatement(sql);
				
				return pstat.executeUpdate();
			} else {
				return 0;
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}// ----------------------------------------------------------------------------------------------------------------------------
	
	public int resAdd(ReservationDTO resdto) {
		
		try {
			
			String sql = "INSERT INTO tblReservation(seq,seqUser,useDate,timeStart,timeEnd) VALUES(seqReservation.nextVal,1,TO_DATE('2024-11-02', 'YYYY-MM-DD'),default, default)";

			pstat = conn.prepareStatement(sql);
			/* pstat.setString(1, resdto.getSequser()); */

			if (pstat.executeUpdate() == 1) {
				sql = "select max(seq) from tblReservation";
				pstat = conn.prepareStatement(sql);
				
				return pstat.executeUpdate();
			} else {
				return 0;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}// ----------------------------------------------------------------------------------------------------------------------------
	
	public int seatAdd(SeatReservationDTO seatdto, int resultRes) {
	
		try {
			
			String sql = "INSERT INTO tblSeatReservation(seq,seqReservation,seqSeat) VALUES(seqSeatReservation.nextVal,?,?)";

			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, resultRes);
			pstat.setString(2, seatdto.getSeqSeat());

			return pstat.executeUpdate();		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}// ----------------------------------------------------------------------------------------------------------------------------
	
}
	















