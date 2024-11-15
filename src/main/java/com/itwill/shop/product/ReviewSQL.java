package com.itwill.shop.product;

public class ReviewSQL {

	// 리뷰 작성
	public final static String INSERT_REVIEW =
			"INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (?, '?', sysdate, '?', ?, '?')";
	
	// 리뷰 전체보기(ALL)
	public final static String FIND_BY_ALL = 
			"SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review";
	
	// 한 회원이 작성한 리뷰 전체보기(m_id)
	public final static String FIND_BY_M_ID = 
			"SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review WHERE m_id = '?'";
	
	// 한 제품의 리뷰 전체보기(p_no)
	public final static String FIND_BY_P_NO = 
			"SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review WHERE p_no = ?";
	
	// 한 제품의 리뷰 상세보기(r_no)
	public final static String FIND_BY_R_NO = 
			"SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review WHERE r_no = ?";
}
