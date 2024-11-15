DROP TABLE address CASCADE CONSTRAINTS;
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


CREATE TABLE address(
		addr_no                       		NUMBER(10)		 NULL ,
		addr_phone                    		VARCHAR2(100)		 NULL ,
		addr_address                  		VARCHAR2(100)		 NULL ,
		m_id                          		VARCHAR2(10)		 NULL 
);



ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (m_id);

ALTER TABLE address ADD CONSTRAINT IDX_address_PK PRIMARY KEY (addr_no);
ALTER TABLE address ADD CONSTRAINT IDX_address_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);

