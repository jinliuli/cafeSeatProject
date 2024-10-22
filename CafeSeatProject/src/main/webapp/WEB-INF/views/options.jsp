<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Astral by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/options2.css" />
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
								
								<form method="GET" action="/cafe/menulist.do#work">
								<div id="option">
									<div class="optionName">1. 온도(ICE or HOT)</div>
										<div class="radio_temperature">
											<input id="temper_ice" type="radio" class="temperature" name="temperature" value="1">
											<label for="temper_ice">ICE</label>
										</div>
										
										<div class="radio_temperature">
											<input id="temper_hot" type="radio" class="temperature" name="temperature" value="2">
											<label for="temper_hot">HOT</label>
										</div>
										
									<div class="optionName">2. 사이즈(Size)</div>
										<div class="radio_cupsize">
											<input id="size_regular" type="radio" class="size" name="size" value="0">
											<label for="size_regular">기본(R)</label>
										</div>
										<div class="radio_cupsize">
											<input id="size_large" type="radio" class="size" name="size" value="1">
											<label for="size_large">라지(L)</label>
										</div>
										<div class="radio_cupsize">
											<input id="size_max" type="radio" class="size" name="size" value="2">
											<label for="size_max">맥스(M)</label>
										</div>
										
									<div class="optionName">3. 얼음 양(Ice Amout)</div>
										<div class="radio_iceamout">
											<input id="icefew" type="radio" class="iceamout" name="iceamout" value="0">
											<label for="icefew">얼음 적게</label>
										</div>
										<div class="radio_iceamout">
											<input id="icebasic" type="radio" class="iceamout" name="iceamout" value="1">
											<label for="icebasic">기본</label>
										</div>
										<div class="radio_iceamout">
											<input id="icelots" type="radio" class="iceamout" name="iceamout" value="2">
											<label for="icelots">얼음 많이</label>
										</div>
										
									<div class="optionName">4. 샷 추가(Shot)</div>
										<div class="radio_shotadd">
											<input id="noshot" type="radio" class="shotadd" name="shotadd" value="1">
											<label for="noshot">기본</label>
										</div>
										
										<div class="radio_shotadd">
											<input id="shot" type="radio" class="shotadd" name="shotadd" value="2">
											<label for="shot">샷 추가</label>
										</div>
										
								</div>
								<!-- 나중에 위에 name은 삭제하고 히든태그에 name넣어서 버튼 클릭하면 그때 value값 받도록 -->
								<div id="select">
								<!-- 	<input type="button" name="back" class="back" value="취소">
									<input type="submit" name="options" value="선택" > -->
									
									<button type="submit" class="options">선택</button>
									<button type="button" class="back" onclick="location.href='/cafe/menulist.do#work';">취소</button>
								</div>
								</form>												
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

			<script>

			</script>

	</body>
</html>