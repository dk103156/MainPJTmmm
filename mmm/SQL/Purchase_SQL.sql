DROP TABLE cart;
DROP SEQUENCE seq_cart_cart_no;

DROP TABLE purchase;
DROP SEQUENCE seq_purchase_purchase_no;


CREATE SEQUENCE seq_cart_cart_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;

CREATE TABLE cart (
cart_no				NUMERIC(5)		NOT NULL,
cart_user			NUMERIC(5)		NOT NULL REFERENCES users(user_no),
cart_prod			NUMERIC(5)		NOT NULL REFERENCES product(prod_no),
quantity			NUMERIC(5),
cart_date			TIMESTAMP,	
cart_status			NUMERIC(5),
PRIMARY KEY(cart_no)
);



CREATE SEQUENCE seq_purchase_purchase_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;


CREATE TABLE purchase (
purchase_no			NUMERIC(10)		NOT NULL,
purchase_user		NUMERIC(5)		NOT NULL REFERENCES users(user_no),
purchase_prod		NUMERIC(10)		NOT NULL REFERENCES product(prod_no),
purchase_status		NUMERIC(5),
purchase_price		NUMERIC(10),
rc_phone			NUMERIC(13)		NOT NULL,
rc_name				VARCHAR2(50) ,
message				VARCHAR2(100),
purchase_quantity 	NUMERIC(5),
issued_date			TIMESTAMP 		NOT NULL,
used_date			TIMESTAMP,
owner_no			NUMERIC(5) 	REFERENCES users(user_no),
used_status			NUMERIC(5)		DEFAULT 0,
prod_pin_no			VARCHAR2(25)	NOT NULL,
PRIMARY KEY(purchase_no)
);

commit;