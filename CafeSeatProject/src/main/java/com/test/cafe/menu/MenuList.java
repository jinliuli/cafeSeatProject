package com.test.cafe.menu;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.cafe.menu.model.MenuDTO;
import com.test.cafe.menu.repository.MenuDAO;

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

}
