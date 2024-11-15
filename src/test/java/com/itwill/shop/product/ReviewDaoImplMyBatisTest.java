package com.itwill.shop.product;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ReviewDaoImplMyBatisTest {
	
	ReviewDao reviewDao;

	@BeforeEach
	void setUp() throws Exception {
		reviewDao = new ReviewDaoImplMyBatis();
	}

	@Test
	void testInsert() throws Exception {
		reviewDao.insert(Review.builder()
								.rNo(7)
								.rContent("좋아영")
								.pNo(3)
								.rStar("★★★★☆")
								.mId("minsub1")
								.build());
	}
	
	@Test
	void testFindByAll() throws Exception {
		assertNotEquals(reviewDao.findByAll(), null);
		assertEquals(reviewDao.findByAll().size(), 6);
	}

	@Test
	void testFindByMId() throws Exception {
		assertNotEquals(reviewDao.findByMId("minsub1"), null);
	}
	
	@Test
	void testFindByPNo() throws Exception {
		assertNotEquals(reviewDao.findByPNo(3), null);
	}
	
	@Test
	void testFindByRNo() throws Exception {
		Review review = reviewDao.findByRNo(4);
		assertNotEquals(review, null);
	}

}
