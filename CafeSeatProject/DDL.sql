--12/17 tblOrder에서 컬럼 seqOptions을 NOT NULL에서 NULL 허용으로 변경: 케익 같은 디저트에 옵션이 붙지 않을 것을 고려해서...
--1010수정_ 각자 테이블 확인 다시 해보기!!
--tblCafe > isOpen	            : Default로 수정
--tblUserLoca > locaTime        : Default + sysdate로 수정
--tblCoupons > status           : Default로 수정
--tblAdmin,tblUser > ing        : Default로 수정
--tblReservation > timeStart    : Default + sysdate로 수정
--      		 > timeEnd      : Default + sysdate - 1로 수정
--tblPayment > payDate          : Default + sysdate로 수정
--tblCoupons > createdDate      : Default + sysdate로 수정
--tblFavorite > addDate         : Default + sysdate로 수정
--tblCoupons usedDate NULL 허용에서 NOT NULL + DEFAULT SYSDATE -1 로 수정


--1009_수정사항은 노션으로 확인바람.

--1103 수정사항
--tblAdmin 관리자용 2차 비밀번호 컬럼 삭제

--대체 변수 기능 끄기
SET DEFINE OFF;

--테이블 삭제-----------------
DROP TABLE tblSeatReservation;
DROP TABLE tblSeat;
------------------------------
DROP TABLE tblOrder;
DROP TABLE tblProduct;
DROP TABLE tblPayment;
------------------------------
DROP TABLE tblCoupons;
DROP TABLE tblFavorite;
------------------------------
DROP TABLE tblBusinessHour;
DROP TABLE tblBusinessDay;
DROP TABLE tblCafe;
DROP TABLE tblUserLoca;
DROP TABLE tblCafeLoca;
------------------------------
DROP TABLE tblCategory;
DROP TABLE tblOptions;
------------------------------
DROP TABLE tblReservation;
DROP TABLE tblAdmin;
DROP TABLE tblUser;

--시퀀스 삭제-----------------
DROP SEQUENCE seqAdmin;
DROP SEQUENCE seqUser;
DROP SEQUENCE seqCafe;
DROP SEQUENCE seqBusinessDay;
DROP SEQUENCE seqBusinessHour;
DROP SEQUENCE seqCafeLoca;
DROP SEQUENCE seqUserLoca;
DROP SEQUENCE seqSeat;
DROP SEQUENCE seqSeatReservation;
DROP SEQUENCE seqReservation;
DROP SEQUENCE seqCategory;
DROP SEQUENCE seqProduct;
DROP SEQUENCE seqOptions;
DROP SEQUENCE seqOrder;
DROP SEQUENCE seqPayment;
DROP SEQUENCE seqCoupons;
DROP SEQUENCE seqFavorite;

--테이블 생성-----------------
CREATE TABLE tblAdmin (
	seq	NUMBER	PRIMARY KEY,
	id	VARCHAR2(50)	NOT NULL,
	pw	VARCHAR2(50)	NOT NULL,
	name	VARCHAR2(50)	NOT NULL,
	tel	VARCHAR2(50)	NOT NULL,
	email	VARCHAR2(300)	NOT NULL,
	companyId	VARCHAR2(50)	NOT NULL,
	ing NUMBER DEFAULT 1 NOT NULL
);

CREATE TABLE tblUser (
	seq	NUMBER	PRIMARY KEY,
	id	VARCHAR2(50)	NOT NULL,
	pw	VARCHAR2(50)	NOT NULL,
	name	VARCHAR2(50)	NOT NULL,
	tel	VARCHAR2(50)	NOT NULL,
	email	VARCHAR2(300)	NOT NULL,
	ing NUMBER DEFAULT 1    NOT NULL
);

------------------------------------------------------------------

CREATE TABLE tblCafeLoca (
	seq	NUMBER	PRIMARY KEY,
	city	VARCHAR2(50)	NOT NULL,
	district	VARCHAR2(300)	NOT NULL,
	street	VARCHAR2(50)	NOT NULL,
	lot	VARCHAR2(300)	NOT NULL,
	detail	VARCHAR2(300)	NULL,
	lat	NUMBER	NOT NULL,
	lng	NUMBER	NOT NULL
);

