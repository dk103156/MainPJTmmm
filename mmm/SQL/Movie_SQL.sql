DROP TABLE star_rating;
DROP TABLE movie_genre;
DROP TABLE wish;
DROP TABLE genre;
DROP TABLE movie;


DROP SEQUENCE seq_movie_movie_no;
DROP SEQUENCE seq_genre_genre_no;
DROP SEQUENCE seq_movie_genre_movie_genre_no;
DROP SEQUENCE seq_star_rating_star_rating_no;
DROP SEQUENCE seq_wish_wish_no;


CREATE SEQUENCE seq_movie_movie_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

CREATE SEQUENCE seq_genre_genre_no	   	
INCREMENT BY 1 START WITH 1 maxValue 99999 NOCACHE;

CREATE SEQUENCE seq_movie_genre_movie_genre_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

CREATE SEQUENCE seq_star_rating_star_rating_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

CREATE SEQUENCE seq_wish_wish_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;


CREATE TABLE movie (
		movie_no 		 	NUMERIC(5)	 	NOT NULL, 
		MOVIE_title 	  	VARCHAR2(200) 	NOT NULL, 
		release_date 	 	DATE 			NOT NULL, 
		kmdb_code 		 	VARCHAR2(20) 		UNIQUE, 
		movie_rating 	 	VARCHAR2(30),  
		running_time 	 	NUMERIC(3),  
		poster 			 	VARCHAR2(2000),   
		summary 	 	 	VARCHAR2(4000),   
		onBoxOffice_flag  	NUMERIC(2),   
		PRIMARY  KEY(movie_no)
);

CREATE TABLE movie_genre(
	movie_genre_no	 	NUMERIC(5)	 	NOT NULL, 
	movie_no		 	NUMERIC(5)	 	NOT NULL 	REFERENCES MOVIE(movie_no), 
	genre			 	VARCHAR2(30) 	NOT NULL, 
	PRIMARY 	KEY(movie_genre_no)
);

CREATE TABLE star_rating(
	star_rating_no	 	NUMERIC(5)	 	NOT NULL, 
	movie_no		 	NUMERIC(5)	 	NOT NULL REFERENCES MOVIE(movie_no), 
	user_no			 	NUMERIC(5)	 	NOT NULL,  
	star_rate		 	NUMERIC(10)	 	NOT NULL,  
	rate_date		 	TIMESTAMP	 	NOT NULL, 
	PRIMARY KEY(star_rating_no)
);

CREATE TABLE wish(
	wish_no		 	NUMERIC(5)	 	NOT NULL, 
	movie_no	 	NUMERIC(5)	 	NOT NULL REFERENCES MOVIE(movie_no), 
	user_no		 	NUMERIC(5)	 	NOT NULL, 
	wish_date	 	TIMESTAMP	 	NOT NULL, 
	PRIMARY 	KEY(wish_no)
);

commit;

/*INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목', '2020-05-21', NULL, NULL, '111111', 0,  NULL, NULL);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목02', '2020-01-01', '11111', NULL, '555555', 0,  NULL, NULL);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목03', '2020-02-11', NULL, '11111', NULL, 0,  NULL,  NULL);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목04', '2020-01-17', NULL, NULL, '222222', 0,  NULL, 1);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목05', '2020-11-01', '222222', NULL, '33333', 0,  NULL, 1);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목06', '2020-12-02', NULL, '222222', NULL, 0,  NULL, 1);*/


/*INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10000,
		'드라마'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10000,
		'액션'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10000,
		'뮤지컬'				);

	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10001,
		'드라마'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10001,
		'액션'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10002,
		'드라마'				);	
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10002,
		'액션'				);	

INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10002,
		'뮤지컬'				);	

	INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10003,
		'드라마'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10003,
		'액션'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10003,
		'뮤지컬'				);

	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10004,
		'드라마'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10004,
		'액션'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10005,
		'드라마'				);	
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10005,
		'액션'				);	

INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10005,
		'뮤지컬'				);	*/

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10000, 10001, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10000, 10002, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10000, 10003, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10000, 10004, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10000, 10005, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10003, 10001, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10003, 10003, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10003, 10004, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10004, 10003, SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10000, 10001, 9,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10000, 10002, 6,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10000, 10003, 8,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10000, 10004, 8,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10001, 10003, 7,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10002, 10003, 5,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10003, 10003, 2,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10003, 10002, 10,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10003, 10001, 1,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10004, 10001, 8,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10004, 10002, 3,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10004, 10003, 8,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10005, 10003, 1,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10005, 10005, 7,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10006, 10003, 8,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10007, 10003, 1,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10008, 10003, 3,SYSDATE);




COMMIT;

