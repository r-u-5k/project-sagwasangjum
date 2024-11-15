package com.itwill.shop.product;

import org.apache.ibatis.annotations.Select;

public class ProductSQL {
	
	public final static String INSERT_PRODUCT=
			"insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,?,?,?,?,?)";
	
	public final static String INSERT_PRODUCT_CATEGORY=
			"insert into product_category(p_category_no,p_category_name) values(?,?)";
	
	
	
	
	public final static String SELECT_PRODUCT_ALL_LIST=
			"select p_no,p_name,p_price,p_image,p_content,p_category_no from product";
	public final static String SELECT_PRODUCT_ALL_LIST_SEARCHTYPE="";
	
	
	
	
	public final static String SELECT_PRODUCT_ALL_LIST_BY_PAGE=
			
			"select * from(\r\n"
			+ "	 			select rownum idx,\r\n"
			+ "	 					   sorted_product.* from(\r\n"
			+ "	 					   						select p_no, p_name, \r\n"
			+ "	 											       p_price,p_image, \r\n"
			+ "	 												   p_content,p_category_no \r\n"
			+ "	 					  						 	   from product \r\n"
			+ "	 					  					  ) sorted_product\r\n"
			+ "	 			 ) rownum_product\r\n"
			+ "	 where idx >= ? and idx <= ?";
	
	
	public final static String SELECT_PRODUCT_ALL_LIST_BY_PAGE_CATEGORY=
			
			"select * from(\r\n"
					+ "	 			select rownum idx,\r\n"
					+ "	 					   sorted_product.* from(\r\n"
					+ "	 					   						select *"
					+ "	 					  						 	   from product where p_category_no=?\r\n"
					+ "	 					  					  ) sorted_product\r\n"
					+ "	 			 ) rownum_product\r\n"
					+ "	 where idx >= ? and idx <= ?";
					
	public final static String SELECT_PRODUCT_ALL_LIST_BY_PAGE_NAME=
	"select * from(select rownum idx,sorted_product.* from(select * from product WHERE REPLACE(LOWER(p_name), ' ', '') LIKE REPLACE(LOWER('%'||?||'%'), ' ', '') sorted_product) rownum_product where idx >= ? and idx <= ?";
	
	/*
	public final static String SELECT_PRODUCT_ALL_LIST_BY_CATEGORY=
			"select p_no,p_name,p_price,p_image,p_content,p_category_no from product where p_category_no = ?";
	*/
	/*
	public final static String SELECT_PRODUCT_LIST_BY_PRODUCT_NAME=
			"select p_no,p_name,p_price,p_image,p_content,p_category_no from product where p_name like '%'||?||'%'"; 
			*/
	/*
	public final static String SELECT_PRODUCT_LIST_BY_PRODUCT_NAME=
			"select p_no,p_name,p_price,p_image,p_content,p_category_no from product WHERE REPLACE(LOWER(p_name), ' ', '') LIKE REPLACE(LOWER('%'||?||'%'), ' ', '')";
	*/
	
	
	public final static String SELECT_PRODUCT_COUNT_RECORD=
			"select count(*) from product";
	
	public final static String SELECT_PRODUCT_COUNT_RECORD_CATEGORY=
			"select count(*) from product where p_category_no=?";
	
	public final static String SELECT_PRODUCT_COUNT_NAME=
			"select count(*) from product WHERE REPLACE(LOWER(p_name), ' ', '') LIKE REPLACE(LOWER('%'||?||'%'), ' ', '')";
	
	
	
	
	
	public final static String SELECT_PRODUCT_DETAIL =
			"select p_no, p_name, p_price, p_image, p_content, p_category_no from product where p_no = ?";
}