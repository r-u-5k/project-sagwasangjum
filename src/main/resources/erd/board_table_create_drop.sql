DROP TABLE board CASCADE CONSTRAINTS;
DROP SEQUENCE board_sequence;
CREATE SEQUENCE board_sequence;


CREATE TABLE board(
		b_no                          		NUMBER(10)		 NOT NULL,
		b_title                       		VARCHAR2(2000)		 NOT NULL,
		b_writer                      		VARCHAR2(2000)		 NOT NULL,
		b_content                     		VARCHAR2(2000)		 NOT NULL,
		b_date                        		DATE		 DEFAULT sysdate		 NULL ,
		b_readCount                   		NUMBER(10)		 DEFAULT 0		 NULL ,
		b_groupNo                     		NUMBER(10)		 NOT NULL,
		b_step                        		NUMBER(10)		 NOT NULL,
		b_depth                       		NUMBER(10)		 DEFAULT 0		 NULL 
);



ALTER TABLE board ADD CONSTRAINT IDX_board_PK PRIMARY KEY (b_no);