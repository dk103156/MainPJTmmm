DROP TABLE ticketing;
DROP TABLE date_time;

DROP SEQUENCE seq_ticketing_ticketing_no;
DROP SEQUENCE seq_date_time_date_time_no;

CREATE SEQUENCE seq_ticketing_ticketing_no	   	INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_date_time_date_time_no    INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;



CREATE TABLE date_time ( 
	date_time_no	 VARCHAR2(5)		 NOT NULL,
	movie_Name	 	 VARCHAR2(100) 	  NOT NULL,
	poster			 VARCHAR2(2000),
	rating			 VARCHAR2(10),
	franchise		 VARCHAR2(15) 		 NOT NULL,
	theater_name		 VARCHAR2(50)		 NOT NULL,
	screen_name  	 VARCHAR2(100)   NOT NULL,
	screen_date		 TIMESTAMP			 NOT NULL,
	screen_time		 TIMESTAMP			 NOT NULL,
	remaining_seat	 NUMERIC(5,0) DEFAULT 130,
	selected_Seat    VARCHAR2(1000),
	PRIMARY KEY(date_time_no)
);

CREATE TABLE ticketing ( 
	ticketing_no	 VARCHAR2(5)	 	NOT NULL,
	movie_Name 	 VARCHAR2(100)	 	NOT NULL,
	theater_name	 VARCHAR2(50)	  	NOT NULL, 
	date_time_no	 VARCHAR2(5)	 	NOT NULL REFERENCES date_time(date_time_no),
	audience_type	 VARCHAR2(300) 	 	NOT NULL,
	seat_type		 VARCHAR2(300)	 	NOT NULL,
	seat_no		 VARCHAR2(100)	 	NOT NULL,
	head_count	 NUMERIC(5,0)	 	NOT NULL,
	ticketing_price	 NUMERIC(15,0)	 	NOT NULL,
	ticketing_pin_no	 VARCHAR2(25)	 	NOT NULL,
	ticketer_phone	 VARCHAR2(15)	 	NOT NULL,
	ticketing_date	 TIMESTAMP	 		NOT NULL,
	cancel_date	 TIMESTAMP,
	ticketing_status	 NUMERIC(5,0) 		NOT NULL,
	PRIMARY KEY(ticketing_no)
);

set linesize 500;
set pagesize 500;

col  date_time_no for a15;
col  movie_Name for a30;
col  poster	 for a30;
col  rating  for a15;
col  franchise for a15;
col  theater_name for a30;
col  screen_name for a18;
col  screen_date for a15;
col  screen_time for a15;
col  selected_Seat for a15;

col  ticketing_no for a7;
col  movie_Name for a10;
col  theater_name for a12;
col  audience_type for a13;
col  seat_type for a15;
col  seat_no for a10;
col  ticketing_pin_no for a16;
col  ticketer_phone for a15;
col  ticketing_date for a15;
col  cancel_date for a15;

insert into Ticketing 
(ticketing_no, movie_Name, theater_name, date_time_no, audience_type, seat_type,
 seat_no, head_count, ticketing_price, ticketing_pin_no, ticketer_phone, ticketing_date, ticketing_status)
values (seq_ticketing_ticketing_no.NEXTVAL, '기생충', 'CGV 강남', '10001', '일반,일반,일반', 'standard,standard,standard',
		'A1,A2,A3',3,30000,'1230982-1324-431413','111-2222-3333',
		 SYSDATE, 0);
		 
insert into Ticketing 
(ticketing_no, movie_Name, theater_name, date_time_no, audience_type, seat_type,
 seat_no, head_count, ticketing_price, ticketing_pin_no, ticketer_phone, ticketing_date, ticketing_status)
values (seq_ticketing_ticketing_no.NEXTVAL, '기생충', 'CGV 강남', '10001', '일반,일반,일반', 'standard,standard,standard',
		'A1,A2,A3',3,30000,'1230982-1324-431413','111-2222-3333',
		 SYSDATE, 0);
		 
		 
insert into Ticketing 
(ticketing_no, movie_Name, theater_name, date_time_no, audience_type, seat_type,
 seat_no, head_count, ticketing_price, ticketing_pin_no, ticketer_phone, ticketing_date, ticketing_status)
