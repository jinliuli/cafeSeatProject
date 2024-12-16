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
		<link rel="stylesheet" href="/cafe/assets/css/menuoptions.css" />
		<noscript><link rel="stylesheet" href="/cafe/assets/css/noscript.css" /></noscript>
	</head>
	<style>
		
	</style>
	<body class="is-preload" style="-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none">

		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
				<%@ include file="/WEB-INF/views/inc/nav.jsp" %>

					<!-- Main -->
					<div id="main">

							<!-- 옵션 메뉴 -->
							<article id="mainmenu" class="panel">
								<h2>${dto.name}</h2>
								<p>${dto.description}</p>
								<div id="optionImg">
									<c:if test="${dto.seqCategory != '3'}">
										<img src="/cafe/assets/pic/menuImages/drink/${dto.image}" alt="">
									</c:if>
									<c:if test="${dto.seqCategory == '3'}">
										<img src="/cafe/assets/pic/menuImages/dessert/${dto.image}" alt="">
									</c:if>
								</div>
								<form method="POST" action="/cafe/menu/menuoptions.do">
									<input type="hidden" name="seq" value="${dto.seq}">
									<input type="hidden" name="seqCategory" value="${dto.seqCategory}">
									<c:if test="${dto.seqCategory != '3'}">
										<div id="option">
											<div class="optionName">1. 온도(ICE or HOT)</div>
												<div class="radio_temperature">
													<input id="temper_ice" type="radio" class="temperature" name="temperature" value="1" required>
													<label for="temper_ice">ICE</label>
												</div>
												<div class="radio_temperature">
													<input id="temper_hot" type="radio" class="temperature" name="temperature" value="2">
													<label for="temper_hot">HOT</label>
												</div>
												
											<div class="optionName">2. 사이즈(Size)</div>
												<div class="radio_cupsize">
													<input id="size_regular" type="radio" class="size" name="size" value="0" required>
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
												
											<div class="optionName">3. 얼음 양(Ice Amount)</div>
												<div class="radio_iceamount">
													<input id="icefew" type="radio" class="iceamount" name="iceamount" value="0" required>
													<label for="icefew">얼음 적게</label>
												</div>
												<div class="radio_iceamount">
													<input id="icebasic" type="radio" class="iceamount" name="iceamount" value="1">
													<label for="icebasic">기본</label>
												</div>
												<div class="radio_iceamount">
													<input id="icelots" type="radio" class="iceamount" name="iceamount" value="2">
													<label for="icelots">얼음 많이</label>
												</div>
												
											<div class="optionName">4. 샷 추가(Shot)</div>
												<div class="radio_shotadd">
													<input id="noshot" type="radio" class="shotadd" name="shotadd" value="1" required>
													<label for="noshot">기본</label>
												</div>
												<div class="radio_shotadd">
													<input id="shot" type="radio" class="shotadd" name="shotadd" value="2">
													<label for="shot">샷 추가</label>
												</div>
										</div>
									</c:if>
								<div id="select">
									<input type="number" name="totalCount" id="totalCount" min="1" max="10" placeholder="수량" required>
									<button type="submit" class="options">선택</button>
									<button type="button" class="back" onclick="location.href='/cafe/menu/menulist.do';">취소</button>
								</div>
								</form>												
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
				
				document.querySelector('.options').addEventListener('click', function() {
				    
					const seqCategory = document.querySelector('input[name="seqCategory"]').value;
				    const totalCount = document.getElementById('totalCount').value || 1; // 기본값을 1로 설정
				    
				    if (seqCategory != 3) {
				    	
						const temperature = document.querySelector('input[name="temperature"]:checked')?.value;
					    const size = document.querySelector('input[name="size"]:checked')?.value;
					    const iceamount = document.querySelector('input[name="iceamount"]:checked')?.value;
					    const shotadd = document.querySelector('input[name="shotadd"]:checked')?.value;
					    
					    if (!temperature) {
					        alert('온도를 선택해 주세요.');
					        return; // 온도를 선택하지 않았으면 종료
					    }
		
					    if (!size) {
					        alert('사이즈를 선택해 주세요.');
					        return; // 사이즈를 선택하지 않았으면 종료
					    }
					    
		
					    if (!iceamount) {
					        alert('얼음 양을 선택해 주세요.');
					        return; // 얼음 양을 선택하지 않았으면 종료
					    }
					    
		
					    if (!shotadd) {
					        alert('샷추가 여부를 선택해 주세요.');
					        return; // 샷 추가를 선택하지 않았으면 종료
					    }
				    }
	
				});
				
				const temperature = $('input:radio[name="temperature"]:checked').val();
			    const size = $('input:radio[name="size"]:checked').val();
			    const iceamount = $('input:radio[name="iceamount"]:checked').val();
			    const shotadd = $('input:radio[name="shotadd"]:checked').val();
			    
			    
			    const totalCount = document.getElementById('totalCount').value || 1; // 기본값을 1로 설정
				
				
		    

		
		</script>

</body>
</html>