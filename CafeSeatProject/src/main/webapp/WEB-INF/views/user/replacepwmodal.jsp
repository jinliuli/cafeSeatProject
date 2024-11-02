<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            @import url("/CafeSeatProject/src/main/webapp/assets/css/paperlogy_font.css");

            body {
                font-family: 'Paperlogy-7ExtraBold';
            }

            .title {
                padding-left: 20px;
            }

            .replace-pw-success {
                border: 5px solid #aaa;
                padding: 30px;
                width: 400px;
                height: 200px;
            }

            .replace-pw {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .header {
                font-family: 'Paperlogy-8ExtraBold';
                font-size: 25px;
                margin-top: 30px;
                margin-bottom: 5px;
            }

            .content {
                font-family: 'Paperlogy-7ExtraBold';
                font-size: 15px;
                margin-bottom: 24px;
            }

            .replace-pw-table {
                margin-bottom: 30px;
            }

            .replace-pw-table th {
                padding-right: 15px;
            }

            #newPw, #checkPw {
                width: 180px;
                height: 25px;
                padding-left: 5px;
            }

            .btnPw {
                display: flex;
                justify-content: center; 
                align-items: center;
            }

            .btnPw button {
                width: 80px;
                height: 30px;
                font-size: 15px;
                align-items: center;
                margin-top: 55px;
            }
            
        </style>
    </head>
    <body>
        <h2 class="title">비밀번호 재설정</h2>

        <form class="replace-pw-success" action="">
            <div class="replace-pw"> 
                <table class="replace-pw-table">
                    <div class="header">비밀번호를 재설정해 주세요.</div>
                    <div class="content">(8~12자, 영문 + 숫자 + 특수문자를 포함해주세요.)</div>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="newPw" id="newPw" placeholder="비밀번호" required></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td><input type="password" name="checkPw" id="checkPw" placeholder="비밀번호 재설정" required></td>
                    </tr>
                </table>
            </div>
            <div class="btnPw">
                <button name="relacePw" type="submit">완료</button>
            </div>
        </form>
    </body>
</html>
