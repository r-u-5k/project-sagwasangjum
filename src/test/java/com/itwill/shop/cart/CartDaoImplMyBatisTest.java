package com.itwill.shop.cart;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

class CartDaoImplMyBatisTest {
	CartDaoImplMyBatis cartDaoImplMyBatis;

	@BeforeEach
	void setUp() throws Exception {
		cartDaoImplMyBatis = new CartDaoImplMyBatis();
	}
	
	@Test
	void testCountByProductNo() throws Exception {
		assertNotNull(cartDaoImplMyBatis.countByProductNo("guard", 1));
	}

	@Test
	void testInsert() throws Exception {
		assertNotNull(cartDaoImplMyBatis.insert("guard", 1, 1));
	}

	@Test
	void testUpdateByProductNo() throws Exception {
		assertNotNull(cartDaoImplMyBatis.updateByProductNo("guard", 1, 2));
	}

	@Test
	void testUpdateByCartNo() throws Exception {
		assertNotNull(cartDaoImplMyBatis.updateByCartNo(1, 2));
	}

	@Test
	void testFindByMemberId() throws Exception {
		assertNotNull(cartDaoImplMyBatis.findByMemberId("guard"));
	}

	@Test
	void testDeleteByCartNo() throws Exception {
		assertNotNull(cartDaoImplMyBatis.deleteByCartNo(1));
	}

	@Test
	void testDeleteByMemberId() throws Exception {
		assertNotNull(cartDaoImplMyBatis.deleteByMemberId("guard"));
	}

	@Test
	void testFindByCartNo() throws Exception {
		assertNotNull(cartDaoImplMyBatis.findByCartNo(6));
	}

}
