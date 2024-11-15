package com.itwill.shop.cart;

import java.util.List;

public interface CartDao {

	/*
	 * 장바구니에 제품 존재 여부
	 */
	int countByProductNo(String sMemberId, int pNo) throws Exception;

	/*
	 * 장바구니 생성
	 */
	int insert(String sMemberId, int pNo, int cQty) throws Exception;

	/*
	 * 상품 리스트에서 장바구니 추가 시 수량 변경
	 */
	int updateByProductNo(String sMemberId, int pNo, int cQty) throws Exception;

	/*
	 * 장바구니 화면에서 수량 변경
	 */
	int updateByCartNo(int cNo, int cQty) throws Exception;

	/*
	 * 장바구니 리스트
	 */
	List<Cart> findByMemberId(String mId) throws Exception;
	
	/*
	 * c_no로 장바구니 삭제
	 */
	int deleteByCartNo(int cNo) throws Exception;

	/*
	 * memberid로 장바구니 삭제
	 */
	int deleteByMemberId(String sMemberId) throws Exception;

	/*
	 * 장바구니 번호로 장바구니 검색
	 */
	Cart findByCartNo(int cNo) throws Exception;

}