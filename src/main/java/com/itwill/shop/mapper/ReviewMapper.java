package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import com.itwill.shop.product.Review;


public interface ReviewMapper {
	
	// 리뷰작성
	@Insert("INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id)"
			+ "VALUES (review_r_no_SEQ.nextval, #{rContent}, sysdate, #{rStar}, #{pNo}, #{mId})")
	int insert(Review review) throws Exception;
	
	// 리뷰 전체보기
	@ResultType(Review.class)
	@Select("SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review")
	List<Review> findByAll() throws Exception;
	
	// 한 회원이 작성한 리뷰 전체보기(m_id)
	@Select("SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review WHERE m_id = #{m_id}")
	List<Review> findByMId (String mId) throws Exception;
	
	// 한 제품의 리뷰 전체보기(p_no)
	@Select("SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review WHERE p_no = #{p_no} order by r_no desc")
	List<Review> findByPNo (int pNo) throws Exception;
	
	// 한 제품의 리뷰 상세보기(r_no)
	@Select("SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review WHERE r_no = #{r_no}")
	Review findByRNo (int rNo) throws Exception;

}