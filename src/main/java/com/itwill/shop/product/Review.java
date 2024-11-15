package com.itwill.shop.product;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Review {

	private int rNo;
	private String rContent;
	private Date rDate;
	private String rStar;

	/******* FK ******/
	private int pNo;
	private String mId;

}
