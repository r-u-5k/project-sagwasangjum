package com.itwill.shop.order;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class OrderServiceTest {
	OrderService orderService;
	@BeforeEach
	void setUp() throws Exception {
	orderService = new OrderService();
	}

	@Test
	void testCreateOrderStringArray() throws Exception{
		//System.out.println(orderService.create(null, null));
		
	}

	@Test
	void testCreateOrder()throws Exception {
		//fail("Not yet implemented");
	}

	@Test
	void testDeleteByOrderNo() throws Exception{
		//System.out.println(orderService.deleteByOrderNo(10));
	}

	@Test
	void testDelete() throws Exception{
		//System.out.println(orderService.delete("minsub1"));
	}

	@Test
	void testOrderList() throws Exception{
		 assertTrue(orderService.orderList("minsub1").size()>0); 
		System.out.println( orderService.orderList("minsub1"));
	}

	@Test
	void testOrderDetail() throws Exception{
		System.out.println(orderService.orderDetail(32));
		
	}

}
