package com.test.cafe.menu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.cafe.menu.model.MenuDTO;
import com.test.cafe.menu.model.OrderDTO;
import com.test.cafe.menu.model.PaymentDTO;
import com.test.cafe.menu.repository.MenuDAO;
import com.test.cafe.order.repository.OrderDAO;
import com.test.cafe.seat.model.ReservationDTO;
import com.test.cafe.seat.model.SeatReservationDTO;
import com.test.cafe.user.model.UserDTO;

@WebServlet("/menu/menulist.do")
public class MenuList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        List<OrderDTO> cart = (List<OrderDTO>) session.getAttribute("cart");
        

        // 세션에서 cart 데이터를 가져옵니다. 만약 cart가 없으면 새로 생성합니다.
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        
		MenuDAO dao = MenuDAO.getInstance();
		ArrayList<MenuDTO> list = dao.list();

		req.setAttribute("list", list);
        req.setAttribute("cart", cart);
        
        OrderDAO orderdao = OrderDAO.getInstance();
        
        //OrderDTO dto = 
		
		//req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/menu/menulist.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		System.out.println("POST 시작!");
		
		String temperature = req.getParameter("temperature");
		String size = req.getParameter("size");
		String iceamount = req.getParameter("iceamount");
		String shotadd = req.getParameter("shotadd");
		String totalCount = req.getParameter("totalCount");
		String seqOptions = "" + temperature + size + iceamount + shotadd;
		
	    if (temperature != null && size != null && iceamount != null && shotadd != null) {
	        // User has selected additional options, not yet confirming
	        System.out.println("POST: User selected options for an item.");
	        
	        // Optionally store these selections temporarily (e.g., in session or DB)
	        req.setAttribute("seqOptions", seqOptions);
	        resp.sendRedirect("/cafe/menu/menulist.do#cafeseat");
	    } else {
	        // Handle case where some options are missing or form was incomplete
	        System.out.println("POST: Incomplete selection, redirecting back.");
	        return;
	    }
		
		System.out.println(temperature);
		System.out.println(size);
		System.out.println(iceamount);
		System.out.println(shotadd);
		System.out.println(totalCount);
		System.out.println(seqOptions);
		
		
		List<OrderDTO> cart = (List<OrderDTO>) session.getAttribute("cart");
		
	    if (cart == null || cart.isEmpty()) {
	        // Handle the case where the cart is empty or not set
	        
	        return;
	    }
	    
		
		OrderDTO dto = cart.get(0);
		
		String seqProduct = dto.getSeqProduct();
		//String seqOptions= dto.getSeqOptions();
		//String totalCount = dto.getTotalCount();
		
		System.out.println(seqProduct);
		System.out.println(seqOptions);
		System.out.println(totalCount);
		
		
		//1.
		//String sequser = session.getId();
		String seqReservation = "500";
		//String totalPrice = "5000";
		String seqSeat = "5";

//		String seqProduct = (String) session.getAttribute("seqProduct");
//		String seqOptions = "1000";
//		String totalCount = "13240";
		
		//2.
		MenuDAO dao = MenuDAO.getInstance();
		

		OrderDTO orderdto = new OrderDTO();
		orderdto.setSeqProduct(seqProduct);
		orderdto.setSeqOptions(seqOptions);
		orderdto.setTotalCount(totalCount);
		
//		orderdto.setSeqProduct(seqProduct);
//		orderdto.setSeqOptions(seqOptions);
//		orderdto.setTotalCount(totalCount);
		
		SeatReservationDTO seatdto = new SeatReservationDTO();
		seatdto.setSeqSeat(seqSeat);

		ReservationDTO resdto = new ReservationDTO();
		resdto.setSeqUser("1");
		
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
