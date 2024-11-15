package com.itwill.shop.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.itwill.shop.product.Product;

public interface ProductMapper {
	

	
	//searchType별 상품리스트 보여주기
	//@Select("SELECT * FROM (SELECT ROWNUM idx, sorted_product.* FROM (SELECT * FROM product WHERE REPLACE(LOWER(p_name), ' ', '') LIKE REPLACE(LOWER('%'||#{pName}||'%'), ' ', '')) sorted_product) rownum_product WHERE idx >= #{start} AND idx <= #{last}")
	List<Product> selectProductBySearchKeyword(Map param) throws Exception;
	

	//상품전체 리스트 보여주기
	@Select("select * from(select rownum idx,sorted_product.* from(select p_no, p_name, p_price,p_image, p_content,p_category_no from product) sorted_product) rownum_product where idx >= #{start} and idx <= #{last}")
	List<Product> selectProductAll(Map param) throws Exception;
	
	//상품전체 리스트 페이지로 나눠서 보여주기 (시작번호, 끝번호)
	@Select("select * from(select rownum idx,sorted_product.* from(select p_no, p_name, p_price,p_image, p_content,p_category_no from product) sorted_product) rownum_product where idx >= #{start} and idx <= #{last}")
	List<Product> selectProductAllByPage(Map param) throws Exception;
	
	
	//카테고리별 상품리스트 페이지로 나눠서 보여주기 (카테고리번호, 시작번호, 끝번호)
	@Select("select * from(select rownum idx,sorted_product.* from(select * from product where p_category_no=#{p_category_no}) sorted_product) rownum_product where idx >= #{start} and idx <= #{last}")
	List<Product> selectProductAllByCategoryAndPage(@Param("p_category_no")int pCategoryNo, @Param("start") int pageBegin, @Param("last")int pageEnd) throws Exception;
	
	
	//@Select("select p_no,p_name,p_price,p_image,p_content,p_category_no from product where p_category_no = #{pCategoryNo}")
	@Select("select * from(select rownum idx,sorted_product.* from(select p_no, p_name, p_price,p_image, p_content,p_category_no from product  where p_category_no=#{pCategoryNo}) sorted_product) rownum_product where idx >= #{start} and idx <= #{last}")
	//카테고리별 상품전체 리스트 보여주기
	List<Product> selectProductAllByCategory(Map param) throws Exception;
	
	
	@Select("select p_no,p_name,p_price,p_image,p_content,p_category_no from product where p_name like '%'||#{p_name}||'%'")
	//상품 이름으로 검색해서 상품리스트 보여주기
	List<Product> selectProductByProductName(@Param("p_name") String pName) throws Exception;
	
	
	@Select("SELECT * FROM (SELECT ROWNUM idx, sorted_product.* FROM (SELECT * FROM product WHERE REPLACE(LOWER(p_name), ' ', '') LIKE REPLACE(LOWER('%'||#{p_name}||'%'), ' ', '')) sorted_product) rownum_product WHERE idx >= #{start} AND idx <= #{last}")
	//상품 이름으로 검색한 상품리스트 페이지로 나눠서 보여주기
	List<Product> selectProductAllByProductNameAndPage(@Param("p_name") Product searchProduct, @Param("start") int start, @Param("last") int last) throws Exception;
	
	//상품 갯수를 조회, 반환
	@Select("select count(*) from product")
	int getProductCount() throws Exception;
	
	
	//카테고리별 상품 갯수를 조회, 반환
	@Select("select count(*) from product where p_category_no=#{pCategoryNo}")
	int getProductCountCategory(int pCategoryNo) throws Exception;
	
	//검색한 상품 갯수를 조회, 반환
	@Select("select count(*) from product WHERE REPLACE(LOWER(p_name), ' ', '') LIKE REPLACE(LOWER('%'||#{pName}||'%'), ' ', '')")
	int getProductCountName(Product searchProduct) throws Exception; 
	
	
	@Select("select p_no, p_name, p_price, p_image, p_content, p_category_no from product where p_no = #{p_no}")
	//한개의 상품 상세보기
	Product selectByPNo(int pNo) throws Exception;

	

}