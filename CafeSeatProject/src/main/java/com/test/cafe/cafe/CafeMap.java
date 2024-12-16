package com.test.cafe.cafe;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.cafe.cafe.model.CafeDTO;
import com.test.cafe.cafe.repository.CafeDAO;

@WebServlet("/cafe/cafemap.do")
public class CafeMap extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String keyword = req.getParameter("keyword");
        CafeDAO dao = CafeDAO.getInstance();
        
        ArrayList<CafeDTO> list;
        
        if (keyword != null && !keyword.trim().isEmpty()) {
            list = dao.searchCafes(keyword);
        } else {
            list = dao.listCafe();
        }
        
        req.setAttribute("list", list);
        req.setAttribute("keyword", keyword);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/cafe/cafemap.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//POST로 받은 카페번호를 스트링 변수 cseq에 담기
		String cseq = req.getParameter("cseq");

		//카페번호가 문자열 변수 cseq에 잘담겼는지 콘솔 출력 테스트
		System.out.println("카페번호: " + cseq);
		
		//카페번호를 담을 세션 만들기
		HttpSession session = req.getSession();
		
		//카페번호를 세션에 담기
		session.setAttribute("cseq", cseq);
		
		//좌석 선택 페이지로 이동
		resp.sendRedirect("/cafe/seat/selectseat.do#cafeseat");

	}
}
