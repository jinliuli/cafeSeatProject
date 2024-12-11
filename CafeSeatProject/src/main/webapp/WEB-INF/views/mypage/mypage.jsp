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
<title>CafeSeat</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="../assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="../assets/css/noscript.css" />
</noscript>
</head>
<style>
@import url("/cafe/assets/css/paperlogy_font.css");

body {
	font-family: 'Paperlogy-8ExtraBold';
}

#mypage h1 {
	border: 5px solid #AF8F6F;
	background-color: #AF8F6F;
	padding: 25px;
	margin-bottom: 40px;
	margin-left: 80px;
	margin-right: 80px;
	margin-top: 0;
	text-align: center;
	color: #F8F4E1;
	border-radius: 20px;
	font-family: 'Paperlogy-6SemiBold';
}

#mypage div {
	padding: 0;
	justify-content: center;
	text-align: center;
	font-family: 'Paperlogy-5Medium';
}

#mypage div input {
	margin: 0 50px 50px 50px;
	border: 3px solid #AF8F6F;
	background-color: #AF8F6F;
	color: #F8F4E1;
}

#mypage div input:hover {
	border: 3px solid #AF8F6F;
	background-color: #F8F4E1;
	color: #AF8F6F;
}

#content-box {
	border: 3px solid #543310;
	padding: 40px;
	border-radius: 20px;
	margin-left: 80px;
	margin-right: 80px;
	width: auto;
	height: auto;
	background-color: #74512D;
}

#mypage div .content-info {
	border: 5px solid #74512D;
	margin: 30px;
	border-radius: 20px;
	background-color: white;
	font-family: 'Paperlogy-5Medium';
}

#mypage div .content-info:hover {
	border: 5px solid##74512D;
	margin: 30px;
	border-radius: 20px;
	background-color: #F8F4E1;
}

#mypage .content-info span:nth-child(1) {
	display: block;
	text-align: left;
	padding-left: 30px;
	margin-top: 40px;
	font-size: larger;
	color: #543310;
}

#mypage .content-info span:nth-child(2) {
	display: block;
	text-align: right;
	padding-right: 30px;
	margin-bottom: 20px;
	color: #AF8F6F;
}

#mypage .content-info span:nth-child(3) {
	display: block;
	text-align: right;
	padding-right: 30px;
	margin-bottom: 20px;
	color: #AF8F6F;
}
</style>
<body class="is-preload">

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Nav -->
		<%@ include file="/WEB-INF/views/inc/nav.jsp" %>
		
		<!-- Main -->
		<div id="main">

<!-- 			<!-- map -- >
			<article id="home" class="panel intro"></article>


			
			<article id="cafeseat" class="panel"></article>-->


		
			<article id="mypage" class="panel"> 
				<h1>MYPAGE</h1>
				<div>
				    <input type="button" class="btn btn-outline-primary btn-lg" id="btn-reservation" value="예약내역">
				    <input type="button" class="btn btn-outline-primary btn-lg" id="btn-favorite" value="즐겨찾기">
				    <input type="button" class="btn btn-outline-primary btn-lg" id="btn-coupon" value="쿠폰함">
				    <input type="button" class="btn btn-outline-primary btn-lg" id="btn-myinfo" value="내정보">
				</div>
				<div id="content"></div>
			</article>
<!-- 

			login
			<article id="login" class="panel"></article>
		</div>
 -->

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

	</div>

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="..//assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
	
	<script>
	$(document).ready(function() {
	    var currentContent = '';

	    function toggleContent(buttonId, content) {
	        if (currentContent === buttonId) {
	            $('#content').empty();
	            currentContent = '';
	        } else {
	            $('#content').empty().append(content);
	            currentContent = buttonId;
	        }
	    }

	    $("#btn-favorite").click(function() {
	        var favoriteContent = `
	            <div id="content-box">
	                <div class="content-info">
	                    <span>투썸플레이스 역삼성홍타워점</span>
	                    <span>남은좌석수: 20석</span>
	                </div>
	                <div class="content-info">
	                    <span>투썸플레이스 강남대륭타워점</span>
	                    <span>남은좌석수: 20석</span>
	                </div>
	                <div class="content-info">
	                    <span>스타벅스 강남R점</span>
	                    <span>남은좌석수: 20석</span>
	                </div>
	            </div>
	        `;
	        toggleContent('favorite', favoriteContent);
	    });

	    $("#btn-reservation").click(function() {
	        var reservationContent = `
	            <div id="content-box">
	                <div class="content-info">
	                    <span>투썸플레이스 역삼성홍타워점</span>
	                    <span>예약좌석: 00</span>
	                    <span>예약날짜: 2024-12-11</span>
	                </div>
	            </div>
	        `;
	        toggleContent('reservation', reservationContent);
	    });

	    $("#btn-coupon").click(function() {
	        var couponContent = `
	            <div id="content-box">
	                <div class="content-info">
	                    <span>아메리카노 1잔 무료</span>
	                    <span>유효기간: 2024-12-31</span>
	                </div>
	            </div>
	        `;
	        toggleContent('coupon', couponContent);
	    });

	    $("#btn-myinfo").click(function() {
	        var myInfoContent = `
	            <div id="content-box">
	                <div class="content-info">
	                    <span>이름: 홍길동</span>
	                    <span>이메일: hong@example.com</span>
	                    <span>전화번호: 010-1234-5678</span>
	                </div>
	            </div>
	        `;
	        toggleContent('myinfo', myInfoContent);
	    });
	});
		
	</script>

</body>
</html>