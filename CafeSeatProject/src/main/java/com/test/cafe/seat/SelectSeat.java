package com.test.cafe.seat;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.cafe.cafe.model.CafeDTO;
import com.test.cafe.seat.repository.SeatDAO;

@WebServlet("/seat/selectseat.do")
public class SelectSeat extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//세션 생성
		HttpSession session = req.getSession();
		
		//세션에 담긴 카페번호 정보 꺼내서 문자열 변수 cseq에 담기
		String cseq = (String) session.getAttribute("cseq");
		
		//싱글톤 패턴으로 SeatDAO 생성자 만들기
		SeatDAO dao = SeatDAO.getInstance();
		
		//세션으로 넘겨받은 카페번호와 일치하는 카페 정보를 DB에서 가져와서 DTO에 담기
		CafeDTO dto = dao.selectCafe(cseq);
		
		//DTO에 담은 카페정보를 세션에 담아서 페이지로 보내기
		req.setAttribute("dto", dto);
		
		//세션으로 넘겨받은 카페번호와 일치하는 카페의 좌석 정보를 DB에 가져와서 리스트에 담기
		List<Map<String, Object>> seatDetails = dao.getSeatInfo(cseq);
		
		// 디버깅: 모든 좌석 정보 출력
        System.out.println("Seat Details Size: " + seatDetails.size());
        for (Map<String, Object> seat : seatDetails) {
            System.out.println("Seat: " + seat);
        }
		
		//리스트에 담은 좌석정보를 세션에 담아서 페이지로 보내기
		req.setAttribute("seatDetails", seatDetails);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/seat/selectseat.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String cseq = (String) session.getAttribute("cseq");
		String selectedSeatsString = req.getParameter("selectedSeats"); //선택된 좌석들 정보를 받아옴
		
		session.setAttribute("selectedSeatsString", selectedSeatsString);
		
		//좌석 정보가 null이 아닐 시에
		if (selectedSeatsString != null && !selectedSeatsString.isEmpty()) {
			
			
			String[] selectedSeats = Arrays.stream(selectedSeatsString.split(","))
											.map(String::trim)				// 문자열 앞뒤 공백 제거
						                    .map(Integer::parseInt)         // 정수형으로 값형 변경
						                    .sorted()                       // 숫자를 오름차순으로 정렬
						                    .map(String::valueOf)           // 문자열 값형 변경
						                    .toArray(String[]::new);        // 정렬된 값들을 스트림에서 문자열 배열로 변환 
			
			System.out.println("선택된 좌석: " + selectedSeatsString);				//받아온 좌석 정보
			System.out.println("정렬된 좌석: " + Arrays.toString(selectedSeats));	//정렬한 좌석 정보
			
			//정렬된 좌석 정보를 세션에 담기
			session.setAttribute("selectedSeats", selectedSeats);
			
		//좌석 정보가 null일 때
		} else {
			
			//콘솔로 안내 메시지 출력
			System.out.println("선택된 좌석이 없습니다.");
		}
		
		resp.sendRedirect("/cafe/menu/menulist.do"); //메뉴 선택 페이지로 이동
		
	}	
}