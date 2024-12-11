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
        <title>CafeSeat</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="/cafe/assets/css/main.css" />
        <noscript><link rel="stylesheet" href="/cafe/assets/css/noscript.css" /></noscript>

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
                flex-direction: row; /* 세로 정렬 */
			    justify-content: center; /* 세로 가운데 정렬 */
			    align-items: center;
                width: 100%;
                margin-top: 30px;
                margin-bottom: 30px; 
                gap: 20px;
            }

            .choice {
                font-family: 'Paperlogy-7Bold';
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #F8F4E1;
               	color: #74512D;
                border: none;
                width: 30%;
                height: 65px;
                font-size: 28px;
               	border-radius: 10px;
				margin-bottom: 15px;
            }

            /* 라디오 버튼 label > 커서 올렸을 때 */
            .choice:hover {
            	background-color: #AF8F6F;
             	color: #F8F4E1;
                cursor: pointer;
            }
            
           	 .opt-login:checked + label {
                background-color: #AF8F6F;
             	color: #F8F4E1;
            }

            .login-table th {
            	font-family: 'Paperlogy-8ExtraBold';
                display: flex;
                align-items: center;
                text-align: center;
                color: #74512D;
                font-size: 25px;
            }

            .login-table td {
                font-family: 'Paperlogy-8ExtraBold';
                font-size: 25px;
                display: flex;
                text-align: center;
                align-items: center;
                margin-bottom: 30px;
            }
            
            .login-table #id, .login-table #pw {
            	font-family: 'Paperlogy-6SemiBold';
            	border-radius: 10px;
            	background-color: #F8F4E1;
            	color: #74512D;
            	font-size: 22px;
				border: none; 
                width: 500px;
	            height: 60px; 
	            padding-left: 25px;   
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

            .loginBtn {
            	font-family: 'Paperlogy-7Bold';
            	background-color: #74512D;
             	color: #F8F4E1;
                width: 90%;
                height: 30px;
                font-size: 24px;
                margin-bottom: 20px; 
                border-radius: 10px;
            }
            
            .loginBtn:hover {
            	background-color: #AF8F6F;
             	color: #F8F4E1;
            }

            .link {
            	font-family: 'Paperlogy-7Bold';
                display: flex;
                justify-content: space-between;
                width: 50%;
            }

			.register,
            .findId,
            .findPw {
                font-size: 22px;
                text-align: center;
                white-space: nowrap; /* 글씨를 한 줄로 표시 */
				margin-bottom: 10px;
				color: #777777;
			}
			
			.register:hover,
            .findId:hover,
            .findPw:hover {
            	color: #74512D;
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
            <%@ include file="/WEB-INF/views/inc/nav.jsp" %>

            <!-- Main -->
            <div id="main">
            
            	 <!-- Login -->
                <article id="login" class="panel">
                    
                    <c:if test="${empty auth}">
                        <h1 class="banner">사이트명</h1>
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
                                            <td><input type="text" name="id" id="id" placeholder="영문, 숫자 조합 5~12자" required></td>
                                        </tr>
                                        <tr>
                                            <th>비밀번호</th>
                                            <td><input type="password" name="pw" id="pw" placeholder="영문, 숫자, 특수문자 3가지 조합 9~16자" required></td>
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
                                <a href="#" class="register" onclick="alert('회원가입 페이지로 이동합니다!'); location.href='/cafe/user/register.do#login';">회원가입</a>
                                <a href="#" class="findId" onclick="alert('아이디 찾기 페이지로 이동합니다!'); location.href='/cafe/user/findId.do';">아이디 찾기</a>
                                <a href="#" class="findPw" onclick="alert('비밀번호 찾기 페이지로 이동합니다!'); location.href='/cafe/user/findPw.do';">비밀번호 찾기</a>
                            </div>       
                        </div>
                    </c:if>

                </article>
            
                <!-- Me -->
                <article id="home" class="panel intro">
                    
                </article>

                <!-- CafeSeat -->
                <article id="cafeseat" class="panel">
                    
                </article>

				<!-- Mypage -->
                <article id="mypage" class="panel">
                    
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

            document.querySelectorAll('input[name="opt-login"]').forEach((radio) => {
                radio.addEventListener('change', () => {
                    document.getElementById('loginType').value = radio.value; // 히든 필드에 라디오 버튼 값 설정
                });
            });

        </script>

    </body>
</html>
