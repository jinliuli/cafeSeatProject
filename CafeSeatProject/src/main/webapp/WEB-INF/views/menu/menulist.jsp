<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<title>Astral by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/cafe/assets/css/main.css" />
		<link rel="stylesheet" href="/cafe/assets/css/menu.css" />
		<noscript><link rel="stylesheet" href="/cafe/assets/css/noscript.css" /></noscript>
	</head>
	<style>

	</style>
	<body class="is-preload">

		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
<!-- 					<nav id="nav">
						<a href="#" class="icon solid fa-map"><span>Map</span></a>
						<a href="#cafeseat" class="icon solid fa-mug-hot"><span>CafeSeat</span></a>
						<a href="#mypage" class="icon solid fa-heart"><span>MyPage</span></a>
						<a href="#login" class="icon solid fa-user"><span>Login</span></a>
					</nav> -->
					
					<!-- Nav -->
			        <nav id="nav">
			            <a href="/cafe/cafe/cafemap.do#" class="icon solid fa-map"><span>Map</span></a> 
			            <a href="/cafe/menu/menulist.do#cafeseat" class="icon solid fa-mug-hot"><span>CafeSeat</span></a>
			            <a href="#mypage" class="icon solid fa-heart"><span>MyPage</span></a>
			            <a href="/cafe/user/login.do#login" class="icon solid fa-user"><span>Login</span></a>
			        </nav>

				<!-- Main -->
					<div id="main">

						<!-- Me -->
							<article id="home" class="panel intro">

							</article>

						<!-- Menu -->
							<article id="cafeseat" class="panel">
								<div id="category" >
									<div class="radio_category">
										<input id="category_coffee" type="radio" class="category" name="category" value="1">
										<label for="category_coffee">Coffee</label>
									</div>
									<div class="radio_category">
										<input id="category_drink" type="radio" class="category" name="category" value="2">
										<label for="category_drink">Drink</label>
									</div>
									<div class="radio_category">
										<input id="category_dessert" type="radio" class="category" name="category" value="3">
										<label for="category_dessert">Dessert</label>
									</div>
									<!-- <button type="button" class="categoryName">Coffee</button>
									<button type="button" class="categoryName">Drink</button>
									<button type="button" class="categoryName">Dessert</button> -->
									<input type="hidden" name="category">
								</div>
								<div id="menuList" class="menuList">
									<c:forEach items="${list}" var="dto">
									<div class="menu" data-category="${dto.seqCategory}">
										<c:if test="${dto.seqCategory != '3'}">
											<button type="button" class="menuName">${dto.name}</button>
											<button type="button" class="menuprice">${dto.price}원</button>		
											<button class="menuImg" onclick="location.href='/cafe/menu/menuoptions.do?&seq=${dto.seq}#cafeseat';"><img src="/cafe/assets/pic/menuImages/drink/${dto.image}"></button>
											<input type="hidden" name="seqProduct" value="${dto.seq}">
											<input type="hidden" name="menu-category" value="${dto.seqCategory}">
										</c:if>
										<c:if test="${dto.seqCategory == '3'}">
											<button type="button" class="menuName">${dto.name}</button>
											<button type="button" class="menuprice">${dto.price}원</button>		
											<button class="menuImg" onclick="location.href='/cafe/menu/menuoptions.do?&seq=${dto.seq}#cafeseat';"><img src="/cafe/assets/pic/menuImages/dessert/${dto.image}"></button>
											<input type="hidden" name="seqProduct" value="${dto.seq}">
											<input type="hidden" name="seqCategory" value="${dto.seqCategory}">
										</c:if>
									</div>
									</c:forEach>
									
								</div>
								<hr>
								
								<% String temperature = request.getParameter("temperature");%>
								<% String size = request.getParameter("size");%>
								<% String iceamount = request.getParameter("iceamount");%>
								<% String shotadd = request.getParameter("shotadd");%>
								<% String totalCount = request.getParameter("totalCount");%>
								<% String totalPrice = request.getParameter("price");%>
								<% String seqProduct = request.getParameter("seq");%>
								
								<div id="order">
								
								<form method="POST" action="/cafe/menu/menulist.do">
								<table id="orderDetail">
									<tr>
										<th>메뉴명</th>
										<th>수량</th>
									</tr>
									<tr>
										<td><input type="text" id="orderName" name="orderName" value="${dto.name}" readonly></td>
										<td><input type="text" id="orderCount" name="orderCount" value="<%= totalCount %>" readonly></td>
									</tr>
								</table>
								
								<input type="hidden" name="menutemperature" value="<%= temperature %>">
								<input type="hidden" name="menusize" value="<%= size %>">
								<input type="hidden" name="menuiceamount" value="<%= iceamount %>">
								<input type="hidden" name="menushotadd" value="<%= shotadd %>">
								<input type="hidden" name="seqProduct" value="<%= seqProduct %>">
								<input type="hidden" name="totalPrice" value="<%= totalPrice %>">
								<input type="hidden" name="selectedSeats" value="selectedSeats">
							 	<input type="hidden" name="totalCount" value="<%= totalCount %>">
								
								<div id="price">
									<input type="text" id="totalPrice" name="totalPrice" value="Total Price: 13,000원" readonly>
								</div>
								<div id="payType">
									<button type="submit" id="kakaopay"><img src="/cafe/assets/pic/payment/kakao.jpg" alt=""></button>
									<button type="submit" id="tosspay"><img src="/cafe/assets/pic/payment/tosspay.png" alt=""></button>
									<button type="submit" id="payETC">기타 결제</button>
								</div>
								</form>
							</div>															
						</article>
						
						
						<article id="mypage" class="panel">
						</article>

						<!-- Contact -->
							<article id="login" class="panel">

						</article>

					</div>

				<!-- Footer -->
					<div id="footer">
						<ul class="copyright">
							<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/cafe/assets/js/jquery.min.js"></script>
			<script src="/cafe/assets/js/browser.min.js"></script>
			<script src="/cafe/assets/js/breakpoints.min.js"></script>
			<script src="/cafe/assets/js/util.js"></script>
			<script src="/cafe/assets/js/main.js"></script>

			<script>

 				document.querySelectorAll('input[name="category"]').forEach(radio => {
					radio.addEventListener('change', function() {
						const selectedCategory = this.value;
						const menus = document.querySelectorAll('.menu');
						
						menus.forEach(menu =>{
							if(menu.getAttribute('data-category') === selectedCategory) {
								menu.style.display = 'block';
							} else {
								menu.style.display = 'none';
							}
							
						});
					});
				});
			
 				
 				document.querySelectorAll('.menuImg').forEach(imgButton => {
 				    imgButton.addEventListener('click', function() {
 				        const menuName = this.previousElementSibling.previousElementSibling.textContent; // 메뉴 이름 가져오기
 				        document.getElementById('orderName').value = menuName; // 주문 이름에 설정
 				    });
 				});
 				
 				<c:if test="">
 					document.getElementById("orderName").value = "${dto.name}";
 				</c:if>
 				
/*
 				$(input[name='category']).click(() => {			
					alert(input[name='category'].value);
				});
				$('.menuImg').click(function() {	
					console.log(this);		
					alert($(this).data("price"));
				});
				
				$('.menuImg').click(() => {
					
				}); */

			</script>

	</body>
</html>