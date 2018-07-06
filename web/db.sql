CREATE TABLE T_USER(
	ID VARCHAR2(20) PRIMARY KEY,
	PWD VARCHAR2(20),
	NAME VARCHAR2(20)
);

CREATE SEQUENCE PRO_SEQ
START WITH 100
INCREMENT BY 1;

CREATE TABLE T_PRODUCT(
	ID NUMBER(5) PRIMARY KEY,
	NAME VARCHAR2(20),
	PRICE NUMBER(10),
	REGDATE DATE,
	IMGNAME VARCHAR2(30)
);

insert into T_USER values ('id01','aa','bb');
select * from T_USER