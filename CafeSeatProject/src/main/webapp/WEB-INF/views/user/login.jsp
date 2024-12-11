<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>CafeSeat</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/cafe/assets/css/main.css" />
	<link rel="stylesheet" href="../assets/css/login.css" />
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
		<%@ include file="/WEB-INF/views/inc/nav.jsp"%>

		<!-- Main -->
		<div id="main">

			<!-- Login -->
			<article id="login" class="panel">

				<c:if test="${empty auth}">

					<div class="banner">
						<a href="/cafe/cafe/cafemap.do" style="opacity: 1;"> <img
							src="../images/Logo-Dark.png" alt="Logo">
						</a>
					</div>
					<div class="panel-content">
						<div class="opt-login-form">
							<input type="radio" id="user" class="opt-login" name="opt-login" value="user" checked> 
								<label for="user" class="choice">사용자 로그인</label> 
							<input type="radio" id="admin" class="opt-login" name="opt-login" value="admin"> 
								<label for="admin" class="choice">관리자 로그인</label>
						</div>

						<form method="post" action="/cafe/user/login.do">
							<div class="login-form">
								<table class="login-table">
									<tr>
										<th>아이디</th>
										<td><input type="text" name="id" id="id"
											placeholder="영문, 숫자 조합 5~12자" required></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name="pw" id="pw"
											placeholder="영문, 숫자, 특수문자 3가지 조합 9~16자" required></td>
									</tr>
								</table>
								<input type="hidden" name="loginType" id="loginType" value="user">
							</div>

							<div class="btnLogin">
								<button class="loginBtn" type="submit">로그인</button>
							</div>
						</form>

						<!-- 빠른 로그인을 위한 원클릭 로그인 버튼: 테스트 후 삭제 예정 -->
						<div style="font-size: .8em;">사용자 계정</div>
						<div style="display: flex;">
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="user">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="user">
								<input type="submit" value="사용자">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="yuri">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="user">
								<input type="submit" value="김유리">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="yujin">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="user">
								<input type="submit" value="김유진">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="woojin">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="user">
								<input type="submit" value="이우진">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="jiyun">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="user">
								<input type="submit" value="장지윤">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="sangsoo">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="user">
								<input type="submit" value="전상수">
							</form>
						</div>
						<div style="font-size: .8em;">관리자 계정</div>
						<div style="display: flex;">
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="admin">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="admin">
								<input type="submit" value="관리자">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="yuri">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="admin">
								<input type="submit" value="김유리">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="yujin">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="admin">
								<input type="submit" value="김유진">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="woojin">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="admin">
								<input type="submit" value="이우진">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="jiyun">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="admin">
								<input type="submit" value="장지윤">
							</form>
							<form method="POST" action="/cafe/user/login.do">
								<input type="hidden" name="id" value="sangsoo">
								<input type="hidden" name="pw" value="1111">
								<input type="hidden" name="loginType" value="admin">
								<input type="submit" value="전상수">
							</form>
						</div>

						<div class="link">
							<a href="#" class="register"
								onclick="alert('회원가입 페이지로 이동합니다!'); location.href='/cafe/user/register.do#login';">회원가입</a>
							<a href="#" class="findId"
								onclick="alert('아이디 찾기 페이지로 이동합니다!'); location.href='/cafe/user/findId.do';">아이디
								찾기</a> <a href="#" class="findPw"
								onclick="alert('비밀번호 찾기 페이지로 이동합니다!'); location.href='/cafe/user/findPw.do';">비밀번호
								찾기</a>
						</div>
					</div>
				</c:if>

			</article>

			<!-- Me -->
			<article id="home" class="panel intro"></article>

			<!-- CafeSeat -->
			<article id="cafeseat" class="panel"></article>

			<!-- Mypage -->
			<article id="mypage" class="panel"></article>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	</div>

	<!-- Scripts -->
	<script src="/cafe/assets/js/jquery.min.js"></script>
	<script src="/cafe/assets/js/browser.min.js"></script>
	<script src="/cafe/assets/js/breakpoints.min.js"></script>
	<script src="/cafe/assets/js/util.js"></script>
	<script src="/cafe/assets/js/main.js"></script>

	<script>
		document.querySelectorAll('input[name="opt-login"]').forEach((radio) => {
		    radio.addEventListener('change', () => {
		        document.getElementById('loginType').value = radio.value; // 히든 필드에 라디오 버튼 값 설정
		    });
		});
   	</script>

</body>
</html>
