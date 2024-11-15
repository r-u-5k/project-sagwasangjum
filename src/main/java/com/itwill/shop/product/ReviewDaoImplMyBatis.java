package com.itwill.shop.product;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.ProductMapper;
import com.itwill.shop.mapper.ReviewMapper;

public class ReviewDaoImplMyBatis implements ReviewDao {

	private SqlSessionFactory sqlSessionFactory;

	public ReviewDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	// 리뷰작성
	@Override
	public int insert(Review review) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		int rowCount = reviewMapper.insert(review);
		sqlSession.close();
		return rowCount;
	}

	// 리뷰 전체보기
	@Override
	public List<Review> findByAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		List<Review> ReviewList = reviewMapper.findByAll();
		sqlSession.close();
		return ReviewList;

	}

	// 한 회원이 작성한 리뷰 전체보기(m_id)
	@Override
	public List<Review> findByMId(String mId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		List<Review> reviewList = reviewMapper.findByMId(mId);
		sqlSession.close();
		return reviewList;

	}

	// 한 제품의 리뷰 전체보기(p_no)
	@Override
	public List<Review> findByPNo(int pNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		List<Review> reviewList = reviewMapper.findByPNo(pNo);
		sqlSession.close();
		return reviewList;
	}

	// 한 제품의 리뷰 상세보기(r_no)
	@Override
	public Review findByRNo(int rNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		Review review = reviewMapper.findByRNo(rNo);
		sqlSession.close();
		return review;

	}

}