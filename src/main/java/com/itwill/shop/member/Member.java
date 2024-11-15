package com.itwill.shop.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 *  사용자관리를 위하여 필요한 도메인클래스(VO,DTO)
 *  USERINFO 테이블의 각컬럼에해당하는 멤버를 가지고있다
 */

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Member {
	/*
	 * =================================== 
	 * 이름 		널? 		유형
	 * =================================== 
	 * USERID 	NOT NULL VARCHAR2(100) 
	 * PASSWORD	NOT NULL VARCHAR2(100) 
	 * NAME 	NOT NULL VARCHAR2(200) 
	 * EMAIL 			 VARCHAR2(300)
	 * ===================================
	 */
	private String mId;
	private String mPw;
	private String mName;
	private String mPhone;
	private String mEmail;
	private String mAddress;

//	private String mRegDate;
//	@Override
//	public String toString() {
//		return "User [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mPhone=" + mPhone + ", mEmail=" + mEmail
//				+ ", mAddress=" + mAddress + ",mRegDate=" + mRegDate + "]\n";
//	}

}
