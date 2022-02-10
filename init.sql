DROP TABLE beige_board;
DROP TABLE beige_cart;
DROP table beige_order;
DROP table beige_shop;
DROP table beige_member;


--------------------------------------------------------
--  DDL for Table BEIGE_MEMBER
--------------------------------------------------------

CREATE TABLE beige_member (
	m_id	VARCHAR2(15)		NOT NULL,
	m_pwd	VARCHAR2(20)		NOT NULL,
	m_grade	NUMBER(1)	DEFAULT 1	NOT NULL,
	m_name	VARCHAR2(20)		NOT NULL,
	m_addr	VARCHAR2(200)		NOT NULL,
	m_phone	VARCHAR2(15)		NOT NULL,
	m_tel	VARCHAR2(15)		NULL,
	m_email	VARCHAR2(50)		NOT NULL,
	m_signup    VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN beige_member.m_grade IS '0 = 관리자, 1 = 회원';


--------------------------------------------------------
--  DDL for Table BEIGE_SHOP
--------------------------------------------------------

CREATE TABLE beige_shop (
	s_id	NUMBER(10)		NOT NULL,
	s_name	VARCHAR2(100)		NOT NULL,
	s_image	VARCHAR2(100)		NOT NULL,
	s_category	VARCHAR2(50)		NOT NULL,
	s_price	NUMBER(10)		NOT NULL,
	s_stock	NUMBER(10)		NOT NULL,
	s_size	VARCHAR2(30)		NULL,
	s_image2	VARCHAR2(100)		NULL
);


--------------------------------------------------------
--  DDL for Table BEIGE_ORDER
--------------------------------------------------------

CREATE TABLE beige_order (
	o_id	VARCHAR2(30)		NOT NULL,
	m_id	VARCHAR2(15)		NOT NULL,
	s_id	NUMBER(10)		NOT NULL,
	o_quantity	NUMBER(5)		NOT NULL,
	s_ids	VARCHAR2(100)		NULL,
	o_price	NUMBER(10)		NULL,
	o_quantities	VARCHAR2(50)		NULL,
	o_status	VARCHAR2(20)		NOT NULL,
	o_comment	VARCHAR2(100)		NULL,
	o_type	VARCHAR2(20)		NOT NULL,
	o_ship	NUMBER(20)		NOT NULL,
	o_date	DATE		NOT NULL,
	o_iamport	VARCHAR2(30)		NULL,
	o_card	VARCHAR2(50)		NULL
);


--------------------------------------------------------
--  DDL for Table BEIGE_BOARD
--------------------------------------------------------

CREATE TABLE beige_board (
	b_id	NUMBER(10)		NOT NULL,
	m_id	VARCHAR2(15)		NOT NULL,
	b_category	VARCHAR2(10)		NOT NULL,
	b_view	NUMBER(10)	DEFAULT 0	NOT NULL,
	b_title	VARCHAR2(100)		NOT NULL,
	b_content	VARCHAR2(3000)		NOT NULL,
	b_date	DATE		NOT NULL,
	b_secret	CHAR(1)		NOT NULL,
	b_ref	NUMBER(10)		NOT NULL
);

COMMENT ON COLUMN beige_board.b_category IS '공지,문의 등';

COMMENT ON COLUMN beige_board.b_secret IS '0 = 공개, 1 = 비공개';

COMMENT ON COLUMN beige_board.b_ref IS '답글 여부';


--------------------------------------------------------
--  DDL for Table BEIGE_CART
--------------------------------------------------------

CREATE TABLE beige_cart (
	m_id	VARCHAR2(15)		NOT NULL,
	s_id	NUMBER(10)		NOT NULL,
	c_amount	NUMBER(5)		NOT NULL,
	c_date	DATE		NOT NULL
);


--------------------------------------------------------
--  Primary Key and Foreign Key
--------------------------------------------------------

ALTER TABLE beige_member ADD CONSTRAINT PK_BEIGE_MEMBER PRIMARY KEY (
	m_id
);

ALTER TABLE beige_shop ADD CONSTRAINT PK_BEIGE_SHOP PRIMARY KEY (
	s_id
);

ALTER TABLE beige_order ADD CONSTRAINT PK_BEIGE_ORDER PRIMARY KEY (
	o_id,
	m_id,
	s_id
);

ALTER TABLE beige_board ADD CONSTRAINT PK_BEIGE_BOARD PRIMARY KEY (
	b_id,
	m_id
);

ALTER TABLE beige_cart ADD CONSTRAINT PK_BEIGE_CART PRIMARY KEY (
	m_id,
	s_id
);

ALTER TABLE beige_order ADD CONSTRAINT FK_bmember_TO_border_1 FOREIGN KEY (
	m_id
)
REFERENCES beige_member (
	m_id
);

ALTER TABLE beige_order ADD CONSTRAINT FK_bshop_TO_border_1 FOREIGN KEY (
	s_id
)
REFERENCES beige_shop (
	s_id
);

ALTER TABLE beige_board ADD CONSTRAINT FK_bmember_TO_bboard_1 FOREIGN KEY (
	m_id
)
REFERENCES beige_member (
	m_id
);

ALTER TABLE beige_cart ADD CONSTRAINT FK_bmember_TO_bcart_1 FOREIGN KEY (
	m_id
)
REFERENCES beige_member (
	m_id
);

ALTER TABLE beige_cart ADD CONSTRAINT FK_bshop_TO_bcart_1 FOREIGN KEY (
	s_id
)
REFERENCES beige_shop (
	s_id
);


--------------------------------------------------------
--  Sample Data
--------------------------------------------------------

Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('hello','qqqq',1,'김안녕','46729/부산 강서구 가달1로 7/ (생곡동)/어딘가','010-6832-7180','--','helloworld@example.com','2021/11/15 09:00:00');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('beige','admin',0,'developer','12345/aaa/(bbb)/somewhere','010-1234-5678','051-123-4567','beige@example.com','2021/11/15 09:00:00');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('tester1','-1',-1,'-탈퇴','0/unknown','000-0000-0000','000-000-0000','unknown','2021/11/18 08:09:02');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('tester2','test',1,'테스터','46729/부산 강서구 가달1로 7/ (생곡동)/부산 첫번째','010-1234-5678','051-123-4567','test1@example.com','2021/11/15 09:00:00');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('tester3','test',1,'테스터','46729/부산 강서구 가달1로 7/ (생곡동)/부산 첫번째','010-9999-9999','051-999-9999','test2@example.com','2021/11/15 09:00:00');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('tester4','test',1,'테스터','46729/부산 강서구 가달1로 7/ (생곡동)/부산 첫번째','010-9876-5432','051-987-6543','test3@example.com','2021/11/15 09:00:00');

Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (1,'구름','cloud1.jpg','accessory',10000,0,'s',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (3,'핸드메이드 코트','coat11.jpg','coat',100000,29,'m','coat21.jpg');
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (10,'베이지자켓','31248.jpg','jacket',3000,0,'s',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (11,'BEIGE 슬랙스','AAAAAA.png','slacks',5000,0,'s',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (4,'숫자 적힌 반지','ring1.jpg','accessory',20000,9,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (5,'체인 모양 반지 1set','ring2.jpg','accessory',60000,19,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (6,'왕진주 반지','ring3.jpg','accessory',99000,7,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (7,'ACHO WORLD 후디','hoodie.jpg','zipuphoodie',3000,9,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (8,'스마일 각반지','ring5.jpg','shirt',20000,3,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (13,'상품B','prodB.png','joggerpants',1000,5,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (12,'상품 A','prodA1.png','shortpants',500,3,'free',null);

Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371548421190053',11,'hello','결제 완료','ㄳㄳ','CJ대한통운',8000,-1,to_date('21/11/17','RR/MM/DD'),1,'imp_403842119668',null,'["1"]','["11"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_1234567890123',11,'hello','발송 완료','감사합니다','CJ대한통운',45000,388591508100,to_date('21/11/15','RR/MM/DD'),1,'123456','Cards','[1, 2]','[11, 8]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371790546340095',3,'hello','발송 완료','감사합니다','CJ대한통운',378000,123325434,to_date('21/11/18','RR/MM/DD'),1,'imp_537053625408',null,'["1","1","1","2"]','["3","4","5","6"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371909161850094',7,'hello','발송 완료','감사합니다~','CJ대한통운',9500,4123123123123,to_date('21/11/18','RR/MM/DD'),1,'imp_747916293266','48072377','["1","3","2"]','["7","12","13"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371520997160088',1,'hello','발송 완료','ㅁㄴㅇ','CJ대한통운',210000,388591508100,to_date('21/11/17','RR/MM/DD'),1,'imp_605099845392',null,'["1","2"]','["1","3"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371542416760096',7,'hello','결제 완료','123','CJ대한통운',33000,-1,to_date('21/11/17','RR/MM/DD'),1,'imp_393241665727',null,'["1"]','["7"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371550223250028',6,'hello','결제 완료','난 부자다','CJ대한통운',8910000,-1,to_date('21/11/17','RR/MM/DD'),90,'imp_045022645309',null,'["90"]','["6"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371785100270055',1,'hello','결제 완료',null,'CJ대한통운',13000,-1,to_date('21/11/18','RR/MM/DD'),1,'imp_799509107108',null,'["1"]','["1"]');

Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (28,'beige','공지',1,'6번째 공지','6666666666',to_date('21/11/11','RR/MM/DD'),'0',28);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (29,'beige','문의',0,'[답글] 안녕하세요','안녕하세요!',to_date('21/11/11','RR/MM/DD'),'1',26);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (17,'beige','공지',6,'공지22','ㅈ22222',to_date('21/11/10','RR/MM/DD'),'0',17);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (15,'hello','문의',46,'질문입니다','식사하셨습니까?',to_date('21/11/09','RR/MM/DD'),'1',15);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (18,'beige','공지',11,'세번째 공지','별내용없음!',to_date('21/11/10','RR/MM/DD'),'0',18);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (25,'beige','문의',2,'[답글] 질문입니다','아직이에요!',to_date('21/11/11','RR/MM/DD'),'1',15);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (13,'tester2','문의',24,'파이썬 배우는중.py','python',to_date('21/11/09','RR/MM/DD'),'1',13);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (19,'beige','공지',15,'공지4','4444',to_date('21/11/10','RR/MM/DD'),'0',19);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (16,'beige','공지',16,'진짜 공지입니다.','잠을 못 자고 있어요',to_date('21/11/10','RR/MM/DD'),'0',16);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (5,'tester2','문의',10,'qweqwe','qweqwe',to_date('21/10/28','RR/MM/DD'),'1',5);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (6,'tester2','문의',11,'werwe','werwer',to_date('21/10/28','RR/MM/DD'),'1',6);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (7,'tester2','문의',12,'[답글] qweqwe','asdasdasd',to_date('21/10/28','RR/MM/DD'),'1',5);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (22,'hello','문의',4,'좋은 아침이에요','^^',to_date('21/11/11','RR/MM/DD'),'0',22);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (26,'hello','문의',1,'안녕하세요','hello~',to_date('21/11/11','RR/MM/DD'),'1',26);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (21,'beige','공지',11,'다섯번째 공지','인터넷이 너무 끊기네요',to_date('21/11/10','RR/MM/DD'),'0',21);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (27,'hello','문의',0,'qasd','qweqwe',to_date('21/11/11','RR/MM/DD'),'0',27);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (24,'beige','문의',1,'[답글] 파이썬 배우는중.py','print("Hello, Python")',to_date('21/11/11','RR/MM/DD'),'0',13);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (8,'tester2','문의',14,'한글','한글 테스트',to_date('21/10/29','RR/MM/DD'),'1',8);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (12,'tester2','문의',24,'반갑습니다','잘 됩니다',to_date('21/10/29','RR/MM/DD'),'1',12);

COMMIT;