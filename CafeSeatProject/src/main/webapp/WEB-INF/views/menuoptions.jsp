<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Astral by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/options.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<style>
		
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

						<!-- options -->
							<article id="work" class="panel">
								<h2>복숭아 아샷추</h2>
								<p>달콤하고 향긋한 복숭아 아이스티에 에스프레소를 달콤하게 즐기는 투썸 아샷추</p>
								<div id="optionImg">
									<!-- <input type="text" value="복숭아 아샷추"> -->
									<img src="assets/menuImages/drink/coffee01.jpg" alt="">
								</div>
								<div id="option">
									<div class="optionName">1. 온도(ICE or HOT)</div>
										<input type="button" class="temperature" name="ice" value="ICE">
										<input type="button" class="temperature" name="hot" value="HOT">
									<div class="optionName">2. 사이즈(Size)</div>
										<input type="button" class="size" name="cupSize" value="기본(R)">
										<input type="button" class="size" name="cupSize" value="라지(L)">
										<input type="button" class="size" name="cupSize" value="맥스(M)">
									<div class="optionName">3. 얼음 양(Ice Amout)</div>
										<input type="button" class="iceamout" name="icefew" value="얼음 적게">
										<input type="button" class="iceamout" name="icebasic" value="기본">
										<input type="button" class="iceamout" name="icelots" value="얼음 많이">
									<div class="optionName">4. 샷 추가(Shot)</div>
										<input type="button" class="shotadd" name="noshot" value="기본">
										<input type="button" class="shotadd" name="shot" value="샷 추가">
								</div>
								<!-- 나중에 위에 name은 삭제하고 히든태그에 name넣어서 버튼 클릭하면 그때 value값 받도록 -->
								<div id="select">
									<input type="button" name="back" class="back" value="취소">
									<input type="submit" name="options" value="선택">
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
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>>