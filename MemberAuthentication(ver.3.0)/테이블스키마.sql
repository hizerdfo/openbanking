DROP TABLE CUSTOMERR;

CREATE SEQUENCE id_seqq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

desc customerr;  
  
TRUNCATE TABLE CUSTOMERR;
  
SELECT * FROM CUSTOMERR;

CREATE TABLE CUSTOMERR
(
    id          varchar2(50),
    bankcode    varchar2(50),
    name        varchar2(50),
    password    varchar2(50),
    identityNum varchar2(14),
    phoneNum    varchar2(50),
    email       varchar2(50),
    address      varchar2(50),
    jibunAddress varchar2(50),
    detailAddress varchar2(50),
    extraAddress varchar2(50),
    postalCode     varchar2(50),
    grade       varchar2(10) DEFAULT 'BASIC',
    status      varchar2(10) DEFAULT '활성'
);



desc customerr;


INSERT INTO CUSTOMERR (cust_seq, id, password, identityNum, birthDate, phoneNum, email, address, detailAddress, postalCode, grade, status)
VALUES ('CUST001', 1, 'password1', '940123-1234567', TO_DATE('1994-01-23', 'YYYY-MM-DD'), '010-1234-5678', 'email1@example.com', '¼­¿ïÆ¯º°½Ã °­³²±¸', '»ó¼¼ÁÖ¼Ò1', '12345', 'BASIC', 'È°¼º');

INSERT INTO CUSTOMERR (cust_seq, id, password, identityNum, birthDate, phoneNum, email, address, detailAddress, postalCode, grade, status)
VALUES ('CUST002', 2, 'password2', '910101-2345678', TO_DATE('1991-01-01', 'YYYY-MM-DD'), '010-9876-5432', 'email2@example.com', '¼­¿ïÆ¯º°½Ã °­¼­±¸', '»ó¼¼ÁÖ¼Ò2', '54321', 'BASIC', 'È°¼º');

INSERT INTO CUSTOMERR (cust_seq, id, password, identityNum, birthDate, phoneNum, email, address, detailAddress, postalCode, grade, status)
VALUES ('CUST003', 3, 'password3', '980202-3456789', TO_DATE('1998-02-02', 'YYYY-MM-DD'), '010-5555


CREATE TABLE account
(
acc_num     varchar2(50),
cust_id     varchar2(50),
acc_pw      varchar2(50),
acc_status  varchar2(50),
acc_code    varchar2(50),
acc_name    varchar2(50),
acc_balance number,
acc_opening date,   
acc_closure date,
bank_code   varchar2(50)
);

CREATE TABLE trade
(
trade_id    varchar2(50),
cust_id     varchar2(50),
trade_type  varchar2(50),
trade_status    varchar2(50),
trade_date      date,
trade_acc       number,
balance         number,
deposit_code    varchar2(50),
deposit_num     varchar2(50),
withdrawal_code varchar2(50),
withdrawal_num  varchar2(50),
trade_memo      varchar2(50)
);

CREATE TABLE bank
(
bank_code   varchar2(50),
bank_name   varchar2(50),
bank_branch_code    varchar2(50),
bank_branch_name    varchar2(50)
);

drop table trade;
commit;

drop table admins;

CREATE TABLE admins (
  id VARCHAR2(50) PRIMARY KEY,
  adname VARCHAR2(50) NOT NULL,
  password VARCHAR2(100) NOT NULL
);
insert into admins(id, adname, password) values ('admin', 'admin', '9491a');

select * from admins where id = 'admin';

commit;