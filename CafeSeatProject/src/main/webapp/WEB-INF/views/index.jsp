<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Astral by HTML5 UP</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/cafe/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/cafe/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper-->
			<div id="wrapper">

				<!-- NavNoArrow: Nav 메뉴 아이콘 아래 따라다니는 화살표가 없는 버전 -->
					<nav id="navNoArrow">
					<!-- 
						<a href="#" class="icon solid fa-home"><span>메인 페이지</span></a>
						<a href="#extend-seat" class="icon solid fa-folder"><span>자리 연장</span></a>
						<a href="#move-seat" class="icon solid fa-envelope"><span>자리 이동</span></a>
						<a href="#end-seat" class="icon brands fa-twitter"><span>이용 종료</span></a>
						 -->

						<!-- <a href="#" class="icon solid fa-home"><span>메인 페이지</span></a> -->
						<a href="/cafe/seat/extendseat.do" class="icon solid fa-solid fa-mug-hot"><span>자리 연장</span></a>
						<a href="/cafe/seat/moveseat.do" class="icon solid fa-solid fa-shuffle"><span>자리 이동</span></a>
						<a href="/cafe/seat/endseat.do" class="icon solid fa-solid fa-arrow-right-from-bracket"><span>이용 종료</span></a>
					</nav>

				<!-- Main -->
					<div id="main">

						<!-- Me -->
							<article id="main-seat" class="panel intro">
								<header>
									<h1>메인 페이지</h1>
									<p>Senior Astral Projectionist</p>
								</header>
								<a href="#main-seat" class="jumplink pic">
									<span class="arrow icon solid fa-chevron-right"><span>See my work</span></span>
									<img src="/cafe/images/me.jpg" alt="" />
								</a>
							</article>

						<!-- extend-seat -->
							<article id="extend-seat" class="panel">
								<header>
									<h2>자리 연장</h2>
								</header>
								<p>
									Phasellus enim sapien, blandit ullamcorper elementum eu, condimentum eu elit.
									Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
									luctus elit eget interdum.
								</p>
								<section>
									<div class="row">
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic01.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic02.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic03.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic04.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic05.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic06.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic07.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic08.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic09.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic10.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic11.jpg" alt=""></a>
										</div>
										<div class="col-4 col-6-medium col-12-small">
											<a href="#" class="image fit"><img src="/cafe/images/pic12.jpg" alt=""></a>
										</div>
									</div>
								</section>
							</article>

						<!-- move-seat -->
							<article id="move-seat" class="panel">
								<header>
									<h2>자리 이동</h2>
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
								</form>
							</article>

						<!-- end-seat -->
							<article id="end-seat" class="panel">
								<header>
									<h2>이용 종료</h2>
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
								</form>
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
			<!-- Font Awesome Icon 전용 스크립트 -->
			<script src="https://kit.fontawesome.com/1d5f7aae7c.js" crossorigin="anonymous"></script>
			
			<script src="/cafe/assets/js/jquery.min.js"></script>
			<script src="/cafe/assets/js/browser.min.js"></script>
			<script src="/cafe/assets/js/breakpoints.min.js"></script>
			<script src="/cafe/assets/js/util.js"></script>
			<script src="/cafe/assets/js/main.js"></script>

	</body>
</html>