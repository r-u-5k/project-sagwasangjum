package com.itwill.shop.cart;

import java.util.List;

public class CartService {
	private CartDao cartDao;

	public CartService() throws Exception {
		cartDao = new CartDaoImplMyBatis();
	}

	/*
	 * 장바구니 추가 or 수정
	 */
	public int addCart(String sMemberId, int pNo, int cQty) throws Exception {
		if (cartDao.countByProductNo(sMemberId, pNo) > 0) {
			return cartDao.updateByProductNo(sMemberId, pNo, cQty);
		} else {
			return cartDao.insert(sMemberId, pNo, cQty);
		}
	}

	/*
	 * 장바구니 수량 변경
	 */
	public int updateCart(int cNo, int cQty) throws Exception {
		return cartDao.updateByCartNo(cNo, cQty);
	}

	/*
	 * 장바구니 리스트 보기
	 */
	public List<Cart> getCartItemByMemberId(String sMemberId) throws Exception {
		return cartDao.findByMemberId(sMemberId);
	}

	/*
	 * 장바구니 아이템 1개 가져오기
	 */
	public Cart getCartItemByCartNo(int cNo) throws Exception {
		return cartDao.findByCartNo(cNo);
	}

	/*
	 * 장바구니 아이템 1개 삭제
	 */
	public int deleteCartItemByCartNo(int cNo) throws Exception {
		return cartDao.deleteByCartNo(cNo);
	}

	/*
	 * memberid로 장바구니 삭제
	 */
	public int deleteCartItemByMemberId(String sMemberId) throws Exception {
		return cartDao.deleteByMemberId(sMemberId);
	}
}