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
        <title>Astral by HTML5 UP</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="/cafe/assets/css/main.css" />
        <noscript><link rel="stylesheet" href="/cafe/assets/css/noscript.css" /></noscript>

        <style>
            @import url("/CafeSeatProject/src/main/webapp/assets/css/paperlogy_font.css");

            /* 로그인 -------------------------------------------------------------------------*/
            body {
                font-family: 'Paperlogy-8ExtraBold';
            }

            #Twitter {
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

            .opt-login:checked + label {
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

			#nav .nav-button {
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
               
            }

        </style>
    </head>
    <body class="is-preload">

        <!-- Wrapper-->
        <div id="wrapper">

            <!-- Nav -->
            <nav id="nav">
                <a href="/cafe/cafe/cafemap.do#" class="icon solid fa-map"><span>Map</span></a> 
                <a href="/cafe/seat/selectseat.do#cafeseat" class="icon solid fa-mug-hot"><span>CafeSeat</span></a>
                <a href="#mypage" class="icon solid fa-heart"><span>MyPage</span></a>
                <a href="/cafe/user/login.do#login" class="icon solid fa-user"><span>Login</span></a>
                <button id="loginButton" class="nav-button">로그인</button>
            </nav>

            <!-- Main -->
            <div id="main">

                <!-- Me -->
                <article id="home" class="panel intro">
                    
                </article>

                <!-- CafeSeat -->
                <article id="cafeseat" class="panel">
                    
                </article>

				<!-- Mypage -->
                <article id="mypage" class="panel">
                    
                </article>
									
                <!-- Login -->
                <article id="login" class="panel">
                    <h1 class="banner">사이트명</h1>
                    <div class="panel-content">
                        <form method="post" action="/cafe/user/login.do#login">
                            <div class="opt-login-form">
                                <input type="radio" id="admin" class="opt-login" name="opt-login" value="admin" checked>
                                <label for="admin" class="choice">관리자 로그인</label>    
                                <input type="radio" id="user" class="opt-login" name="opt-login" value="user">
                                <label for="user" class="choice">사용자 로그인</label>
                            </div>

                            <input type="hidden" name="loginType" id="loginType" value="admin">
                            
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
                            </div>

                            <div class="btnLogin">
                                <button type="submit">로그인</button>
                            </div>
                        </form>

                        <div class="link">
                            <a href="#" onclick="alert('회원가입 페이지로 이동합니다!'); location.href='/cafe/use/register.do';">회원가입</a> 
                            <a href="#" onclick="alert('아이디 찾기 페이지로 이동합니다!'); location.href='/cafe/user/findId.do';">아이디 찾기</a>
                            <a href="#" onclick="alert('비밀번호 찾기 페이지로 이동합니다!'); location.href='/cafe/user/findPw.do';">비밀번호 찾기</a>
                        </div>       
                    </div>
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
        <script src="/cafe/assets/js/jquery.min.js"></script>
        <script src="/cafe/assets/js/browser.min.js"></script>
        <script src="/cafe/assets/js/breakpoints.min.js"></script>
        <script src="/cafe/assets/js/util.js"></script>
        <script src="/cafe/assets/js/main.js"></script>

        <script>

            document.getElementById('loginButton').addEventListener('click', function() {
                location.href = '/cafe/user/login.do#login'; // 버튼 클릭 시 해당 URL로 이동
            });

            document.querySelectorAll('input[name="opt-login"]').forEach((radio) => {
                radio.addEventListener('change', () => {
                    document.getElementById('loginType').value = radio.value; // 히든 필드에 라디오 버튼 값 설정
                });
            });

        </script>

    </body>
</html>
