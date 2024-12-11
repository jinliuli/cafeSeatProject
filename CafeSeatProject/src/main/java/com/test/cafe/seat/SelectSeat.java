package com.test.cafe.seat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.cafe.cafe.model.CafeDTO;
import com.test.cafe.seat.repository.SeatDAO;

@WebServlet("/seat/selectseat.do")
public class SelectSeat extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String cseq = (String) session.getAttribute("cseq");
		
		SeatDAO dao = SeatDAO.getInstance();
		
		CafeDTO dto = dao.selectCafe(cseq);
		req.setAttribute("dto", dto);
		
		List<Map<String, Object>> seatDetails = dao.getSeatInfo(cseq);
		
		
		// 디버깅: 모든 좌석 정보 출력
        System.out.println("Seat Details Size: " + seatDetails.size());
        for (Map<String, Object> seat : seatDetails) {
            System.out.println("Seat: " + seat);
        }
		
		
		req.setAttribute("seatDetails", seatDetails);
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/seat/selectseat.jsp");
		dispatcher.forward(req, resp);
	}
	
	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		
//	}
	
	
}