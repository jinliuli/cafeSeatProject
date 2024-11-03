SELECT * FROM tblCafe;

SELECT * FROM tblCafeLoca;
SELECT
    seq,
    seqcafe,
    seqbusinessday,
    TO_CHAR(opentime, 'HH24:MI') AS opentime,
    TO_CHAR(closetime, 'HH24:MI') AS closetime
FROM tblBusinessHour;

SELECT * FROM tblBusinessDay;

-- tblCafe
-- 이름
-- 영업중

-- tblCafeLoca
-- 시
-- 구
-- 도로
-- 지번

-- tblBusinessHour
-- 시작시각
-- 종료시각

-- tblBusinessDay
-- 근무시각

SELECT
    c.name,
    CASE
        WHEN c.isOpen = 1 THEN '영업중'
        ELSE '영업준비중'
    END AS "c.isOpen",
    cl.city,
    cl.district,
    cl.street,
    cl.lot,
    TO_CHAR(bh.opentime, 'HH24:MI') AS openTime,
    TO_CHAR(bh.closetime, 'HH24:MI') AS closeTime,
    bd.name
FROM tblCafe c
    INNER JOIN tblCafeLoca cl
        ON c.seqCafeLoca = cl.seq
    INNER JOIN tblBusinessHour bh
        ON c.seq = bh.seqCafe
            INNER JOIN tblBusinessDay bd
                ON bh.seqBusinessDay = bd.seq
;


SELECT * FROM tblCafe;












