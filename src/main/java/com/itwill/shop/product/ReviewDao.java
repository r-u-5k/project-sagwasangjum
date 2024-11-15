package com.itwill.shop.product;

import java.util.List;

public interface ReviewDao {

	// 리뷰작성
	int insert(Review review) throws Exception;
	
	// 리뷰 전체보기
	List<Review> findByAll() throws Exception;
	
	// 한 회원이 작성한 리뷰 전체보기(m_id)
	List<Review> findByMId (String mId) throws Exception;
	
	// 한 제품의 리뷰 전체보기(p_no)
	List<Review> findByPNo (int pNo) throws Exception;
	
	// 한 제품의 리뷰 상세보기(r_no)
	Review findByRNo (int rNo) throws Exception;
	
}