select orders_order_no_SEQ.nextval from dual;

/********************************주문*********************************/
--1. 멤버 한사람의 주문전체목록
select * from orders where m_id='minsub1';

--2. 주문한개(멤버 한사람의) 
select * from orders where order_no=31;


--3. 주문한개의  주문상세 여러개(주문상세)
select * from order_item where order_no = 31;

--4. 로그인한멤버(guard1) 주문리스트(주문상세,제품정보)
select * from orders  o join order_item oi on o.order_no=oi.order_no join product p on oi.p_no=p.p_no where o.m_id='minsub1';

--4-1. 로그인한멤버(guard1) 주문 한개의 주문상세페이지(주문상세,제품정보)
select * from orders  o join order_item oi on o.order_no=oi.order_no join product p on oi.p_no=p.p_no where o.order_no=32;
--5. 주문한개삭제(주문1개삭제,주문상세삭제)
--on delete cascade
delete from order_item where order_no=12;
delete from orders where order_no=11;

--rollback;
--6. 멤버한사람의 주문내역전체삭제
----on delete cascade
delete from order_item where order_no in(select order_no from orders where m_id='test1');
delete from orders where m_id='guard1';