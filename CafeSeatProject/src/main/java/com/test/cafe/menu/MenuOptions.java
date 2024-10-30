package com.test.cafe.menu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.cafe.menu.model.MenuDTO;
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

		
	
	
	}

}
