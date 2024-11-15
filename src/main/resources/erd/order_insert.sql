

--insert 
--제품상세보기에서주문
INSERT INTO orders (order_no, order_date, order_desc, order_price, m_id, order_addr, order_name, order_phone) VALUES (orders_order_no_SEQ.nextval, sysdate  , '아이폰외 1종', 123123, 'guard','서울시','김수환','010-4996-2719');
INSERT INTO order_item (oi_no, oi_qty, order_no, p_no) VALUES (order_item_oi_no_SEQ.nextval, 3, orders_order_no_SEQ.currval, 2);


--카트에서주문
INSERT INTO orders (order_no, order_date, order_desc, order_price, m_id, order_addr, order_name, order_phone) VALUES (orders_order_no_SEQ.nextval, sysdate  , '아이폰외 1종', 123123, 'guard','서울시','김수환','010-4996-2719');
INSERT INTO order_item (oi_no, oi_qty, order_no, p_no) VALUES (order_item_oi_no_SEQ.nextval, 3, orders_order_no_SEQ.currval, 2);
INSERT INTO order_item (oi_no, oi_qty, order_no, p_no) VALUES (order_item_oi_no_SEQ.nextval, 3, orders_order_no_SEQ.currval, 3);
INSERT INTO order_item (oi_no, oi_qty, order_no, p_no) VALUES (order_item_oi_no_SEQ.nextval, 3, orders_order_no_SEQ.currval, 4);

