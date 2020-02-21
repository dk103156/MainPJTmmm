
DROP TABLE participation;
DROP TABLE quiz;
DROP TABLE preview;

commit;

DROP SEQUENCE seq_participation_part_no;
DROP SEQUENCE seq_quiz_quiz_no;
DROP SEQUENCE seq_preview_preview_no;

commit;

CREATE SEQUENCE seq_participation_part_no   INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_quiz_quiz_no	   		INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_preview_preview_no     	INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

commit;

CREATE TABLE preview ( 
	preview_no		 NUMERIC(5)	 		NOT NULL,
	preview_name 	 VARCHAR2(120)	 	NOT NULL,
	preview_place	 VARCHAR2(100)	 	NOT NULL,
	preview_date	 TIMESTAMP 			NOT NULL,
	image_file	 	 VARCHAR2(4000) 	NOT NULL,
	start_date		 TIMESTAMP	 		NOT NULL,
	end_date		 TIMESTAMP	 		NOT NULL,
	winner_count 	 NUMERIC(3)	 		NOT NULL,
	winner_date	 	 TIMESTAMP	 		NOT NULL,
	preview_regdate	 TIMESTAMP	 		NOT NULL,
	preview_status	 NUMERIC(2)	 		DEFAULT 0,
	PRIMARY KEY(preview_no)
);

CREATE TABLE quiz ( 
	quiz_no			 NUMERIC(5)	 		NOT NULL,
	question		 VARCHAR2(500)	 	NOT NULL,
	option1			 VARCHAR2(200)	 	NOT NULL,
	option2			 VARCHAR2(200)	 	NOT NULL,
	option3	 		 VARCHAR2(200)	 	NOT NULL,
	option4			 VARCHAR2(200)		NOT NULL,
	answer			 NUMERIC(2)			NOT NULL,
	start_date	 	 TIMESTAMP	 		NOT NULL,
	end_date		 TIMESTAMP	 		NOT NULL,
	quiz_date		 TIMESTAMP	 		NOT NULL,
	quiz_status	     NUMERIC(2)		 	DEFAULT 0,
	PRIMARY KEY(quiz_no)
);

CREATE TABLE participation ( 
	part_no			 NUMERIC(5)	 		NOT NULL,
	quiz_no	 		 NUMERIC(5)	 		REFERENCES quiz(quiz_no) on delete cascade,
	preview_no		 NUMERIC(5)	 		REFERENCES preview(preview_no) on delete cascade,
	user_no			 NUMERIC(5)	 		REFERENCES users(user_no) on delete cascade,
	part_type		 NUMERIC(1)	 		NOT NULL,
	winning_flag	 NUMERIC(2)	 		DEFAULT 0,
	part_date		 TIMESTAMP 			NOT NULL,
	PRIMARY KEY(part_no)
);

set linesize 500;
set pagesize 500;

COMMIT;

