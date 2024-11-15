package com.itwill.shop.order;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class OrderServiceTest3 {
	OrderService orderService;

	@BeforeEach
	void setUp() throws Exception {
		orderService = new OrderService();
	}

	@Test
	void testFindOrderList() throws Exception {
		System.out.println(orderService.findOrderList(2, "minsub1").itemList);
	}

}