CREATE TABLE tblCafe (
	seq	NUMBER	PRIMARY KEY,
	seqAdmin	NUMBER	NOT NULL,	--FK 관리자번호
	seqCafeLoca	NUMBER	NOT NULL,	--FK 카페위치번호
	name	VARCHAR2(300)	NOT NULL,
	tel	VARCHAR2(50)	NULL,
	isOpen	NUMBER DEFAULT 0 NOT NULL

	,CONSTRAINT FK_Admin_Cafe FOREIGN KEY (seqAdmin)
    	REFERENCES tblAdmin (seq)
    	,CONSTRAINT FK_CafeLoca_Cafe FOREIGN KEY (seqCafeLoca)
    	REFERENCES tblCafeLoca (seq)

);

CREATE TABLE tblBusinessDay (
	seq	NUMBER	PRIMARY KEY,
	name	VARCHAR2(50)	NOT NULL
);

CREATE TABLE tblBusinessHour (
	seq	NUMBER	PRIMARY KEY,
	seqCafe	NUMBER	NOT NULL,		--FK 카페번호
	seqBusinessDay	NUMBER	NOT NULL,	--FK 영업날짜번호
	openTime	DATE	NOT NULL,
	closeTime	DATE	NOT NULL

	,CONSTRAINT FK_Cafe_BusinessHour FOREIGN KEY (seqCafe)
    	REFERENCES tblCafe (seq)
    	,CONSTRAINT FK_BusinessDay_BusinessHour FOREIGN KEY (seqBusinessDay)
    	REFERENCES tblBusinessDay (seq)

);

CREATE TABLE tblUserLoca (
	seq	NUMBER	PRIMARY KEY,
	seqUser	NUMBER	NOT NULL,	--FK 사용자번호
	lat	NUMBER	NOT NULL,
	lng	NUMBER	NOT NULL,
	locaTime	DATE DEFAULT SYSDATE NOT NULL

    ,CONSTRAINT FK_User_UserLoca FOREIGN KEY (seqUser)
    REFERENCES tblUser(seq)
);

------------------------------------------------------------------

CREATE TABLE tblSeat (
	seq	NUMBER	PRIMARY KEY,
	seqCafe	NUMBER	NOT NULL,	--FK 카페 번호
	numSeat	NUMBER	NOT NULL,
	attrOutlet	NUMBER	NOT NULL,
	attrReserve	NUMBER	NOT NULL

    ,CONSTRAINT FK_Cafe_Seat FOREIGN KEY (seqCafe)
    REFERENCES tblCafe(seq)
);

CREATE TABLE tblReservation (
	seq	NUMBER	PRIMARY KEY,
	seqUser	NUMBER	NOT NULL,	--FK 사용자 번호
	useDate	DATE	NOT NULL,
	timeStart	DATE DEFAULT SYSDATE	NOT NULL,
	timeEnd	DATE DEFAULT SYSDATE-1	NOT NULL

    ,CONSTRAINT FK_User_Reservation FOREIGN KEY (seqUser)
    REFERENCES tblUser(seq)
);

CREATE TABLE tblSeatReservation (
	seq	NUMBER	PRIMARY KEY,
	seqReservation	NUMBER	NOT NULL, --FK 예약번호
	seqSeat	NUMBER	NOT NULL	   --FK 좌석 일련 번호

    ,CONSTRAINT FK_Reservation_SeatReservation FOREIGN KEY (seqReservation)
    REFERENCES tblReservation(seq)
    ,CONSTRAINT FK_Seat_SeatReservation FOREIGN KEY (seqSeat)
    REFERENCES tblSeat(seq)
);

------------------------------------------------------------------

CREATE TABLE tblCategory (
	seq	NUMBER	PRIMARY KEY,
	name	VARCHAR2(30)	NOT NULL
);

