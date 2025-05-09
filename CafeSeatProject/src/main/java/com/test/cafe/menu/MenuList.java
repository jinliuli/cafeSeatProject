package com.test.cafe.menu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
        
        //메뉴 목록 불러오기
		MenuDAO dao = MenuDAO.getInstance();
		ArrayList<MenuDTO> list = dao.list();

		//메뉴와 카트 디버깅
		System.out.println("Menu list size: " + (list != null ? list.size() : "null"));
		System.out.println("Cart size: " + (cart != null ? cart.size() : "null"));
		
		req.setAttribute("list", list);
        req.setAttribute("cart", cart); //장바구니 담긴 제품들을 세션에 담기
		
        //장바구니에 제품이 담겨있는지 디버깅
        System.out.println("장바구니 내용:");
        for (OrderDTO item: cart) {
        	System.out.println("제품: " + item.getSeqProduct() + ", 옵션번호: " + item.getSeqOptions() + ", 수량: " + item.getTotalCount());
        }
        
        String[] selectedSeats = (String[]) session.getAttribute("selectedSeats");
        
        if (selectedSeats != null) {
        	for (String seat: selectedSeats) {
        		if (seat != null && !seat.isEmpty()) {
        			System.out.println("좌석: " + seat);
        		}
        	}
        } else {
        	System.out.println("선택된 좌석 없음");
        }
        
        
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/menu/menulist.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		System.out.println("POST 시작!");
		
		List<OrderDTO> cart = (List<OrderDTO>) session.getAttribute("cart");
		
		
//		OrderDTO dto = cart.get(0);
//		
//		String seqProduct = dto.getSeqProduct();
//		String seqOptions = dto.getSeqOptions();
//		String totalCount = dto.getTotalCount();
		
		String[] selectedSeats = (String[]) session.getAttribute("selectedSeats");
		UserDTO userInfo = (UserDTO) session.getAttribute("info");
		
		
		//2.
		MenuDAO dao = MenuDAO.getInstance();
		

//		OrderDTO orderdto = new OrderDTO();
//		orderdto.setSeqProduct(seqProduct);
//		orderdto.setSeqOptions(seqOptions);
//		orderdto.setTotalCount(totalCount);
		
		SeatReservationDTO seatdto = new SeatReservationDTO();
		seatdto.setSelectedSeats(selectedSeats);

		ReservationDTO resdto = new ReservationDTO();
		resdto.setSeqUser(userInfo.getSeq());
		
		PaymentDTO paydto = new PaymentDTO();
		
		UserDTO userdto = new UserDTO();
		userdto.setSeq(userInfo.getSeq());
		
		int result = dao.orderAdd(cart, resdto, paydto, seatdto, userdto);
		
		//3.
		if (result > 0) {
			resp.sendRedirect("/cafe/cafe/cafemap.do#");
		} else {
			System.out.println("DB 실패");
		}
		
	}

}
