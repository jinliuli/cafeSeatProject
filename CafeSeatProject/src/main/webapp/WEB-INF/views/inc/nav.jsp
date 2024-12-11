<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav id="nav"
	style="display: flex; align-items: center; justify-content: space-between;">
	<div class="logo" style="margin-right: 750px;">
		<a href="/cafe/cafe/cafemap.do" style="opacity: 1;"> <img src="../images/Logo.png"
			style="width: 350px; height: 100px;" alt="Logo">
		</a>
	</div>
	<div style="flex: 1; display: flex; justify-content: center;">
		<a href="/cafe/cafe/cafemap.do#home" class="icon solid fa-map"><span>Map</span></a>
		<a href="/cafe/seat/selectseat.do#cafeseat"
			class="icon solid fa-mug-hot"><span>CafeSeat</span></a> <a
			href="/cafe/mypage/mypage.do#mypage" class="icon solid fa-heart"><span>MyPage</span></a>

		<!-- 로그인 안 했을 때 -->
		<c:if test="${empty auth}">
			<a href="/cafe/user/login.do#login" class="icon solid fa-user"><span>Login</span></a>
		</c:if>

		<!-- 로그인 했을 때  -->
		<c:if test="${not empty auth}">
			<a href="/cafe/user/logout.do" class="icon solid fa-user"><span>Logout</span></a>
		</c:if>
	</div>
</nav>
