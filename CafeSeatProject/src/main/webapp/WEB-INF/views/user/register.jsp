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
                           
            <!-- Register -->
            <!-- 아이디 중복체크는 server -> AjaxTest -> Ex05 시리즈 참조 -->
			<article id="register" class="panel">
				<form method="post" action="/cafe/user/register.do">
					<h1 class="title">회원가입 정보</h1>
					<div class="register-info">
						<table class="register-table">
							<tr>
								<th>아이디</th>
								<td>
	                              	<div id="id-container">
	                                  <input type="text" name="id" id="id" placeholder="영문, 숫자 조합 5~12자" required>
	                                  <input type="button" value="중복검사" id="btnCheck">
	                                </div> 
	                                <span id="idResult"></span>
	                            </td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>
									<div id="pw-container">
										<input type="password" name="pw" id="pw" placeholder="영문, 숫자, 특수문자 3가지 조합 9~16자" required>
									</div>
									<span id="pwResult"></span>
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td>
									<div id="pwCheck-container">
										<input type="password" name="checkPw" id="checkPw" placeholder="비밀번호를 한 번 더 입력해주세요" required>
									</div>
									<span id="pwCheckResult"></span>
								</td>
							</tr>
						</table>
					</div>

					<h1 class="title">회원 정보</h1>
					<div class="member-info">
						<table class="member-table">
							<tr>
								<th>회원 유형</th>
								<td class="member-options">
									<input type="radio" id="user" class="opt-member" name="opt-member" value="user" checked>
									<label for="user" class="choice">개인</label> 
									<input type="radio" id="admin" class="opt-member" name="opt-member" value="admin">
									<label for="admin" class="choice">사업자</label> 
									<input type="hidden" name="loginType" id="loginType" value="user">
								</td>
							</tr>
							<tr>
								<th>성명</th>
								<td>
									<div id="name-container">
										<input type="text" name="name" id="name" placeholder="이름" required>
									</div>
									<span id="nameResult"></span>
								</td>
									
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<div id="tel-container">
										<input type="text" name="tel" id="tel" placeholder="010-1234-5678" required>
									</div>
									<span id="telResult"></span>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<div id="email-container">
										<input type="email" name="email" id="email" placeholder="example@example.com" required>
									</div>
									<span id="emailResult"></span>
								</td>
							</tr>
						</table>
					</div>
					<div class="register-button">
						<button class="btnRegister" type="submit">가입하기</button>
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

	     	/* 실시간 아이디 유효성 검사 */
	        $('#id').on('input', function() {
	            const id = $('#id').val().trim();
	            
	            // 아이디 조건 (영문자, 숫자 조합 5~12자)
	            const idPattern = /^[a-zA-Z0-9]{5,12}$/;
	            let idValid = idPattern.test(id); // 아이디 유효성 체크
	            
	            if (!idValid) {
	                $('#idResult').text('아이디는 영문자와 숫자 조합으로 5 ~ 12자로 입력해주세요.')
            			.addClass('color-red inline-block margin-10px'); 
	                $('#btnCheck').prop('disabled', true); // 중복검사 버튼 비활성화
	            } else {
	                $('#idResult').text('아이디 중복 검사를 해주세요.')
	                $('#btnCheck').prop('disabled', false); // 중복검사 버튼 활성화
	            }
	        });
        	
	     	/* 아이디 중복 검사 */
            $('#btnCheck').click(() => {
                if ($('input[name=id]').val().trim() == '') return;

                $.ajax({
                    type: 'POST',
                    url: '/cafe/user/checkId.do',
                    data: 'id=' + $('input[name=id]').val(),
                    success: function(result) {
                        if (result == '1') {
                            $('#idResult').text('이미 사용중인 아이디입니다.')
                    			.addClass('color-red inline-block margin-10px');  
                            $('#btnRegister').prop('disabled', true);
                        } else {
                            $('#idResult').text('사용 가능한 아이디입니다.')	
	                            .removeClass('color-red')  
                    			.addClass('color-blue');
                            $('#btnRegister').prop('disabled', false);
                        }
                    }, 
                    error: function() {
                        $('#idResult').text('오류가 발생했습니다. 다시 시도해주세요.')
	                        .addClass('color-red inline-block margin-10px');
                    },
                    complete: function() {
                        $('#btnCheck').prop('disabled', false); // 요청 완료 후 버튼 활성화
                    }
                });
            });
            
           	/* 비밀번호 유효성 검사 */
            $('#pw, #checkPw').on('input', function() {
			    const pw = $('#pw').val();
			    const checkPw = $('#checkPw').val();
			    
			 	// 비밀번호 조건 (영문자, 숫자, 특수문자 포함, 9~16자)
			    const pwPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&+=~*])[A-Za-z\d!@#$%^&+=~*]{9,16}$/;
			    
			    let pwValid = pwPattern.test(pw); // 비밀번호 유효성 체크
			    let pwMatch = pw === checkPw; 	  // 비밀번호 일치 여부 체크
			    
			 	// 비밀번호 조건 만족하지 않을 경우 메시지 표시
			    if (!pwValid) {
			    	$('#pwResult').text('비밀번호는 9 ~ 16자로 영문자, 숫자, 특수문자를 포함해야 합니다.')
			            .addClass('color-red inline-block margin-10px');  // 새로운 클래스 추가
			    }  else {
			        $('#pwResult').text('') // 조건 만족 시 메시지 제거
				        .removeClass();  
			    }
			    
			    // 비밀번호 일치 여부 체크
			    if (checkPw !== '') { // 비밀번호 확인란에 입력이 있을 때만 검사
        			if (!pwMatch) {   // 비밀번호가 일치하지 않으면
				        $('#pwCheckResult').text('비밀번호가 일치하지 않습니다. 다시 입력해주세요.')
                			.addClass('color-red inline-block margin-10px');
        			} else { // 비밀번호가 일치하면
        				$('#pwCheckResult').text('비밀번호가 일치합니다.')
				        	.removeClass('color-red')  
                			.addClass('color-blue');  
        			}
			    } 
            });	
           	
            $(document).ready(function() {
                /* 성명 유효성 검사 (한글 2~10자) */
                $('#name').on('input', function() {
                    const name = $('#name').val().trim();
                    const namePattern = /^[a-zA-Z가-힣]{2,10}$/; 
                    let nameValid = namePattern.test(name);
                    
                    if (!nameValid) {
                        $('#nameResult').text('한글 또는 영어로 2 ~ 10자로 입력해주세요.')
                            .addClass('color-red inline-block margin-10px');
                    } else {
                        $('#nameResult').text('')
                            .removeClass();
                    }
                });

                /* 전화번호 유효성 검사 (11자리 숫자, 하이픈 포함) */
                $('#tel').on('input', function() {
                    const tel = $('#tel').val().trim();
                    const telPattern = /^\d{3}-\d{4}-\d{4}$/; 
                    let telValid = telPattern.test(tel);
                    
                    if (!telValid) {
                        $('#telResult').text('하이픈(-)을 포함하여 입력해주세요.')
                            .addClass('color-red inline-block margin-10px');
                    } else {
                        $('#telResult').text('')
                            .removeClass();
                    }
                }); 

                /* 이메일 유효성 검사 */
                $('#email').on('input', function() {
                    const email = $('#email').val().trim();
                    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 
                    let emailValid = emailPattern.test(email);
                    
                    if (!emailValid) {
                        $('#emailResult').text('이메일 형식이 올바르지 않습니다.')
                            .addClass('color-red inline-block margin-10px');
                    } else {
                        $('#emailResult').text('')
                            .removeClass();
                    }
                });
            });
           	

            /* 회원유형으로 사업자 선택 시 > 사업자 등록번호 입력란 생성 */
            $('input[name="opt-member"]').change(function() {
                const selectedValue = $(this).val();
                const newRows = `
                	<table class="additional-table">
	                    <tr>
	                        <th>사업자 등록번호</th>
	                        <td>
	                        	<div id="companyId-container">
	                        		<input type="text" name="companyId" id="companyId" placeholder="123-45-67890" required>
	                        	<div>
	                        	<span id="companyIdResult"></span>
	                        </td>
	                    </tr>
                    </table>
                `;

                $('.additional-table').remove();		// 기존 행 삭제

                if (selectedValue === 'admin') {
                    $('.member-info').append(newRows);	// 새 행 추가
                 	
                    /* 사업자 등록번호 유효성 검사 */
                    $('#companyId').on('input', function() {
                        const companyId = $(this).val().trim();
                        const companyIdPattern = /^\d{3}-\d{2}-\d{5}$/; 
                        let companyIdValid = companyIdPattern.test(companyId);

                        if (!companyIdValid) {
                            $('#companyIdResult').text('하이픈(-)을 포함하여 입력해주세요.')
                                .addClass('color-red inline-block margin-10px');
                        } else {
                            $('#companyIdResult').text('')
                                .removeClass();
                        }
                    });
                }
            });
            
        </script>
    </body>
</html>