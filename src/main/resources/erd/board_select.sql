-- 게시판 리스트

select b_no , b_title , b_groupNo, b_step , b_depth from board order by b_groupNo desc , b_step asc;

-- 게시판 리스트 페이지 시작 번호 끝번호로 반환

select * from (select rownum idx , s.* from (select b_no , b_title , b_writer , b_date , b_readCount , b_groupNo , b_step , b_depth from board order by b_groupNo desc , b_step asc)s)
where idx >= 1 and idx <= 5

-- 게시판 리스트 전체

select 	b_no,b_title,b_writer,b_date,b_readcount,b_groupno,b_step,b_depth from board order by b_groupNo desc , b_step asc;

-- 게시판 1개의 게시물 그룹

select * from board where b_groupNo = 1 order by b_groupNo desc , b_step asc;

select * from board where b_groupNo = 1 and depth >= 2 and step >= 2 order by b_step , b_depth asc;

select * from board where b_groupNo = 1;

-- 답변게시물 존재여부 확인

select count(*) cnt from board where b_groupNo = 1 and b_depth >= 2 and b_step >= 2 order by b_step , b_depth asc;