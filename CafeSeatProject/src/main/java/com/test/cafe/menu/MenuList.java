package com.test.cafe.menu;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.cafe.menu.model.MenuDTO;
import com.test.cafe.menu.model.OrderDTO;
import com.test.cafe.menu.model.PaymentDTO;
import com.test.cafe.menu.repository.MenuDAO;
import com.test.cafe.seat.model.ReservationDTO;
import com.test.cafe.seat.model.SeatReservationDTO;

@WebServlet("/menu/menulist.do")
public class MenuList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MenuDAO dao = MenuDAO.getInstance();
		ArrayList<MenuDTO> list = dao.list();

		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/menu/menulist.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		//1.
		String sequser = req.getParameter("sequser");
		String seqReservation = req.getParameter("seqReservation");
		String totalPrice = req.getParameter("totalPrice");
		String seqSeat = req.getParameter("seqSeat");

		String seqProduct = req.getParameter("seqProduct");
		String seqOptions = req.getParameter("seqOptions");
		String totalCount = req.getParameter("totalCount");
		
		//2.
		MenuDAO dao = MenuDAO.getInstance();
		
		OrderDTO orderdto = new OrderDTO();
		orderdto.setSeqProduct(seqProduct);
		orderdto.setSeqOptions(seqOptions);
		orderdto.setTotalCount(totalCount);
		
		SeatReservationDTO seatdto = new SeatReservationDTO();
		seatdto.setSeqSeat(seqSeat);

		ReservationDTO resdto = new ReservationDTO();
		resdto.setSequser("1");
		
		PaymentDTO paydto = new PaymentDTO();
		paydto.setSeqReservation(seqReservation);
		
		int result = dao.orderAdd(orderdto, resdto, paydto, seatdto);
		
		//3.
		if (result == 1) {
			resp.sendRedirect("/cafe/cafe/cafemap.do#");
		} else {
			System.out.println("DB 실패");
		}
		
	}

}
