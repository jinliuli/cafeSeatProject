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

//		String name = req.getParameter("name");
//		
//		MenuDAO dao = MenuDAO.getInstance();
//		
//		MenuDTO dto = dao.get(name);
		String seq = req.getParameter("seq");
		
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

        // 세션에서 cart 데이터를 가져옵니다. 만약 cart가 없으면 새로 생성합니다.
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // form 데이터를 사용하여 새로운 OrderDTO 객체를 생성합니다.
        OrderDTO order = new OrderDTO();
//        order.setSeq(req.getParameter("seq"));
        order.setSeqProduct(req.getParameter("dto"));
        order.setSeqOptions(req.getParameter("seqOptions"));
        order.setTotalCount(req.getParameter("totalCount"));

        System.out.println(order.getSeqProduct());
        System.out.println(order.getSeqOptions());
        System.out.println(order.getTotalCount());

        // 새로운 order를 cart에 추가하고 세션에 저장합니다.
        cart.add(order);
        session.setAttribute("cart", cart);

        // 메뉴 페이지로 리다이렉트합니다.
        resp.sendRedirect("/menu/menulist.do");
    }
	
	
	}

