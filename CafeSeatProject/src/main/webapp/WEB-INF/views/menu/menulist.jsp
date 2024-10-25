<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		/* #order #price {
			width: 350px;
			float: right;
			text-align: center;
		}

		#order #price #totalPrice {
			border: none; 
			text-align: center;
			font-size: 25px;
			font-weight: bold;
			letter-spacing: 1px;
			cursor: inherit;
		}  */
	</style>
	<body class="is-preload">

		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
					<nav id="nav">
						<a href="#" class="icon solid fa-home"><span>Home</span></a>
						<a href="#work" class="icon solid fa-folder"><span>Work</span></a>
						<a href="#contact" class="icon solid fa-envelope"><span>Contact</span></a>
						<a href="https://twitter.com/ajlkn" class="icon brands fa-twitter"><span>Twitter</span></a>
					</nav>

				<!-- Main -->
					<div id="main">

						<!-- Me -->
							<article id="home" class="panel intro">

							</article>

						<!-- Menu -->
							<article id="work" class="panel">
								<div id="category" >
									<button type="button" class="categoryName">Coffee</button>
									<button type="button" class="categoryName">Drink</button>
									<button type="button" class="categoryName">Dessert</button>
									<input type="hidden" name="category">
								</div>
								<div id="menuList" class="menuList">
									<div class="menu">
										<button type="button" class="menuName">복숭아 아샷추</button>
										<button type="button" class="menuprice">3,500원</button>		
										<button class="menuImg" onclick="location.href='/cafe/menu/menuoptions.do#work';"><img src="/cafe/assets/pic/menuImages/drink/coffee01.jpg"></button>
									</div>
									<div class="menu">
										<button type="button" class="menuName">레몬아샷추</button>
										<button type="button" class="menuprice">3,500원</button>		
										<button class="menuImg" data-menuName="레몬아샷추" data-price="3,500원"><img src="/cafe/assets/pic/menuImages/drink/coffee02.jpg"></button>
									</div>
									<div class="menu">
										<button type="button" class="menuName">올타임콜드브루</button>
										<button type="button" class="menuprice">3,500원</button>		
										<button class="menuImg"><img src="/cafe/assets/pic/menuImages/drink/coffee03.jpg"></button>
									</div>
									<div class="menu">
										<button type="button" class="menuName">아인슈패너</button>
										<button type="button" class="menuprice">3,500원</button>		
										<button class="menuImg"><img src="/cafe/assets/pic/menuImages/drink/coffee04.jpg"></button>
									</div>
									
								</div>
								<hr>
								
								<div id="order">
								<table id="orderDetail">
									<tr>
										<th>메뉴명</th>
										<th>수량</th>
									</tr>
									<tr>
										<td><input type="text" id="orderName" value="" readonly></td>
										<td><input type="text" id="orderCount" value="" readonly></td>
									</tr>
								</table>
								<div id="price">
									<input type="text" id="totalPrice" value="Total Price: 13,000원" readonly>
								</div>
								<div id="payType">
									<button type="submit" id="kakaopay"><img src="/cafe/assets/pic/payment/kakao.jpg" alt=""></button>
									<button type="submit" id="tosspay"><img src="/cafe/assets/pic/payment/tosspay.png" alt=""></button>
									<button type="submit" id="payETC">기타 결제</button>
								</div>
							</div>															
						</article>
						<article id="menuoption" class="'panel">

						<!-- Contact -->
							<article id="contact" class="panel">

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

/* 				$('#category').click(() => {			
					alert(event.target.textContent);
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