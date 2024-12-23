<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<title>CafeSeat</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/cafe/assets/css/main.css" />
		<link rel="stylesheet" href="/cafe/assets/css/menu.css" />
		<noscript><link rel="stylesheet" href="/cafe/assets/css/noscript.css" /></noscript>
	</head>
	<style>
		@import url("/cafe/assets/css/paperlogy_font.css");
		
		body {
		    font-family: 'Paperlogy-8ExtraBold';
		}
	</style>
<body class="is-preload" style="-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none">
<%-- 	<%@ include file="/WEB-INF/views/inc/dev.jsp" %> --%>
		<!-- Wrapper-->
		<div id="wrapper">

			<!-- Nav -->
			<%@ include file="/WEB-INF/views/inc/nav.jsp" %>

				<!-- Main -->
				<div id="main">

					<!-- 제품 메뉴 -->
					<article id="mainmenu" class="panel">
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
							<input type="hidden" name="category">
						</div>
						<div id="menuList" class="menuList">
							<c:forEach items="${list}" var="dto">
								<div class="menu" data-category="${dto.seqCategory}">
								    <c:if test="${dto.seqCategory != '3'}">
								        <form method="GET" action="/cafe/menu/menuoptions.do">
								            <input type="hidden" name="seq" value="${dto.seq}">
								            <button type="submit" class="menuName">${dto.name}</button>
								            <button type="button" class="menuprice">${dto.price}원</button>
								            <button class="menuImg">
								                <img src="/cafe/assets/pic/menuImages/drink/${dto.image}" alt="${dto.name}">
								            </button>
								        </form>
								    </c:if>
									 <c:if test="${dto.seqCategory == '3'}">
								        <form method="GET" action="/cafe/menu/menuoptions.do">
								            <input type="hidden" name="seq" value="${dto.seq}">
								            <button type="submit" class="menuName">${dto.name}</button>
								            <button type="button" class="menuprice">${dto.price}원</button>
								            <button class="menuImg">
								                <img src="/cafe/assets/pic/menuImages/dessert/${dto.image}" alt="${dto.name}">
								            </button>
								        </form>
								    </c:if>
								</div>
							</c:forEach>
						</div>
						<hr>
						<div id="order">
							<form method="POST" action="/cafe/menu/menulist.do">
								<table id="orderDetail">
									<tr>
										<th>메뉴명</th>
										<th class="hidden">옵션</th>
										<th>수량</th>
										<th>총액</th>
									</tr>
								<c:forEach items="${cart}" var="order">
									<tr>
										<td>${order.name}</td>
										<td class="hidden">${order.seqOptions}</td>
										<td>${order.totalCount}</td>
										<td>${order.totalPrice}</td>
									</tr>
								</c:forEach>
								</table>
							
								<div id="payType">
									<c:forEach items="${cart}" var="order">
									<div id="price">
										<input type="text" id="totalPrice" name="totalPrice" value="총 금액: ${order.totalPrice}원" readonly>
									</div>
									</c:forEach>
									<button type="submit" id="kakaopay"><img src="/cafe/assets/pic/payment/kakao.jpg" alt=""></button>
									<button type="submit" id="tosspay"><img src="/cafe/assets/pic/payment/tosspay.png" alt=""></button>
									<button type="submit" id="payETC">기타 결제</button>
								</div>
							</form>
						</div>															
					</article>
				</div>

			<!-- Footer -->
			<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

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
			
		
			
		/*
		    // 페이지 로드 시 URL에서 totalCount 값을 가져와서 orderCount에 설정하는 함수
		    function getQueryParam(name) {
		        const urlParams = new URLSearchParams(window.location.search);
		        return urlParams.get(name);
		    }
	
		    // totalCount 값을 가져와서 orderCount에 출력
		    window.onload = function() {
		       const menuName = getQueryParam('seq');
		       const totalCount = getQueryParam('totalCount');
		       const price = getQueryParam('price');
		        if (totalCount) {
		            document.getElementById('orderCount').value = totalCount;  // totalCount 값을 orderCount에 설정
		        }
		        if (menuName) {
		        	document.getElementById('orderName').value = menuName;
		        }
		        if (price) {
		        	const totalPrice = price*totalCount;
		        	const formattedPrice = totalPrice.toLocaleString();
		        	document.getElementById('totalPrice').value = '총 금액: ' + formattedPrice + '원';
		        	document.getElementById('orderPrice').value = formattedPrice + '원';
		        }
		    };
		*/
			
	
	</script>

</body>
</html>