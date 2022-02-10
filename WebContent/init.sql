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

COMMENT ON COLUMN beige_member.m_grade IS '0 = ������, 1 = ȸ��';


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

COMMENT ON COLUMN beige_board.b_category IS '����,���� ��';

COMMENT ON COLUMN beige_board.b_secret IS '0 = ����, 1 = �����';

COMMENT ON COLUMN beige_board.b_ref IS '��� ����';


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

Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('hello','qqqq',1,'��ȳ�','46729/�λ� ������ ����1�� 7/ (���)/���','010-6832-7180','--','helloworld@example.com','2021/11/15 09:00:00');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('beige','admin',0,'developer','12345/aaa/(bbb)/somewhere','010-1234-5678','051-123-4567','beige@example.com','2021/11/15 09:00:00');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('tester1','-1',-1,'-Ż��','0/unknown','000-0000-0000','000-000-0000','unknown','2021/11/18 08:09:02');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('tester2','test',1,'�׽���','46729/�λ� ������ ����1�� 7/ (���)/�λ� ù��°','010-1234-5678','051-123-4567','test1@example.com','2021/11/15 09:00:00');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('tester3','test',1,'�׽���','46729/�λ� ������ ����1�� 7/ (���)/�λ� ù��°','010-9999-9999','051-999-9999','test2@example.com','2021/11/15 09:00:00');
Insert into SCOTT.BEIGE_MEMBER (M_ID,M_PWD,M_GRADE,M_NAME,M_ADDR,M_PHONE,M_TEL,M_EMAIL,M_SIGNUP) values ('tester4','test',1,'�׽���','46729/�λ� ������ ����1�� 7/ (���)/�λ� ù��°','010-9876-5432','051-987-6543','test3@example.com','2021/11/15 09:00:00');

Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (1,'����','cloud1.jpg','accessory',10000,0,'s',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (3,'�ڵ���̵� ��Ʈ','coat11.jpg','coat',100000,29,'m','coat21.jpg');
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (10,'����������','31248.jpg','jacket',3000,0,'s',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (11,'BEIGE ������','AAAAAA.png','slacks',5000,0,'s',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (4,'���� ���� ����','ring1.jpg','accessory',20000,9,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (5,'ü�� ��� ���� 1set','ring2.jpg','accessory',60000,19,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (6,'������ ����','ring3.jpg','accessory',99000,7,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (7,'ACHO WORLD �ĵ�','hoodie.jpg','zipuphoodie',3000,9,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (8,'������ ������','ring5.jpg','shirt',20000,3,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (13,'��ǰB','prodB.png','joggerpants',1000,5,'free',null);
Insert into SCOTT.BEIGE_SHOP (S_ID,S_NAME,S_IMAGE,S_CATEGORY,S_PRICE,S_STOCK,S_SIZE,S_IMAGE2) values (12,'��ǰ A','prodA1.png','shortpants',500,3,'free',null);

Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371548421190053',11,'hello','���� �Ϸ�','����','CJ�������',8000,-1,to_date('21/11/17','RR/MM/DD'),1,'imp_403842119668',null,'["1"]','["11"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_1234567890123',11,'hello','�߼� �Ϸ�','�����մϴ�','CJ�������',45000,388591508100,to_date('21/11/15','RR/MM/DD'),1,'123456','Cards','[1, 2]','[11, 8]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371790546340095',3,'hello','�߼� �Ϸ�','�����մϴ�','CJ�������',378000,123325434,to_date('21/11/18','RR/MM/DD'),1,'imp_537053625408',null,'["1","1","1","2"]','["3","4","5","6"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371909161850094',7,'hello','�߼� �Ϸ�','�����մϴ�~','CJ�������',9500,4123123123123,to_date('21/11/18','RR/MM/DD'),1,'imp_747916293266','48072377','["1","3","2"]','["7","12","13"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371520997160088',1,'hello','�߼� �Ϸ�','������','CJ�������',210000,388591508100,to_date('21/11/17','RR/MM/DD'),1,'imp_605099845392',null,'["1","2"]','["1","3"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371542416760096',7,'hello','���� �Ϸ�','123','CJ�������',33000,-1,to_date('21/11/17','RR/MM/DD'),1,'imp_393241665727',null,'["1"]','["7"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371550223250028',6,'hello','���� �Ϸ�','�� ���ڴ�','CJ�������',8910000,-1,to_date('21/11/17','RR/MM/DD'),90,'imp_045022645309',null,'["90"]','["6"]');
Insert into SCOTT.BEIGE_ORDER (O_ID,S_ID,M_ID,O_STATUS,O_COMMENT,O_TYPE,O_PRICE,O_SHIP,O_DATE,O_QUANTITY,O_IAMPORT,O_CARD,O_QUANTITIES,S_IDS) values ('b_16371785100270055',1,'hello','���� �Ϸ�',null,'CJ�������',13000,-1,to_date('21/11/18','RR/MM/DD'),1,'imp_799509107108',null,'["1"]','["1"]');

Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (28,'beige','����',1,'6��° ����','6666666666',to_date('21/11/11','RR/MM/DD'),'0',28);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (29,'beige','����',0,'[���] �ȳ��ϼ���','�ȳ��ϼ���!',to_date('21/11/11','RR/MM/DD'),'1',26);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (17,'beige','����',6,'����22','��22222',to_date('21/11/10','RR/MM/DD'),'0',17);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (15,'hello','����',46,'�����Դϴ�','�Ļ��ϼ̽��ϱ�?',to_date('21/11/09','RR/MM/DD'),'1',15);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (18,'beige','����',11,'����° ����','���������!',to_date('21/11/10','RR/MM/DD'),'0',18);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (25,'beige','����',2,'[���] �����Դϴ�','�����̿���!',to_date('21/11/11','RR/MM/DD'),'1',15);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (13,'tester2','����',24,'���̽� ������.py','python',to_date('21/11/09','RR/MM/DD'),'1',13);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (19,'beige','����',15,'����4','4444',to_date('21/11/10','RR/MM/DD'),'0',19);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (16,'beige','����',16,'��¥ �����Դϴ�.','���� �� �ڰ� �־��',to_date('21/11/10','RR/MM/DD'),'0',16);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (5,'tester2','����',10,'qweqwe','qweqwe',to_date('21/10/28','RR/MM/DD'),'1',5);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (6,'tester2','����',11,'werwe','werwer',to_date('21/10/28','RR/MM/DD'),'1',6);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (7,'tester2','����',12,'[���] qweqwe','asdasdasd',to_date('21/10/28','RR/MM/DD'),'1',5);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (22,'hello','����',4,'���� ��ħ�̿���','^^',to_date('21/11/11','RR/MM/DD'),'0',22);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (26,'hello','����',1,'�ȳ��ϼ���','hello~',to_date('21/11/11','RR/MM/DD'),'1',26);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (21,'beige','����',11,'�ټ���° ����','���ͳ��� �ʹ� ����׿�',to_date('21/11/10','RR/MM/DD'),'0',21);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (27,'hello','����',0,'qasd','qweqwe',to_date('21/11/11','RR/MM/DD'),'0',27);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (24,'beige','����',1,'[���] ���̽� ������.py','print("Hello, Python")',to_date('21/11/11','RR/MM/DD'),'0',13);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (8,'tester2','����',14,'�ѱ�','�ѱ� �׽�Ʈ',to_date('21/10/29','RR/MM/DD'),'1',8);
Insert into SCOTT.BEIGE_BOARD (B_ID,M_ID,B_CATEGORY,B_VIEW,B_TITLE,B_CONTENT,B_DATE,B_SECRET,B_REF) values (12,'tester2','����',24,'�ݰ����ϴ�','�� �˴ϴ�',to_date('21/10/29','RR/MM/DD'),'1',12);

COMMIT;