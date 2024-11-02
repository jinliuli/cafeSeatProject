package com.test.cafe.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.cafe.user.model.AdminDTO;
import com.test.cafe.user.model.UserDTO;
import com.test.cafe.user.repository.AdminDAO;
import com.test.cafe.user.repository.UserDAO;
import com.test.cafe.util.OutputUtil;

@WebServlet("/user/register.do")
public class Register extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/register.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			req.setCharacterEncoding("UTF-8");
			
			String loginType = req.getParameter("loginType");
			String user = "user";
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			String email = req.getParameter("email");
			String companyId = req.getParameter("companyId");
			String adminPw = req.getParameter("adminPw");
			
			if (!user.equals(loginType)) {
				
				AdminDTO dto = new AdminDTO();
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setTel(tel);
				dto.setEmail(email);
				dto.setCompanyId(companyId);
//				dto.setAdminPw(adminPw);
				
				AdminDAO dao = AdminDAO.getInstance();
				
				int result = dao.register(dto);
				
				if (result == 1) {
					
					resp.sendRedirect("/cafe/cafe/cafemap.do#");
			
				} else {
					OutputUtil.redirect(resp, "회원가입에 실패했습니다.");
				}
				
			} else {
				
				UserDTO dto = new UserDTO();
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setTel(tel);
				dto.setEmail(email);
				
				UserDAO dao = UserDAO.getInstance();
				
				int result = dao.register(dto);
				
				if (result == 1) {
					
					resp.sendRedirect("/cafe/cafe/cafemap.do#");
			
				} else {
					OutputUtil.redirect(resp, "회원가입에 실패했습니다.");
				}
				
			}	
			
		} catch (Exception e) {
			System.out.println("Register.doPost");
			e.printStackTrace();
		}
		
	}

	
}