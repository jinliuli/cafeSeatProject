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
import com.test.cafe.menu.repository.MenuDAO;

@WebServlet("/menu/menuoptions.do")
public class MenuOptions extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		if (seq == null || seq.isEmpty()) {
			//제품 번호가 없을 시에 메뉴페이지로 돌아감
			resp.sendRedirect("/cafe/menu/menulist.do");
			return;
		}
		
		MenuDAO dao = MenuDAO.getInstance();
		MenuDTO dto = dao.get(seq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/menu/menuoptions.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
	    List<OrderDTO> cart = (List<OrderDTO>) session.getAttribute("cart");
	    if (cart == null) {
	        cart = new ArrayList<>();
	    }
		
		String seq = req.getParameter("seq");
		if (seq == null || seq.isEmpty()) {
			
			//제품번호가 없을 시에 메뉴 페이지로 이동
			resp.sendRedirect("/cafe/menu/menulist.do");
			return;
		}
		
		//메뉴 정보 불러오기
		MenuDAO dao = MenuDAO.getInstance();
		MenuDTO dto = dao.get(seq);
	    
		
		//MenuDTO에 가격을 포함한 새로운 OrderDTO 객체를 생성합니다.
		OrderDTO order = new OrderDTO();
		order.setSeqProduct(req.getParameter("seq"));
		order.setName(dto.getName());
		if (!"3".equals(dto.getSeqCategory())) {
			
			order.setSeqOptions(req.getParameter("temperature") + req.getParameter("size") + req.getParameter("iceamount") + req.getParameter("shotadd"));
			
		} else if ("3".equals(dto.getSeqCategory())) {
			
			order.setSeqOptions("9999");
			
		}
		order.setTotalCount(req.getParameter("totalCount"));
		order.setPrice((dto.getPrice()));
		
		//장바구니 안에 제품 담기는지 디버깅
		System.out.println("장바구니 내용: ");
		for (OrderDTO item: cart) {
			System.out.println("제품: " + item.getSeqProduct() + ", 옵션번호: " + item.getSeqOptions() + ", 수량: " + item.getTotalCount() + ", 단위 가격: " + item.getPrice());
		}
		
		// 제품을 장바구니에 추가
		cart.add(order);
		
		// 장바구니를 세션에 담기
		session.setAttribute("cart", cart);
		
		// 메뉴 페이지로 리다이렉트합니다.
		resp.sendRedirect("/cafe/menu/menulist.do");
	}
	
}

