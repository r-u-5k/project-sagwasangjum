
-- 로그인한회원의 정보보기(select pk)
select * from member where m_id ='minsub1';

-- 모든 회원 정보보기()
select * from member;

-- 로그인한회원의 회원의정보수정(update pk)
update member set 
    m_pw = '7777',
    m_name = '김변경',
    m_phone = '010-7777-7777',
    m_email = 'abc@abc.com',
    m_address='서울시 어딘가',
    m_regdate=sysdate
    where m_id ='minsub1';
    
-- 로그인한회원의 회원탈퇴(delete pk)
delete from member where m_id ='minsub4';



commit;