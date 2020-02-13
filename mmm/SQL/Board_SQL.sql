DROP TABLE likee;
DROP TABLE commentt;
DROP TABLE article;

DROP SEQUENCE seq_likee_like_no;
DROP SEQUENCE seq_article_article_no;
DROP SEQUENCE seq_commentt_cmt_no;

commit;

CREATE SEQUENCE seq_likee_like_no 			INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_article_article_no	   	INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_comment_cmt_no	    	INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

commit;

CREATE TABLE article ( 
	article_no		 NUMERIC(5)	 	NOT NULL,
	article_status 	 NUMERIC(1)	 		,
	article_type	 NUMERIC(1) 		, 
	category	 	 NUMERIC(1) 		,
	user_id		 	 VARCHAR(10)	 	REFERENCES users(user_id),
	sup_art_no		 NUMERIC(5) 		REFERENCES article(article_no),
	article_title	 VARCHAR2(1000),
	article_content	 VARCHAR2(4000),
	article_date	 TIMESTAMP,
	file_name		 VARCHAR2(4000),
	view_count		 NUMERIC(20),
	blind_flag		 NUMERIC(1),
	blind_reason	 NUMERIC(1),
	blind_date	 	 TIMESTAMP,
	delete_date		 TIMESTAMP,
	qna_status		 NUMERIC(1),
	PRIMARY KEY(article_no)
);


CREATE TABLE commentt( 
	cmt_no			 NUMERIC(5)	 	NOT NULL,
	cmt_type	 	 NUMERIC(1)	 	,
	user_id			 VARCHAR2(10) 		REFERENCES users(user_id), 
	sup_cmt_no		 NUMERIC(5) 		REFERENCES commentt(cmt_no),
	article_no		 NUMERIC(5)	 		REFERENCES article(article_no),
	movie_no		 NUMERIC(5) 		REFERENCES movie(movie_no),
	cmt_content	 	 VARCHAR2(300),
	cmt_date		 TIMESTAMP,
	cmt_count		 NUMERIC(10),
	blind_flag		 NUMERIC(1),
	blind_reason	 NUMERIC(1),
	blind_date	 	 TIMESTAMP,
	PRIMARY KEY(cmt_no)
);



CREATE TABLE likee ( 
	like_no		 	NUMERIC(5)	 	NOT NULL,
	user_id	 		VARCHAR2(10)	NOT NULL REFERENCES users(user_id),
	article_no		NUMERIC(5)	 	REFERENCES article(article_no),
	cmt_no		 	NUMERIC(5)		REFERENCES commentt(cmt_no),		 
	ref_type	 	NUMERIC(1)	 	,
	PRIMARY KEY(like_no)
);


commit;

