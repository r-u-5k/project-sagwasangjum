package com.itwill.shop.order;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class OrderDaoImplMyBatisTest2 {
	OrderDaoImplMyBatis orderDaoImplMyBatis;
	@BeforeEach
	void setUp() throws Exception {
		orderDaoImplMyBatis = new OrderDaoImplMyBatis();
	}

	@Test
	void testFindOrderList() throws Exception{
		System.out.println( orderDaoImplMyBatis.findOrderList(1, 20, "minsub1"));
	}
	@Test
	void testGetOrderCount()throws Exception {
		System.out.println( orderDaoImplMyBatis.getOrderCount("minsub1"));
	}

}
