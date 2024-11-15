package com.itwill.shop.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import com.itwill.shop.mapper.ProductMapper;

public class ProductDaoImplMyBatis implements ProductDao{
	
	private SqlSessionFactory sqlSessionFactory;
	
	public ProductDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	
	//searchType별 상품전체 리스트 보여주기
	@Override
	public List<Product> selectProductBySearchKeyword(Product searchProduct, int start, int last) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Map param = new HashMap();
		param.put("p_name",searchProduct.getPName());
		param.put("start",start);
		param.put("last",last);
		List<Product> productList = productMapper.selectProductBySearchKeyword(param);
		return productList;
	}
	//상품전체 리스트 보여주기
	@Override
	public List<Product> selectProductAll(int start, int last) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Map param = new HashMap();
		param.put("start",start);
		param.put("last",last);
		List<Product> productList = productMapper.selectProductAll(param);
		
		sqlSession.close();
		return productList;
	}
	
	//상품 이름으로 검색해서 상품리스트 보여주기
	@Override
	public List<Product> selectProductByProductName(String pName) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectProductByProductName(pName);
		
		sqlSession.close();
		return productList;
	}
	
	//상품전체 리스트 페이지로 나눠서 보여주기 (시작번호, 끝번호)
	@Override
	public List<Product> selectProductAllByPage(int start, int last) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Map param = new HashMap();
		param.put("start",start);
		param.put("last",last);
		List<Product> productList = productMapper.selectProductAllByPage(param);
		
		sqlSession.close();
		return productList;
	}
	
	
	//카테고리 상품전체 리스트 페이지로 나눠서 보여주기 (카테고리번호,시작번호, 끝번호)
	@Override
	public List<Product> selectProductAllByCategoryAndPage(int pCategoryNo, int pageBegin, int pageEnd) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		
		List<Product> productList = productMapper.selectProductAllByCategoryAndPage(pCategoryNo, pageBegin, pageEnd);
		
		sqlSession.close();
		return productList;
	}
	
	
	
	//검색결과 페이지로 나눠서 보여주기
	@Override
	public List<Product> selectProductAllByProductNameAndPage(int pageBegin, int pageEnd, Product searchProduct) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		
		List<Product> productList = productMapper.selectProductAllByProductNameAndPage(searchProduct, pageBegin, pageEnd);
		
		sqlSession.close();
		return productList;
	}
	
	
	
	
	
		
	//카테고리별 상품전체 리스트 보여주기
	@Override
	public List<Product> selectProductAllByCategory(int pCategoryNo, int start, int last) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Map param = new HashMap();
		param.put("pCategoryNo",pCategoryNo);
		param.put("start",start);
		param.put("last",last);
		
		List<Product> productList = productMapper.selectProductAllByCategory(param);
		System.out.println(productList);
		sqlSession.close();
		return productList;
	}
	
	
	//상품 갯수를 조회, 반환
	@Override
	public int getProductCount() throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		int totCount = productMapper.getProductCount();
		
		sqlSession.close();
		return totCount;
	}
	
	
	//카테고리 상품 갯수를 조회, 반환
	@Override
	public int getProductCountCategory(int pCategoryNo) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		int totCount = productMapper.getProductCountCategory(pCategoryNo);
		
		sqlSession.close();
		return totCount;
	}
	
	
	//검색한 상품 갯수를 조회, 반환
	@Override
	public int getProductCountName(Product searchProduct) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		
		int totCount = productMapper.getProductCountName(searchProduct);
		
		sqlSession.close();
		return totCount;
	}
	
	
	
	//한개의 상품 상세보기
	@Override
	public Product selectByPNo(int pNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Product product = productMapper.selectByPNo(pNo);
		
		sqlSession.close();
		return product;
	}

	
	
	

}