CREATE TABLE tblProduct (
	seq	NUMBER	PRIMARY KEY,
	seqCategory	NUMBER	NOT NULL, --FK 카테고리 번호
	name	VARCHAR2(100)	NOT NULL,
	price	NUMBER	NOT NULL,
	image	VARCHAR2(50)	NOT NULL,
	description	VARCHAR2(300)	NULL

    	,CONSTRAINT FK_Category_Product FOREIGN KEY (seqCategory)
    	REFERENCES tblCategory(seq)
);

CREATE TABLE tblOptions (
	seq	NUMBER	PRIMARY KEY,
	temperature	NUMBER	NOT NULL,
	cupSize	NUMBER	NOT NULL,
	ice	NUMBER	NOT NULL,
	shot	NUMBER	NOT NULL
);

CREATE TABLE tblPayment (
	seq	NUMBER	PRIMARY KEY,
	seqReservation	NUMBER	NOT NULL, --FK 예약 번호
	payType	VARCHAR2(30)	NOT NULL,
	cardBrand	VARCHAR2(30)	NOT NULL,
	totalPrice	NUMBER	NOT NULL,
	payDate	DATE DEFAULT SYSDATE	NOT NULL

    	,CONSTRAINT FK_Reservation_Payment FOREIGN KEY (seqReservation)
    	REFERENCES tblReservation(seq)
);

CREATE TABLE tblOrder (
	seq	NUMBER	PRIMARY KEY,
	seqPayment	NUMBER	NOT NULL, --FK결제번호
	seqProduct	NUMBER	NOT NULL, --FK상품번호
	seqOptions	NUMBER	NULL, 	--FK옵션번호
	totalCount	NUMBER	NOT NULL

    ,CONSTRAINT FK_Payment_Order FOREIGN KEY (seqPayment)
    REFERENCES tblPayment(seq)
    ,CONSTRAINT FK_Product_Order FOREIGN KEY (seqProduct)
    REFERENCES tblProduct(seq)
    ,CONSTRAINT FK_Options_Order FOREIGN KEY (seqOptions)
    REFERENCES tblOptions(seq)
);

------------------------------------------------------------------

CREATE TABLE tblCoupons (
	seq	NUMBER	PRIMARY KEY,
	seqUser	NUMBER	NOT NULL, --FK 사용자번호
	createdDate	DATE DEFAULT SYSDATE	NOT NULL,
	usedDate	DATE	DEFAULT SYSDATE-1,
	status	NUMBER DEFAULT 1	NOT NULL

    ,CONSTRAINT FK_User_Coupons FOREIGN KEY (seqUser)
    REFERENCES tblUser(seq)
);

CREATE TABLE tblFavorite (
	seq	NUMBER	PRIMARY KEY,
	seqUser	NUMBER	NOT NULL, --FK 사용자번호
	seqCafe	NUMBER	NOT NULL, --FK 카페정보 번호
	addDate	DATE DEFAULT SYSDATE	NOT NULL

    ,CONSTRAINT FK_User_Favorite FOREIGN KEY (seqUser)
    REFERENCES tblUser(seq)
    ,CONSTRAINT FK_Cafe_Favorite FOREIGN KEY (seqCafe)
    REFERENCES tblCafe(seq)
);

--시퀀스 생성-----------------
CREATE SEQUENCE seqAdmin;
CREATE SEQUENCE seqUser;
------------------------------
CREATE SEQUENCE seqCafe;
CREATE SEQUENCE seqBusinessHour;
CREATE SEQUENCE seqBusinessDay;
CREATE SEQUENCE seqCafeLoca;
CREATE SEQUENCE seqUserLoca;
------------------------------
CREATE SEQUENCE seqSeat;
CREATE SEQUENCE seqSeatReservation;
CREATE SEQUENCE seqReservation;
------------------------------
CREATE SEQUENCE seqCategory;
CREATE SEQUENCE seqProduct;
CREATE SEQUENCE seqOptions;
CREATE SEQUENCE seqOrder;
CREATE SEQUENCE seqPayment;
------------------------------
CREATE SEQUENCE seqCoupons;
CREATE SEQUENCE seqFavorite;
