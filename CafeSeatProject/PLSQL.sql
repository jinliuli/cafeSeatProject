--계정

    --vwAdmin
    /
    --vwUser
    /

--좌석
    --vwSeat
    /
    --vwSeatReservation
    /

--카페
    --vwCafeInfo
    CREATE OR REPLACE VIEW vwCafeInfo
    AS
    SELECT
    c.seq as cseq,
    ad.seq as adseq,
    c.name as name,
    c.tel as tel,
    c.isOpen as isOpen,
    (cl.city ||' '|| cl.district ||' '|| cl.street ||' '|| cl.detail) as address,
    (cl.lot) as lotAddress,
    cl.lat as lat,
    cl.lng as lng
    FROM tblCafe c
    INNER JOIN tblAdmin ad
        ON ad.seq = c.seqAdmin
            INNER JOIN tblCafeLoca cl
                ON cl.seq = c.seqCafeLoca
                    ORDER BY c.seq asc;
    /
    
    --vwCafeTimeInfo
    CREATE OR REPLACE VIEW vwCafeTimeinfo
    AS
    SELECT
    c.seq as cseq,
    bd.name as openDay,
    to_char(bh.openTime, 'HH24:MI') openTime,
    to_char(bh.closeTime, 'HH24:MI') closeTime 
    FROM tblCafe c
    INNER JOIN tblBusinessHour bh
        ON c.seq = bh.seqCafe
            INNER JOIN tblBusinessDay bd
                ON bd.seq = bh.seqBusinessDay
                    ORDER BY c.seq asc;
    /

--메뉴&결제
    --vwUserOrder 사용자별 주문조회
    CREATE OR REPLACE VIEW vwUserOrder
    AS
    SELECT u.id as 사용자아이디
        , ct.name as 카테고리
        , pr.name as 상품명
        , op.temperature as 온도
        , op.ice as 얼음양
        , op.cupSize as 사이즈
        , op.shot as 샷추가
        , o.totalCount as 수량
        , pa.payType as 결제방식
        , pa.cardBrand as 결제사
        , pa.totalPrice as 총금액
        , pa.payDate as 결제일자 from tblOptions op
        INNER JOIN tblOrder o 
            ON op.seq = o.seqOptions
                INNER JOIN tblPayment pa
                    ON pa.seq = o.seqPayment
                        INNER JOIN tblReservation r
                            ON r.seq = pa.seqReservation
                                INNER JOIN tblUser u
                                    ON u.seq = r.seqUser
                                        INNER JOIN tblProduct pr
                                            ON o.seqProduct = pr.seq
                                                INNER JOIN tblCategory ct
                                                    ON pr.seqCategory = ct.seq;
    /

    --vwProductInfo 상품조회
    CREATE OR REPLACE VIEW vwProductInfo
    AS
    SELECT 
        ct.name AS 카테고리, pr.name AS 상품명, pr.price AS 가격, pr.description AS 상품설명 
    FROM tblCategory ct
        INNER JOIN tblProduct pr
            ON ct.seq = pr.seqCategory;
    /

-- 변경 내용
-- 12/11/24
-- 예약 테이블에 종료된 예약인지 아닌지 알려주는 컬럼 추가
ALTER TABLE tblReservation
ADD isCompleted CHAR(1) DEFAULT 'N' NOT NULL; -- 'N'이면 미완료, 'Y'이면 완료

 update tblreservation set iscompleted = 'Y';


ALTER TABLE tblReservation
MODIFY timeEnd DATE NULL; -- 기존의 NOT NULL 제약을 제거