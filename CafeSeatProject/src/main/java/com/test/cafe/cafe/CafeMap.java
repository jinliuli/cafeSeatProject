package com.test.cafe.cafe;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.cafe.cafe.model.CafeDTO;
import com.test.cafe.cafe.repository.CafeDAO;

@WebServlet("/cafe/cafemap.do")
public class CafeMap extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CafeDAO dao = new CafeDAO();
		
		ArrayList<CafeDTO> list = dao.listCafe();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/cafe/cafemap.jsp");
		dispatcher.forward(req, resp);
	}
}