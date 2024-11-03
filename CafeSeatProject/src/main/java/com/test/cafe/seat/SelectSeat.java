package com.test.cafe.seat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/seat/selectseat.do")
public class SelectSeat extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/seat/selectseat.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
////		req.setCharacterEncoding("UTF-8");
////		
////		String selectedSeats = req.getParameter("seats");
////		String person = req.getParameter("count");
////		
////		System.out.println(selectedSeats);
////		System.out.println(person);
////		
////		
////		ReservationDTO dto = new ReservationDTO();
////		dto.setSeq(selectedSeats);
////		dto.setPerson(person);
////		
////		
////		SeatDAO dao = SeatDAO.getInstance();
////		int result = dao.reservation(dto);
//		
//		
//		
//		
//		
//		
//	}
	
}