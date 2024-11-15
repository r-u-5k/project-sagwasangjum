package com.itwill.shop.product;

import java.util.List;

public interface ProductDao {
	
	//상품전체 리스트 보여주기
	List<Product> selectProductAll(int start, int last) throws Exception;
	
	//searchType별 상품리스트 보여주기
	List<Product> selectProductBySearchKeyword(Product searchProduct, int start, int last) throws Exception;
	
	//상품전체 리스트 페이지로 나눠서 보여주기 (시작번호, 끝번호)
	List<Product> selectProductAllByPage(int start, int last) throws Exception;
	
	
	
	
	
	
	//카테고리별 상품전체 리스트 보여주기
	List<Product> selectProductAllByCategory(int pCategoryNo, int start, int last) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	//상품 이름으로 검색해서 상품리스트 보여주기
	List<Product> selectProductByProductName(String pName) throws Exception;
	
	//상품 갯수를 조회, 반환
	int getProductCount() throws Exception;
	
	
	//카테고리 상품 갯수를 조회, 반환
	int getProductCountCategory(int pCategoryNo) throws Exception;
	
	//검색한 상품 갯수를 조회, 반환
	int getProductCountName(Product searchProduct) throws Exception;
	
	
	
	//한개의 상품 상세보기
	Product selectByPNo(int pNo) throws Exception;

	
	
	
	//카테고리별 상품리스트 페이지로 나눠서 보여주기
	List<Product> selectProductAllByCategoryAndPage(int pCategoryNo, int pageBegin, int pageEnd) throws Exception;

	//검색결과 페이지로 나눠서 보여주기
	List<Product> selectProductAllByProductNameAndPage(int pageBegin, int pageEnd, Product searchProduct) throws Exception;
	
	
	

}