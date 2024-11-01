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
        <link rel="stylesheet" href="assets/css/main.css" />
        <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

        <style>
            @import url("/CafeSeatProject/src/main/webapp/assets/css/paperlogy_font.css");

            body {
                font-family: 'Paperlogy-8ExtraBold';
            }

            .panel-content {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            h1 {
                text-align: center;
                font-family: 'Paperlogy-8ExtraBold';
                font-size: 45px; 
                margin-bottom: 40px;
            }

            .box {
				width: 450px;       
				height: 150px;    
				background-color: #f0f0f0; 
				border: 2px solid #ccc;    
				border-radius: 15px;
				display: flex;      
				flex-direction: column;
				justify-content: center;   
				align-items: center;        
				/* margin: 20px;      
				padding: 10px;      */
			}

			.header {
				font-size: 28px;
				margin-bottom: 10px;
			}

			.content {
				font-size: 18px;
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
                    <h1 class="findPwFrom">쿠폰함</h1>
                    <div class="panel-content">
                        <form method="post" action="실제 처리할 URL">
                            <div class="box" id="conpon">
                               	<div class="header">
									아메리카노 무료 쿠폰<br>
								</div>
								<div class="content">
									발급 날짜 : 2024. 10. 26
								</div>
                            </div>
                        </form>   
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
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/browser.min.js"></script>
        <script src="assets/js/breakpoints.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>

        <script>
            document.getElementById('loginButton').addEventListener('click', function() {
                location.href = '/cafe/user/login.do#login'; // 버튼 클릭 시 해당 URL로 이동
            });
        </script>

    </body>
</html>
