package com.itwill.shop.order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Builder.Default;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor

public class Order {
	private int orderNo;  
	private String orderDesc;
	private Date orderDate;
	private int orderPrice;
	private String orderAddr;
	private String orderName;
	private String orderPhone;
	/*************FK****************/
	private String mId;
	/***********List<OrderItem>****/
	@Default
	private List<OrderItem> orderItemList=new ArrayList<OrderItem>();
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	
	
			
	
}












