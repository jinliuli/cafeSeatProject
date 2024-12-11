<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<!DOCTYPE HTML>
<!--
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
	<title>CafeSeat</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/main.css" />
	<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>

	<style>
		.seat {display: flex;
        flex-wrap: wrap; /* 여러 줄로 나눔 */
        justify-content: center; /* 가운데 정렬 */
        gap: 10px; /* 좌석 간 간격 */
        max-width: 1000px; /* 한 줄에 최대 5개 배치 */
        margin: 0 auto; /* 가운데 정렬 */
        padding: 20px;
        border: 2px solid #AF8F6F; /* 외곽선 추가 */
        border-radius: 10px;
        background-color: #F8F4E1; /* 배경색 */}
        
		/* .seat form {width:90%; margin:0 auto; display: flex; flex-wrap: wrap; border: 5px solid #AF8F6F;; padding: 10px; box-sizing: Border-box; border-radius: 15px;} */
		.seat form input {width: 17.7142%; padding: 15px; margin-right: 1%; display: inline-block;background-color: burlywood; color: #444; font-weight: bold; color: #999;}
		.seat form input {margin-bottom: 10px; border-radius: 5px; box-shadow: 1px 1px 2px rgba(0,0,0,0.15);} 
		.seat form input :nth-of-type(5n) {margin-right: 0;}
		.seat form input:hover {background-color: #543310; color: white;}
		
	
		.seat form input.booked {cursor:not-allowed; background-color: #666; pointer-events: none;}
		.seat form input.booked:hover {color: #999;}
		.seat form input.blank {margin-right: 13.7142%;}
		.seat form input:nth-child() {margin-bottom: 30px;}
		.seat form input.plug {background: url(../images/plug.png) no-repeat; background-size: 40%; background-position-x: right; background-position-y: bottom; background-color: burlywood;}
		.seat form input.plug:hover {background-color: #543310; color: white;}

		.bottom {width: 90%; margin: 20px auto; margin-top: 50px; display: flex; justify-content: space-between; border-top: 4px solid #AF8F6F; padding-top: 25px;}

		.bottom #selectMenu {width: 30%;}
		.bottom #person {width: 20%;}

		.storename{
			font-size: 200%; font-weight: bold; text-align: center; 
		}
		.storeinfo{
			padding-top: 10%;
		}
		@font-face {
			font-family: 'Paperlogy-8ExtraBold';
			src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408-3@1.0/Paperlogy-8ExtraBold.woff2') format('woff2');
			font-weight: 800;
			font-style: normal;
		}
		body{
			font-family: 'Paperlogy-8ExtraBold';
		}

		.panel{
			background-color: #F8F4E1;
		}


	</style>
</head>
<body class="is-preload">
<<<<<<< HEAD
<%@ include file="/WEB-INF/views/inc/dev.jsp" %>
=======
<%-- <%@ include file="/WEB-INF/views/inc/header.jsp" %> --%>
>>>>>>> 02aeb8a4827e0a0eb8b3ffa1b2dcfd09dffce49d

		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
				<%@ include file="/WEB-INF/views/inc/nav.jsp" %>
				<!-- Main -->
					<div id="main">

						<!-- Me -->
							<article id="home" class="panel intro">

							</article>

						<!-- CafeSeat -->
							<article id="cafeseat" class="panel">
								
									<!-- 상단부 -->
								<h1 class="storename">${dto.name}</h1>

								<div class="storeinfo">
									<h4>${dto.name}</h4>
									<h4>${dto.tel}</h4>
									<h4>${dto.address}</h4>
									<h4>${dto.lotAddress}</h4>
									<br><br>




								</div>

										<!-- 좌석 선택 -->
								<div class="seat"> 
									<form id="seatForm" method="GET" action="/cafe/menu/menulist.do#cafeseat">
										<%
							                List<Map<String, Object>> seatDetails = (List<Map<String, Object>>) request.getAttribute("seatDetails");
							                if (seatDetails != null) {
							                    for (Map<String, Object> seat : seatDetails) {
							                        int seatId = (int) seat.get("seatId");
							                        String statusClass = (String) seat.get("status"); // 예약 상태(booked/available)
							                        boolean hasOutlet = (int) seat.get("outlet") == 1; // 콘센트 여부
							                        String outletClass = hasOutlet ? "plug" : "";
							            %>
							                        <input type="button" value="<%= seatId %>" class="seatButton <%= statusClass %> <%= outletClass %>" <%= "booked".equals(statusClass) ? "disabled" : "" %> />
							            <%
							                    }
							                }
							            %>
									
											<!-- 하단부 -->
										<div class="bottom">
											<input type="number" name="count" id="person" min="1" max="4" value="1" placeholder="인원 수">
											<input type="submit" value="메뉴선택" id="selectMenu">
											 <input type="hidden" id="selectedSeats" name="selectedSeats">
										</div>
									</form>
									</div>
								
							</article>

						<!-- Mypage -->
							<article id="mypage" class="panel">
								<!-- <header>
									<h2>Contact Me</h2>
								</header>
								<form action="#" method="post">
									<div>
										<div class="row">
											<div class="col-6 col-12-medium">
												<input type="text" name="name" placeholder="Name" />
											</div>
											<div class="col-6 col-12-medium">
												<input type="text" name="email" placeholder="Email" />
											</div>
											<div class="col-12">
												<input type="text" name="subject" placeholder="Subject" />
											</div>
											<div class="col-12">
												<textarea name="message" placeholder="Message" rows="6"></textarea>
											</div>
											<div class="col-12">
												<input type="submit" value="Send Message" />
											</div>
										</div>
									</div>
								</form> -->
							</article>
							
							
						<!-- Login -->
							<article id="login" class="panel">

							</article>					
							</div>
					

				<!-- Footer -->
					<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

			</div>

		<!-- Scripts -->
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

			<script>
					$(document).ready(function() {
					let selectedSeats = []; // 좌석을 여러 개 선택할 경우를 위해 배열로
					let maxSeats = 0; //최대 선택가능 좌석
					maxSeats = parseInt($('#person').val()) || 0; // 입력된 숫자를 가져옴

					$('#person').on('input', function() {
						maxSeats = parseInt($(this).val()) || 0; // 입력값 변경 시 maxSeats 업데이트
					});

					$('.seatButton').click(function() {
						const seatValue = $(this).val();
						const selectColor = '#543310'; // 선택했을 때 색
						const selected = '5px 5px 10px -5px inset'; // 선택했을 때 그림자
						const selectedFont = 'white'; // 선택했을 떄 글자 색


						if (selectedSeats.includes(seatValue)) {
							selectedSeats = selectedSeats.filter(seat => seat !== seatValue); // 배열에서 제거
							$(this).css('background-color', ''); // 원래 배경색으로 돌아감
							$(this).css('box-shadow', ''); // 원래 그림자로 돌아감
							$(this).css('color', ''); //원래 글자 색
						} else {
							if (selectedSeats.length < maxSeats) { // 선택한 좌석 수가 최대 좌석 수보다 적은 경우
								selectedSeats.push(seatValue);
								$(this).css('background-color', selectColor); // 선택 시 배경색 변경
								$(this).css('box-shadow', selected); // 선택 시 그림자 변경
								$(this).css('color', selectedFont); // 선택 시 글자색 변경
							} else {
								alert("최대 " + maxSeats + " 개의 좌석만 선택할 수 있습니다."); // 최대 좌석 수 초과 알림
							}
						}
						
					});
					
					$('#seatForm').on('submit', function(event) {
				        event.preventDefault(); // 기본 제출 방지

				        if (selectedSeats.length === 0) {
				            alert("좌석을 선택하세요.");
				            return;
				        }

				        // 선택된 좌석을 쿼리 스트링으로 설정
				        $('#selectedSeats').val(selectedSeats.join(',')); // 배열을 문자열로 변환
				        this.submit(); // 폼 제출
				    });
					
				});

			 

			</script>

	</body>
</html>