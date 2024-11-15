package com.itwill.shop.order;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class OrderDaoImplMyBatisTest {
	OrderDaoImplMyBatis orderDaoImplMyBatis;

	@BeforeEach
	void setUp() throws Exception {
		orderDaoImplMyBatis=new OrderDaoImplMyBatis();
	}

	@Test
	void testInsert()throws Exception {
		//System.out.println(orderDaoImplMyBatis.insert(Order.builder()
			//	.orderAddr("sdsd")
			//	.orderPhone("asdasd")
			//	.build()));
	}

	@Test
	void testFindOrderByOrderNo() throws Exception{
		System.out.println(orderDaoImplMyBatis.findOrderByOrderNo(32));
	}

	@Test
	void testFindOrderListByMemberId() throws Exception{
		System.out.println(orderDaoImplMyBatis.findOrderListByMemberId("minsub1"));
	}

	@Test
	void testDeleteByMemberId()throws Exception {
		//System.out.println(orderDaoImplMyBatis.deleteByMemberId("minsub1"));
	}

	@Test
	void testDeleteByOrderNO() throws Exception{
		//System.out.println(orderDaoImplMyBatis.deleteByOrderNO(1));
	}

}