values (seq_ticketing_ticketing_no.NEXTVAL, '기생충', 'CGV 강남', '10001', '청소년,청소년,청소년', 'standard,standard,standard',
		'B1,B2,B3',3,27000,'1230982-1324-431413','111-2222-3333',
		 SYSDATE, 0);
		 
insert into Ticketing 
(ticketing_no, movie_Name, theater_name, date_time_no, audience_type, seat_type,
 seat_no, head_count, ticketing_price, ticketing_pin_no, ticketer_phone, ticketing_date, ticketing_status)
values (seq_ticketing_ticketing_no.NEXTVAL, '기생충', 'CGV 강남', '10002', '일반,일반,일반', 'standard,standard,standard',
		'C1,C2,C3',3,30000,'4325234-4321-234534','444-5555-6666',
		 SYSDATE, 0);
		 
insert into Ticketing 
(ticketing_no, movie_Name, theater_name, date_time_no, audience_type, seat_type,
 seat_no, head_count, ticketing_price, ticketing_pin_no, ticketer_phone, ticketing_date, ticketing_status)
values (seq_ticketing_ticketing_no.NEXTVAL, '기생충', 'CGV 강남', '10003', '일반,일반,일반', 'standard,standard,standard',
		'D1,D2,D3',3,30000,'4325234-4321-234534','444-5555-6666',
		 SYSDATE, 0);
		 
insert into Ticketing 
(ticketing_no, movie_Name, theater_name, date_time_no, audience_type, seat_type,
 seat_no, head_count, ticketing_price, ticketing_pin_no, ticketer_phone, ticketing_date, ticketing_status)
values (seq_ticketing_ticketing_no.NEXTVAL, '기생충', 'CGV 강남', '10004', '일반,일반,일반', 'standard,standard,standard',
		'E1,E2,E3',3,30000,'1230982-1324-431413','111-2222-3333',
		 SYSDATE, 0);
		 
insert into Ticketing 
(ticketing_no, movie_Name, theater_name, date_time_no, audience_type, seat_type,
 seat_no, head_count, ticketing_price, ticketing_pin_no, ticketer_phone, ticketing_date, ticketing_status)
values (seq_ticketing_ticketing_no.NEXTVAL, '기생충', 'CGV 강남', '10005', '일반,일반,일반', 'standard,standard,standard',
		'F1,F2,F3',3,30000,'1230982-1324-431413','111-2222-3333',
		 SYSDATE, 0);		 
commit;



/*
CREATE TABLE theater ( 
	theater_no	 VARCHAR2(5)		 NOT NULL,
	movie_Name	 	VARCHAR2(100) 	 NOT NULL,	
	franchise		 VARCHAR2(15) 		 NOT NULL,
	theater_name	 VARCHAR2(50)		 NOT NULL,
	screen_name	 VARCHAR2(50)		 NOT NULL,
	total_seat		 NUMERIC(5)		 DEFAULT 130,
	PRIMARY KEY(theater_no)
);

##################Alter를 추후에 추가 해야함.###################
	date_time_no	 VARCHAR2(5)		 NOT NULL REFERENCES date_time(date_time_no),
###################################################
*/

--DROP TABLE theater;
--DROP SEQUENCE seq_theater_theater_no;
--CREATE SEQUENCE seq_theater_theater_no    	    	INCREMENT BY 1 START 

--정의된 시퀀스 조회

select * from user_sequences


--현재 시퀀스 마지막 값찍기 ( NO CACHE 선언되어있어야함 )
SELECT LAST_NUMBER-1
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_THEATER_THEATER_NO'

--날짜는 max로 찍으면 가장 최근 날짜임.
select * 
from users
where reg_date=(select max(reg_date) 
   from users)


--모든 SQL의 삭제 명령어를 받아올 수 있는 명령어 
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;


--JAVA.SQL.DATE 시 분 초 까지.. 저장? 시 분 초 까지 출력?
insert 시에 to_date('1111-11-11 21:11:22', 'yyyy-mm-dd hh24:mi:ss') 로..
호출시에 to_char(컬럼명, 'yyyy-mm-dd hh24:mi:ss') 
select 로 data타입의 컬럼을가져오면 기본적으로 날짜만 보여서..
실제로 시간도 저장되어 있다... 끄집어 내려면 문자로 변환시켜 줘야한다..
To_char(컬럼명,'hh24:mi:ss');

--중복 제거
select distinct movie_name from theater where franchise ='메가박스';


