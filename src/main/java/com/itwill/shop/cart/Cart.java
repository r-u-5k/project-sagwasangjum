package com.itwill.shop.cart;

import com.itwill.shop.product.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class Cart {
	private int cNo;
	private int cQty;
	private String mId;
	private Product product;
	
}