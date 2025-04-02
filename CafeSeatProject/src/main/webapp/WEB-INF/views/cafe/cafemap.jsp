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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/map.css" />
<!-- <noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript> -->
<script src="https://kit.fontawesome.com/1ddf83a78d.js"
	crossorigin="anonymous"></script>
</head>
<style>
@import url("/cafe/assets/css/paperlogy_font.css");

body {
	font-family: 'Paperlogy-8ExtraBold';
}
</style>
<body class="is-preload">

	<%-- <%@ include file="/WEB-INF/views/inc/dev.jsp"%> --%>
	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Nav -->
		<%@ include file="/WEB-INF/views/inc/nav.jsp"%>

		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="home" class="panel intro">
				<div class="map_wrap">
					<div id="map"></div>

					<div id="menu_wrap" class="bg_white">
						<div class="option">
							<div>

								<form action="/cafe/cafemap.do" method="GET">
									<div class="search-box">
										<input class="keyword" type="text" name="cseq" id="cseq" size="15" placeholder="검색어를 입력하세요">
										<button type="submit" class="search-btn">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</form>

							</div>
						</div>
						<hr>
						<ul id="placesList">
						<!-- 
							<c:forEach items="${list}" var="dto">
								<li class=item><span class="markerbg marker_${dto.cseq}"></span>
									<div class="info">

										<div class="info-title">
											<h5>${dto.name}</h5>
											<form method="POST" action="/cafe/cafe/cafemap.do#cafeseat">
												<input type="hidden" id="cseq" name="cseq"
													value="${dto.cseq}"> <input type="submit"
													class="btntitle" value="예약">
											</form>
										</div>


										
										기존에 카페 선택 페이지에서 좌석 선택 페이지로 갈 때 
										GET방식으로 카페 번호를 query string에 입력해서 보내 줬는데,
										이걸 세션으로 넘겨주는 방식으로 수정. 이에 맞게 예약 버튼을 누르면
										본인 페이지로 한 번 더 카페 정보를 가지고 서블릿으로 이동하고
										서블릿은 해당 정보를 세션에 입력하고 알맞은 카페로 이동 시켜줌 
 										<div class="info-title">
											<h5>${dto.name}</h5>
											<input type="submit" id="btntitle${dto.cseq}"
												class="btntitle" value="예약" data-value="${dto.cseq}">
										</div> 
										

										<span>${dto.address}</span> <span class="jibun gray">${dto.lotAddress}</span>
										<span class="tel">${dto.tel}</span>
									</div></li>

							</c:forEach>-->
						</ul>
						<div id="pagination"></div>
					</div>
				</div>


			</article>

			<!-- CafeSeat -->
			<article id="cafeseat" class="panel"></article>

			<!-- Mypage -->
			<article id="mypage" class="panel"></article>


			<!-- Login -->
			<article id="login" class="panel"></article>
		</div>


		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	</div>

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
	<!-- 개인 API키 마스킹 처리. 추후에 사용 시 프로젝트 디코방에서 API 확인 가능. -->
	<script type="text/javascript"
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=0000000000000000000000000000000000000=services"></script>
	<!-- <script src="../assets/js/cafe/map.js"></script> -->

	<script>
		var markers = []; // 마커를 저장할 배열

		// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
		var mapContainer = document.getElementById('map'), mapOption = {
			center : new kakao.maps.LatLng(37.499312, 127.033228), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성

		// 마커 이미지 설정
		var imageSrc = "../images/location-pointer.png"; // 마커 이미지 경로
		var imageSize = new kakao.maps.Size(36, 36); // 마커 이미지 크기
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); // 마커 이미지 생성

		// 인포윈도우 생성
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		var cafeList = []; // 카페 데이터를 저장할 배열

		// 서버에서 받아온 카페 데이터를 cafeList에 저장
		<c:forEach items="${list}" var="dto">
		cafeList.push({
			name : "${dto.name}",
			lat : "${dto.lat}",
			lng : "${dto.lng}",
			address : "${dto.address}",
			lotAddress : "${dto.lotAddress}",
			tel : "${dto.tel}",
			cseq : "${dto.cseq}"
		});
		</c:forEach>

		// 지도 중심을 부드럽게 이동시키는 함수
		function panTo(lat, lng) {
			var moveLatLon = new kakao.maps.LatLng(lat, lng);
			map.panTo(moveLatLon); // 지도 중심을 부드럽게 이동
		}

		// 초기 마커 표시 및 검색 함수
		function displayCafes(cafes) {
			removeMarkers(); // 기존 마커 제거

			var bounds = new kakao.maps.LatLngBounds();

			for (var i = 0; i < cafes.length; i++) {
				var cafe = cafes[i];
				var position = new kakao.maps.LatLng(cafe.lat, cafe.lng);

				var marker = new kakao.maps.Marker({
					map : map,
					position : position,
					image : markerImage
				});

				markers.push(marker);
				bounds.extend(position);

				// 마커 클릭 이벤트
				kakao.maps.event.addListener(marker, 'click', (function(cafe) {
					return function() {
						displayInfowindow(this, cafe);
						panTo(cafe.lat, cafe.lng); // 클릭한 마커로 지도 중심 이동
					};
				})(cafe));
			}

			map.setBounds(bounds); // 모든 마커가 보이도록 지도 범위 재설정
		}

		// 인포윈도우를 표시하는 함수
		function displayInfowindow(marker, cafe) {
			var content = '<div style="padding:5px;z-index:1;">' + '<h5>'
					+ cafe.name + '</h5>' + '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 마커를 제거하는 함수
		function removeMarkers() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색 결과 목록을 표시하는 함수
		function displayPlaces(cafes) {
			var listEl = document.getElementById('placesList'), fragment = document
					.createDocumentFragment();

			removeAllChildNodes(listEl); // 기존 검색 결과 제거

			for (var i = 0; i < cafes.length; i++) {
				var itemEl = getListItem(i, cafes[i]);
				fragment.appendChild(itemEl);
			}

			listEl.appendChild(fragment);
		}

		// 검색결과 항목을 Element로 반환하는 함수
		function getListItem(index, cafe) {
			var el = document.createElement('li'), itemStr = 
			'<span class="markerbg marker_' + (index + 1) + '"></span>' +
		    '<div class="info">' +
		    '   <div class="info-title">' +
		    '       <h5>' + cafe.name + '</h5>' +
		    '       <form method="POST" action="/cafe/cafe/cafemap.do#cafeseat">' +
		    '           <input type="hidden" name="cseq" value="' + cafe.cseq + '">' +
		    '           <input onclick="reserveSeat(' + cafe.cseq + ')" type="submit" class="btntitle" value="예약">' +
		    '       </form>' +
		    '   </div>' +
		    '   <span>' + cafe.address + '</span>' +
		    '   <span class="gray"><img src="../images/places_jibun.png" alt="지번"/><a>' + cafe.lotAddress + '</a></span>' +
		    '   <span class="tel">' + cafe.tel + '</span>' +
		    '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			// 목록 항목 클릭 이벤트
			el.onclick = function() {
				displayInfowindow(markers[index], cafe);
				panTo(cafe.lat, cafe.lng); // 클릭한 항목으로 지도 중심 이동
			};

			return el;
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수
		function removeAllChildNodes(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

		// 검색 기능
		document.querySelector('.search-btn').addEventListener(
				'click',
				function(e) {
					e.preventDefault();
					var cseq = document.getElementById('cseq').value
							.toLowerCase();
					var filteredCafes = cafeList
							.filter(function(cafe) {
								return cafe.name.toLowerCase()
										.includes(cseq)
										|| cafe.address.toLowerCase().includes(
												cseq);
							});
					displayCafes(filteredCafes);
					displayPlaces(filteredCafes); // 검색 결과 목록 표시 추가
					infowindow.close(); //인포윈도우 닫기
				});

		// 페이지 로드 시 모든 카페 표시
		window.onload = function() {
			displayCafes(cafeList);
			displayPlaces(cafeList); // 초기 목록 표시 추가
		};
	</script>

</body>
</html>
