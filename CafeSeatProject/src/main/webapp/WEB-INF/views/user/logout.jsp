<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
    Astral by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/cafe/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/cafe/assets/css/noscript.css" />
</noscript>

<style>
@import url("/cafe/assets/css/paperlogy_font.css");

body {
	font-family: 'Paperlogy-8ExtraBold';
}

#login {
	display: float;
	justify-content: center;
}

.panel-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
}

.banner {
	text-align: center;
	font-family: 'Paperlogy-8ExtraBold';
	font-size: 60px;
	margin-top: 30px;
	margin-bottom: 35px;
}

.opt-login-form {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
	margin-bottom: 20px;
}

.choice {
	font-family: 'Paperlogy-8ExtraBold';
	border: 2px solid #ddd;
	width: 185px;
	height: 55px;
	display: flex;
	justify-content: center;
	align-items: center;
	float: left;
	font-size: 22px;
	margin-bottom: 5px;
	margin-right: 18px;
}

/* 라디오 버튼 label > 커서 올렸을 때 */
.choice:hover {
	color: rgb(37, 92, 193);
	cursor: pointer;
}

.opt-login:checked+label {
	color: rgb(37, 92, 193);
}

.login-table th {
	display: flex;
	align-items: center;
	text-align: center;
	font-size: 20px;
}

.login-table td {
	text-align: center;
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

#id, #pw {
	background: #f4f4f4;
	border: none;
	width: 400px;
	height: 50px;
	margin-top: 5px;
	margin-bottom: 15px;
	padding-left: 10px;
}

.login-table {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.btnLogin {
	font-size: 40px;
	width: auto;
	display: flex;
	justify-content: center;
	align-content: center;
	box-sizing: content-box;
	margin-top: -20px;
}

.btnLogin button {
	width: 346px;
	height: 28px;
	font-size: 18px;
	margin-bottom: 20px;
}

.link {
	display: flex;
	justify-content: space-between;
	width: 50%;
}

.link a {
	font-size: 20px;
	text-align: center;
	white-space: nowrap; /* 글씨를 한 줄로 표시 */
	margin-bottom: 10px;
}

.logout-form {
	text-align: center;
	justify-content: center;
	align-content: center;
}

.logout {
	margin-bottom: 20px;
}

/* #nav .nav-button {
                background-color: rgb(48, 102, 204); 
                border: none; 
                border-radius: 2px; 
                padding: 10px 20px; 
                font-size: 18px; 
                margin-left: 20px; 
                cursor: pointer; 
            }

            #nav .nav-button:hover {
                background-color: #ffffff; 
               
            } */
</style>
</head>
<body class="is-preload">


	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Nav -->
		<nav id="nav">
			<a href="/cafe/cafe/cafemap.do" class="icon solid fa-map"><span>Map</span></a>
			<a href="/cafe/seat/selectseat.do#cafeseat" class="icon solid fa-mug-hot"><span>CafeSeat</span></a>
			<a href="#mypage" class="icon solid fa-heart"><span>MyPage</span></a>
			<a href="/cafe/user/logout.do#logout" class="icon solid fa-user"><span>Logout</span></a>
		</nav>

		<!-- Main -->
		<div id="main">


			<!-- Login -->
			<article id="logout" class="panel">

				<c:if test="${not empty auth}">
					<form method="post" action="/cafe/user/logout.do">
						<div class="logout-form">
							<div class="logout">로그아웃 하시겠습니까?</div>
							<div>
								<button type="button" id="btnBack" onclick="history.back();">뒤로가기</button>
								<button type="submit" id="btnLogout">로그아웃</button>
							</div>
						</div>
					</form>
				</c:if>

			</article>
		</div>


		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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
		
	</script>

</body>
</html>
