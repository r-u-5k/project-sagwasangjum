package com.itwill.shop.order;
/*
이름     널?       유형         
------ -------- ---------- 
OI_NO  NOT NULL NUMBER(10) 
OI_QTY          NUMBER(10) 
O_NO            NUMBER(10) 
P_NO            NUMBER(10) 
 */

import com.itwill.shop.product.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class OrderItem {
	private int oiNo;
	private int oiQty;
	/********FK********/
	private int orderNo;
	/*******FK*******/
	private Product product;
	
	
	
}
