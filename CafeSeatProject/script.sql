--CafeSeatProject

-- SYSTEM 계정으로 먼저 접속해서 아래 쿼리들을 실행
SHOW USER;

CREATE USER cafe IDENTIFIED BY java1234;
GRANT CONNECT, RESOURCE, DBA TO cafe;
ALTER USER cafe ACCOUNT UNLOCK;


-- 비밀번호 잘못 설정했을 시에 아래 쿼리로 변경 가능
ALTER USER cafe IDENTIFIED BY java1234;

SELECT * FROM dba_users WHERE username = 'CAFE';
ALTER USER cafe ACCOUNT unlock;
ALTER USER cafe IDENTIFIED BY java1234;

SELECT * FROM all_users;

