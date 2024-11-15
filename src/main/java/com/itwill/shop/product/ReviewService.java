package com.itwill.shop.product;

import java.util.List;

public class ReviewService {

		private ReviewDao reviewDao;
		
		public ReviewService() throws Exception {
			reviewDao = new ReviewDaoImplMyBatis();
		}
		
		// 리뷰작성
		public int insert(Review review) throws Exception{
			return reviewDao.insert(review);
		}
		
		// 리뷰 전체보기
		public List<Review> findByAll() throws Exception{
			return reviewDao.findByAll();
		}
		
		// 한 회원이 작성한 리뷰 전체보기(m_id)
		public List<Review> findByMId (String mId) throws Exception{
			return reviewDao.findByMId(mId);
			
		}
		
		// 한 제품의 리뷰 전체보기(p_no)
		public List<Review> findByPNo (int pNo) throws Exception{
			return reviewDao.findByPNo(pNo);
		}
		
		// 한 제품의 리뷰 상세보기(r_no)
		public Review findByRNo (int rNo) throws Exception{
			return reviewDao.findByRNo(rNo);
			
		}
}
