package com.itwill.shop.product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
VO(Value Object),DTO(Data Transfer Object)
	- product 테이블 1개 row의 데이타의 값을 가지는객체
	- product 테이블 1개 row의 데이타값을 이동(파라메타,리턴데이타)시키기위한객체 
	- product 테이블의 컬럼과 동일한수의 멤버변수를가지는객체
*/

/*
이름            널?       유형            
------------- -------- ------------- 
P_NO          NOT NULL NUMBER(10)    
P_NAME                 VARCHAR2(50)  
P_PRICE                NUMBER(10)    
P_IMAGE                VARCHAR2(100)  
P_CATEGORY_NO          NUMBER(10) 
P_CONTENT              VARCHAR2(500) 
*/

@Builder
@NoArgsConstructor
@AllArgsConstructor


public class Product {
	private Integer pNo;
	private String pName;
	private int pPrice;
	private String pImage;
	private Integer pCategoryNo;
	private String pContent;
	public Integer getPNo() {
		return pNo;
	}
	public void setPNo(Integer pNo) {
		this.pNo = pNo;
	}
	public String getPName() {
		return pName;
	}
	public void setPName(String pName) {
		this.pName = pName;
	}
	public int getPPrice() {
		return pPrice;
	}
	public void setPPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getPImage() {
		return pImage;
	}
	public void setPImage(String pImage) {
		this.pImage = pImage;
	}
	public Integer getPCategoryNo() {
		return pCategoryNo;
	}
	public void setPCategoryNo(Integer pCategoryNo) {
		this.pCategoryNo = pCategoryNo;
	}
	public String getPContent() {
		return pContent;
	}
	public void setPContent(String pContent) {
		this.pContent = pContent;
	}
	
	
	
}