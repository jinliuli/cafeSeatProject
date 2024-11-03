package com.test.cafe.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.cafe.user.model.AdminDTO;
import com.test.cafe.user.model.UserDTO;
import com.test.cafe.user.repository.AdminDAO;
import com.test.cafe.user.repository.UserDAO;

@WebServlet("/user/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//getSession(false)는 현재 세션을 가져옴. 현재 세션이 없으면 null 값 반환
		HttpSession session = req.getSession(false);
		
		//세션이 존재하고 사용자가 이미 로그인 되어 있는지 확인
		if (session != null && session.getAttribute("auth") != null) {
			
			//사용자가 이미 로그인 되어있다면, 지도 페이지로 이동
			resp.sendRedirect("/cafe/cafe/cafemap.do");
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/login.jsp");
			dispatcher.forward(req, resp);		
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
	
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String loginType = req.getParameter("loginType");
		String checkLoginType = "user";
		
		//입력된 ID와 PW 출력되는지 확인
		System.out.println("ID: " + id + ", PW: " + pw);
		
		if (!checkLoginType.equals(loginType)) {
			 	
			// Admin 로그인 처리
            AdminDTO dto = new AdminDTO();
           	dto.setId(id);
            dto.setPw(pw);

			AdminDAO dao = AdminDAO.getInstance();
			AdminDTO result = dao.login(dto);
		
			if (result != null) {
		
				//인증 티켓 발급
				session.setAttribute("auth", id);
				session.setAttribute("loginType", loginType);
				
				//회원 정보
				session.setAttribute("info", result);
				//session.setAttribute("name", result.getName());
				//session.setAttribute("tel", result.getTel());
				//session.setAttribute("email", result.getEmail());
				//session.setAttribute("companyId",  result.getCompanyId());
				//session.setAttribute("ing", result.getIng());
				
				resp.sendRedirect("/cafe/cafe/cafemap.do");
			
			} else {
				
				req.setAttribute("loginError", "일치하는 관리자 정보가 없습니다.");
				resp.sendRedirect("/cafe/user/login.do#login");
			}
			
		} else {
			 
			 // User 로그인 처리
			 UserDTO dto = new UserDTO();
			 dto.setId(id);
			 dto.setPw(pw);

			 
			 UserDAO dao = UserDAO.getInstance();
			 UserDTO result = dao.login(dto);
		
			 if (result != null) {
				//인증 티켓 발급
				session.setAttribute("auth", id);
				session.setAttribute("loginType", loginType);
			
				//회원 정보
				
				session.setAttribute("info", result);
				//session.setAttribute("name", result.getName());
				//session.setAttribute("tel", result.getTel());
				//session.setAttribute("email", result.getEmail());
				//session.setAttribute("ing", result.getIng());
			
				resp.sendRedirect("/cafe/cafe/cafemap.do");
		
			 } else {
				
				 req.setAttribute("loginError", "일치하는 사용자 정보가 없습니다.");
				 resp.sendRedirect("/cafe/user/login.do#login");
			}
		
		}
	}
}
	
	
