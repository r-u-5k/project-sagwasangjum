
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE Cart CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE product_category CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member(
		m_id                          		VARCHAR2(100)		 NOT NULL,
		m_pw                          		VARCHAR2(100)		 NOT NULL,
		m_name                        		VARCHAR2(100)		 NULL ,
		m_phone                       		VARCHAR2(100)		 NULL ,
		m_email                       		VARCHAR2(100)		 NULL ,
		m_address                     		VARCHAR2(100)		 NULL ,
		m_regdate                     		DATE		 DEFAULT sysdate		 NULL 
);


CREATE TABLE orders(
		order_no                      		NUMBER(10)		 NULL ,
		order_date                    		DATE		 NULL ,
		order_desc                    		VARCHAR2(100)		 NULL ,
		order_price                   		NUMBER(10)		 NULL ,
		m_id                          		VARCHAR2(100)		 NULL ,
		order_addr                    		VARCHAR2(100)		 NULL ,
		order_name                    		VARCHAR2(100)		 NULL ,
		order_phone                   		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE orders_order_no_SEQ;

CREATE SEQUENCE orders_order_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product_category(
		p_category_no                 		NUMBER(10)		 NOT NULL,
		p_category_name               		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE product_category_p_category_no_SEQ;

CREATE SEQUENCE product_category_p_category_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE product(
		p_no                          		NUMBER(10)		 NOT NULL,
		p_name                        		VARCHAR2(50)		 NULL ,
		p_price                       		NUMBER(10)		 NULL ,
		p_image                       		VARCHAR2(100)		 NULL ,
		p_category_no                 		NUMBER(10)		 NULL ,
		p_content                     		VARCHAR2(500)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE order_item(
		oi_no                         		NUMBER(10)		 NULL ,
		oi_qty                        		NUMBER(10)		 NULL ,
		order_no                      		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_item_oi_no_SEQ;

CREATE SEQUENCE order_item_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE review(
		r_no                          		NUMBER(10)		 NOT NULL,
		r_content                     		VARCHAR2(1000)		 NOT NULL,
		r_date                        		DATE		 DEFAULT sysdate		 NOT NULL,
		r_star                        		VARCHAR2(100)		 NOT NULL,
		p_no                          		NUMBER(10)		 NULL ,
		m_id                          		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE review_r_no_SEQ;

CREATE SEQUENCE review_r_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE Cart(
		c_qty                         		NUMBER(10)		 NULL ,
		c_no                          		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL ,
		m_id                          		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE Cart_c_no_SEQ;

CREATE SEQUENCE Cart_c_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE board(
		b_no                          		NUMBER(10)		 NOT NULL,
		b_title                       		VARCHAR2(2000)		 NOT NULL,
		b_writer                      		VARCHAR2(2000)		 NOT NULL,
		b_content                     		VARCHAR2(2000)		 NOT NULL,
		b_date                        		DATE		 DEFAULT sysdate		 NULL ,
		b_readCount                   		NUMBER(10)		 DEFAULT 0		 NULL ,
		b_groupNo                     		NUMBER(10)		 NOT NULL,
		b_step                        		NUMBER(10)		 NOT NULL,
		b_depth                       		NUMBER(10)		 DEFAULT 0		 NULL ,
		m_id                          		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE board_sequence;

CREATE SEQUENCE board_sequence NOMAXVALUE NOCACHE NOORDER NOCYCLE;





ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (m_id);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (order_no);
ALTER TABLE orders DROP CONSTRAINT IDX_orders_FK0;
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id) ON DELETE CASCADE;

ALTER TABLE product_category ADD CONSTRAINT IDX_product_category_PK PRIMARY KEY (p_category_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (p_category_no) REFERENCES product_category (p_category_no);

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (order_no) REFERENCES orders (order_no)on delete cascade;
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (r_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE review DROP CONSTRAINT IDX_review_FK1;
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (m_id) REFERENCES member (m_id) ON DELETE CASCADE;


ALTER TABLE Cart ADD CONSTRAINT IDX_Cart_PK PRIMARY KEY (c_no);
ALTER TABLE Cart ADD CONSTRAINT IDX_Cart_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE Cart DROP CONSTRAINT IDX_Cart_FK1;
ALTER TABLE Cart ADD CONSTRAINT IDX_Cart_FK1 FOREIGN KEY (m_id) REFERENCES member (m_id) ON DELETE CASCADE;

ALTER TABLE board ADD CONSTRAINT IDX_board_PK PRIMARY KEY (b_no);
ALTER TABLE board DROP CONSTRAINT IDX_board_FK0;
ALTER TABLE board ADD CONSTRAINT IDX_board_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id) ON DELETE CASCADE;


