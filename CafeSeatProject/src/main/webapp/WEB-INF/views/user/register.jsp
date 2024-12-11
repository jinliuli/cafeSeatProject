<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>CafeSeat</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/cafe/assets/css/main.css" />
    <link rel="stylesheet" href="/cafe/assets/css/register.css" />
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

            <!-- Me -->
            <article id="home" class="panel intro">
                 
            </article>

            <!-- CafeSeat -->
            <article id="cafeseat" class="panel">
                
            </article>

            <!-- Mypage -->
            <article id="mypage" class="panel">
                
            </article>
                           
                           
               <!-- Register -->
               <!-- 아이디 중복체크는 server -> AjaxTest -> Ex05 시리즈 참조 -->
               <article id="register" class="panel">
	              <form method="post" action="/cafe/user/register.do">
	                  <h1>회원가입 정보</h1>
	                  <div class="login-info">
	                      <table class="login-info-table">
	                          <tr>
	                              <th>아이디</th>
	                              <td>
	                                  <input type="text" name="id" id="id" placeholder="영문, 숫자 조합 5~12자" required>
	                                  <input type="button" value="중복검사" id="btnCheck">
	                                  <span id="result"></span>
	                              </td>
	                          </tr>
	                          <tr>
	                              <th>비밀번호</th>
	                              <td><input type="password" name="pw" id="pw" placeholder="영문, 숫자, 특수문자 3가지 조합 9~16자" required></td>
	                          </tr>
	                          <tr>
	                              <th>비밀번호 확인</th>
	                              <td><input type="password" name="checkPw" id="checkPw" placeholder="위와 동일한 비밀번호를 입력해주세요" required></td>
	                          </tr>
	                      </table>
	                  </div>
	                  
	                  <h1>회원 정보</h1>
	                  <div class="member-info">
	                      <table class="member-info-table">
	                          <tr>
	                              <th>회원 정보</th>
	                              <td>
	                                  <div class="option">
	                                      <input type="radio" id="user" class="opt-member" name="opt-member" value="user" checked>
	                                      <label for="user" class="choice">개인</label>
	                                  </div>
	                                  <div class="option">
	                                      <input type="radio" id="admin" class="opt-member" name="opt-member" value="admin">
	                                      <label for="admin" class="choice">사업자</label>
	                                  </div>
	
	                                  <input type="hidden" name="loginType" id="loginType" value="user">
	                                  
	                              </td>
	                          </tr>
	                          <tr>
	                              <th>성명</th>
	                              <td><input type="text" name="name" id="name" placeholder="이름" required></td>
	                          </tr>
	                          <tr>
	                              <th>전화번호</th>
	                              <td><input type="text" name="tel" id="tel" placeholder="010-1234-5678" required></td>
	                          </tr>
	                          <tr>
	                              <th>이메일</th>
	                              <td><input type="email" name="email" id="email" placeholder="example@example.com" required></td>
	                          </tr>
	                      </table>
	                   </div>
	                   <div id="btnSignup">
	                       <button type="submit">가입하기</button>
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


            $('#btnCheck').click(() => {
                if ($('input[name=id]').val().trim() == '') return;

                $.ajax({
                    type: 'POST',
                    url: '실제 처리할 URL',
                    data: 'id=' + $('input[name=id]').val(),
                    success: function(result) {
                        if (result == '1') {
                            $('#result').text('이미 사용중인 아이디입니다.');
                            $('input[type=submit]').prop('disabled', true);
                        } else {
                            $('#result').text('사용 가능한 아이디입니다.');
                            $('input[type=submit]').prop('disabled', false);
                        }
                    }
                });
            });

            $('input[name="opt-member"]').change(function() {
                const selectedValue = $(this).val();
                const newRows = `
                    <tr class="additional-info">
                        <th>사업자 등록번호</th>
                        <td><input type="text" name="companyId" id="companyId" placeholder="123-45-67890" required></td>
                    </tr>
                `;

                $('.additional-info').remove();

                if (selectedValue === 'admin') {
                    $('.member-info-table').append(newRows);
                }
            });
            
        </script>
    </body>
</html>
