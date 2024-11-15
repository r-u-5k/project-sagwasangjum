/*
    b_no                          		NUMBER(10)		 NOT NULL,
	b_title                       		VARCHAR2(2000)		 NOT NULL,
	b_writer                      		VARCHAR2(2000)		 NOT NULL,
	b_content                     		VARCHAR2(2000)		 NOT NULL,
	b_date                        		DATE		 DEFAULT sysdate		 NULL ,
	b_readCount                   		NUMBER(10)		 DEFAULT 0		 NULL ,
	b_groupNo                     		NUMBER(10)		 NOT NULL,
	b_step                        		NUMBER(10)		 NOT NULL,
	b_depth                       		NUMBER(10)		 DEFAULT 0		 NULL 
 */

-- 새글 쓰기 (최상위 글)
/*
 * groupno : boardno
 * step    : 1
 * depth   : 0
 */

insert into board (b_no,b_title,b_writer,b_content,b_date,b_groupNo,b_step,b_depth,m_id) 
values (board_sequence.nextval , 
'제가 산 기기가 말썽이에요'||board_sequence.currval,
'이말썽'||board_sequence.currval,
'제가 산 기기가 오자마자 고장 났어요!!'||board_sequence.currval,
sysdate,
board_sequence.currval,
1,0,'minsub1');

insert into board (b_no,b_title,b_writer,b_content,b_date,b_groupNo,b_step,b_depth,m_id) 
values (board_sequence.nextval , 
'배송이 늦어요!!'||board_sequence.currval,
'김거북'||board_sequence.currval,
'제가 산 기기가 도착하지 않아요!!!'||board_sequence.currval,
sysdate,
board_sequence.currval,
1,0,'minsub2');

insert into board (b_no,b_title,b_writer,b_content,b_date,b_groupNo,b_step,b_depth,m_id) 
values (board_sequence.nextval , 
'제가 산 기기를 환불하고 싶어요!!'||board_sequence.currval,
'김빠꾸'||board_sequence.currval,
'제가 산 기기를 환불하고 싶어요!!'||board_sequence.currval,
sysdate,
board_sequence.currval,
1,0,'minsub3');

insert into board (b_no,b_title,b_writer,b_content,b_date,b_groupNo,b_step,b_depth,m_id) 
values (board_sequence.nextval , 
'제가 산 기기를 교환하고 싶어요'||board_sequence.currval,
'최교환'||board_sequence.currval,
'제가 산 기기를 교환하고 싶어요!!!'||board_sequence.currval,
sysdate,
board_sequence.currval,
1,0,'minsub1');

insert into board (b_no,b_title,b_writer,b_content,b_date,b_groupNo,b_step,b_depth,m_id) 
values (board_sequence.nextval , 
'제가 산 기기에 기스가 있어요'||board_sequence.currval,
'김기스'||board_sequence.currval,
'제가 산 기기에 기스가 있어요'||board_sequence.currval,
sysdate,
1,
1,0,'guard');

-- 답글 쓰기
/*현재글의 데이타를 기반으로 작업한다.
    1. boardno : 시퀀스증가
    2. groupno : 현재글의 groupno
    3. step    : 현재글의 step  + 1
    4. depth   : 현재글의 depth + 1
 */

-- 현재 글의 step보다 큰 step을 가진 게시물들의 step + 1씩 증가 
update board set b_step = b_step+1 where b_step > 1 and b_groupNo = 1;
-- 답글 쓰기
insert into board (b_no , b_title , b_writer , b_content , b_date , b_groupNo , b_step , b_depth,m_id)
values (board_sequence.nextval , 
'고객님의 문의에 대한 답변입니다.'||board_sequence.currval,
'사과상점 점원'||board_sequence.currval,
'접수 되었습니다. 감사합니다.'||board_sequence.currval,
sysdate,
1,
2,1,'minsub1'); 

insert into board (b_no , b_title , b_writer , b_content , b_date , b_groupNo , b_step , b_depth,m_id)
values (board_sequence.nextval , 
'고객님의 문의에 대한 답변입니다.'||board_sequence.currval,
'사과상점 점원'||board_sequence.currval,
'접수 되었습니다. 감사합니다.'||board_sequence.currval,
sysdate,
2,
2,1,'minsub1');

insert into board (b_no , b_title , b_writer , b_content , b_date , b_groupNo , b_step , b_depth,m_id)
values (board_sequence.nextval , 
'고객님의 문의에 대한 답변입니다.'||board_sequence.currval,
'사과상점 점원'||board_sequence.currval,
'접수 되었습니다. 감사합니다.'||board_sequence.currval,
sysdate,
3,
2,1,'minsub1');
