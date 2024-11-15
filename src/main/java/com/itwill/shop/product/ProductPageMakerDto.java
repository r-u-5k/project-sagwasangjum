package com.itwill.shop.product;

import java.util.*;



// 리스트 페이지에서 출력에 필요한 테이블 데이터 및 페이징 처리에 필요한 정보빈
public class ProductPageMakerDto {
	
	public List<Product> itemList; 		// 리스트 데이터 콜렉션
	
	public ProductPageMaker productPageMaker;
	
	public ProductPageMaker getProductPageMaker() {
        return productPageMaker;
    }
	
	public List<Product> getItemList(){
		return itemList;
	}
	
	public List<Product> setItemList(){
		return itemList;
	}
}