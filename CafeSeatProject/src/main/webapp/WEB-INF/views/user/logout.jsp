<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>CafeSeat</title>
<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/cafe/assets/css/main.css" />
	<link rel="stylesheet" href="../assets/css/logout.css" />
	<noscript><link rel="stylesheet" href="/cafe/assets/css/noscript.css" /></noscript>
</head>
<style>
@import url("/cafe/assets/css/paperlogy_font.css");

body {
	font-family: 'Paperlogy-8ExtraBold';
}
</style>

<body class="is-preload">

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Nav -->
		<%@ include file="/WEB-INF/views/inc/nav.jsp" %>

		<!-- Main -->
		<div id="main">

			<!-- Logout -->
			<article id="logout" class="panel">

				<c:if test="${not empty auth}">
					<form method="post" action="/cafe/user/logout.do">
						<div class="logout-form">
							<div class="comment">로그아웃 하시겠습니까?</div>
							<div class="buttons">
								<button type="button" id="btnBack" onclick="history.back();">뒤로가기</button>
								<button type="submit" id="btnLogout">로그아웃</button>
							</div>
						</div>
					</form>
				</c:if>

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

</body>
</html>
