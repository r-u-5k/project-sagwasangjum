package com.itwill.shop.cart;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.CartMapper;

public class CartDaoImplMyBatis implements CartDao {
	private SqlSessionFactory sqlSessionFactory;

	public CartDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	/*
	 * 장바구니에 제품 존재 여부
	 */
	@Override
	public int countByProductNo(String sMemberId, int pNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int count = cartMapper.countByProductNo(sMemberId, pNo);
		return count;
	}

	/*
	 * 장바구니 생성
	 */
	@Override
	public int insert(String sMemberId, int pNo, int cQty) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int insertRowCount = cartMapper.insert(sMemberId, pNo, cQty);
		sqlSession.close();
		return insertRowCount;

	}

	/*
	 * 상품 리스트에서 장바구니 추가 시 수량 변경
	 */
	@Override
	public int updateByProductNo(String sMemberId, int pNo, int cQty) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.updateByProductNo(sMemberId, pNo, cQty);
		sqlSession.close();
		return rowCount;
	}

	/*
	 * 장바구니 화면에서 수량 변경
	 */
	@Override
	public int updateByCartNo(int cNo, int cQty) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.updateByCartNo(cNo, cQty);
		sqlSession.close();
		return rowCount;
	}

	/*
	 * 장바구니 리스트
	 */
	@Override
	public List<Cart> findByMemberId(String mId) throws Exception {
		List<Cart> cartList = new ArrayList<Cart>();
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		cartList = cartMapper.findByMemberId(mId);
		sqlSession.close();
		return cartList;
	}
	
	/*
	 * c_no로 장바구니 삭제
	 */
	@Override
	public int deleteByCartNo(int cNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int deleteRowCount = cartMapper.deleteByCartNo(cNo);
		sqlSession.close();
		return deleteRowCount;
	}

	/*
	 * memberid로 장바구니 삭제
	 */
	@Override
	public int deleteByMemberId(String sMemberId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int deleteRowCount = cartMapper.deleteByMemberId(sMemberId);
		sqlSession.close();
		return deleteRowCount;
	}

	/*
	 * 장바구니 번호로 장바구니 검색
	 */
	@Override
	public Cart findByCartNo(int cNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		Cart cart = cartMapper.findByCartNo(cNo);
		sqlSession.close();
		return cart;
	}
}