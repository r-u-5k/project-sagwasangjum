package com.itwill.shop.member;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class MemberDaoTest {
	MemberDao memberDao;

	@BeforeEach
	void setUp() throws Exception {
		memberDao = new MemberDaoImplMyBatis();
	}

	@Test
	void testDelete() throws Exception {
		memberDao.delete("minsub1");
	}

}
