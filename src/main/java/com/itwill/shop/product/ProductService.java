package com.itwill.shop.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.itwill.shop.mapper.ProductMapper;

public class ProductService {

	private ProductDao productDao;

	public ProductService() throws Exception {
		productDao = new ProductDaoImplMyBatis();
	}

	// 상품전체 리스트 보여주기
	public ProductPageMakerDto selectProductAll(int pageno) throws Exception {
		int totalRecordCount = productDao.getProductCount();
		ProductPageMaker productPageMaker = new ProductPageMaker(totalRecordCount, pageno);
		List<Product> productList = productDao.selectProductAll(productPageMaker.getPageBegin(),productPageMaker.getPageEnd());
		ProductPageMakerDto productPageMakerDto = new ProductPageMakerDto();
		productPageMakerDto.itemList = productList;
		productPageMakerDto.productPageMaker = productPageMaker;
		return productPageMakerDto;
	}
	// searchType별 상품리스트 보여주기
	public ProductPageMakerDto selectProductBySearchKeyword(Product searchProduct, int pageno) throws Exception {
		
		int totalRecordCount = productDao.getProductCountName(searchProduct);
		ProductPageMaker productPageMaker = new ProductPageMaker(totalRecordCount, pageno);
		List<Product> productList = productDao.selectProductBySearchKeyword(searchProduct, productPageMaker.getPageBegin(),productPageMaker.getPageEnd());
		ProductPageMakerDto productPageMakerDto = new ProductPageMakerDto();
		productPageMakerDto.itemList = productList;
		productPageMakerDto.productPageMaker = productPageMaker;
		return productPageMakerDto;
		
	}
	// 카테고리별 상품전체 리스트 보여주기
	public ProductPageMakerDto selectProductAllByCategory(int pCategoryNo, int pageno) throws Exception {
		
		int totalRecordCount = productDao.getProductCountCategory(pCategoryNo);
		ProductPageMaker productPageMaker = new ProductPageMaker(totalRecordCount, pageno);
		System.out.println(productPageMaker.getPageBegin());
		System.out.println(productPageMaker.getPageEnd());
		List<Product> productList = productDao.selectProductAllByCategory(pCategoryNo, productPageMaker.getPageBegin(),productPageMaker.getPageEnd());
		ProductPageMakerDto productPageMakerDto = new ProductPageMakerDto();
		productPageMakerDto.itemList = productList;
		productPageMakerDto.productPageMaker = productPageMaker;
		return productPageMakerDto;
		
	}

	
	
	
	
	
	
	
	
	
	
	// 상품 이름으로 검색해서 상품리스트 보여주기
	public List<Product> selectProductByProductName(String pName, int pageno) throws Exception {
		return productDao.selectProductByProductName(pName);
	}

	
	
	
	
	
	
	
	
	// 상품전체 리스트 페이지로 보여주기
	public ProductPageMakerDto selectProductAllByPage(int pageno) throws Exception {

		int totalRecordCount = productDao.getProductCount();
		ProductPageMaker productPageMaker = new ProductPageMaker(totalRecordCount, pageno);
		List<Product> productList = productDao.selectProductAllByPage(productPageMaker.getPageBegin(),
				productPageMaker.getPageEnd());
		ProductPageMakerDto productPageMakerDto = new ProductPageMakerDto();
		productPageMakerDto.itemList = productList;
		productPageMakerDto.productPageMaker = productPageMaker;
		return productPageMakerDto;

	}

	// 카테고리별 상품리스트 페이지로 보여주기
	public ProductPageMakerDto selectProductAllByCategoryAndPage(int pageno, int pCategoryNo) throws Exception {

		int totalRecordCount = productDao.getProductCount();
		ProductPageMaker productPageMaker = new ProductPageMaker(totalRecordCount, pageno);
		List<Product> productList = productDao.selectProductAllByCategoryAndPage(productPageMaker.getPageBegin(),
				productPageMaker.getPageEnd(), pCategoryNo);
		ProductPageMakerDto productPageMakerDto = new ProductPageMakerDto();
		productPageMakerDto.itemList = productList;
		productPageMakerDto.productPageMaker = productPageMaker;
		return productPageMakerDto;

	}

	// 검색결과 상품리스트 페이지로 보여주기
	public ProductPageMakerDto selectProductAllByProductNameAndPage(int pageno, Product searchProduct)
			throws Exception {

		int totalRecordCount = productDao.getProductCount();
		ProductPageMaker productPageMaker = new ProductPageMaker(totalRecordCount, pageno);
		List<Product> productList = productDao.selectProductAllByProductNameAndPage(productPageMaker.getPageBegin(),
				productPageMaker.getPageEnd(), searchProduct);
		ProductPageMakerDto productPageMakerDto = new ProductPageMakerDto();
		productPageMakerDto.itemList = productList;
		productPageMakerDto.productPageMaker = productPageMaker;
		return productPageMakerDto;

	}

	/*
	// 카테고리별 상품 리스트 페이지로 보여주기
	public ProductPageMakerDto selectProductAllByCategoryAndPage(int searchType, int pCategoryNo, int currentPage,String pName) throws Exception {
	    
		// 카테고리에 속한 상품의 총 개수 가져오기
		int totalRecordCount = 0;
		
	    if(searchType == 0) {
	    	 totalRecordCount = productDao.getProductCount();
	    }else if(searchType == 1) {
	    	totalRecordCount = productDao.getProductCountCategory(pCategoryNo);
	    }else if(searchType == 2) {
	    	totalRecordCount = productDao.getProductCountName(pName);
	    }
		// 페이지 메이커 생성
	    ProductPageMaker productPageMaker = new ProductPageMaker(totalRecordCount, currentPage);
	    
	    // 카테고리에 속한 상품 리스트 가져오기
	    List<Product> productList = null;
	    if(searchType == 0) {
	    	 productList = productDao.selectProductAllByPage(productPageMaker.getPageBegin(), productPageMaker.getPageEnd());
	    }else if(searchType == 1) {
	    	 productList = productDao.selectProductAllByCategoryAndPage(pCategoryNo, currentPage, totalRecordCount);
	    }else if(searchType == 2) {
	    	 //productList = productDao.selectProductByProductName(pName);
	    	productList = productDao.selectProductByProductNameAndPage(pName, productPageMaker.getPageBegin(), productPageMaker.getPageEnd());
	    	
	    }
	    
	    // ProductPageMakerDto에 상품 리스트와 페이지 메이커 설정
	    ProductPageMakerDto productPageMakerDto = new ProductPageMakerDto();
	    productPageMakerDto.itemList = productList;
	    productPageMakerDto.productPageMaker = productPageMaker;
	    
	    return productPageMakerDto;
	}
	*/

	// 한개의 상품 상세보기
	public Product selectByPNo(int pNo) throws Exception {
		return productDao.selectByPNo(pNo);
	}
}