package com.itwill.shop.board;



import java.util.ArrayList;
import java.util.Date;

import com.itwill.shop.member.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Board {
	
	private int bNo;
	private String bTitle;
	private String bWriter;
	private String bContent;
	private Date bDate;
	private int bReadCount;
	//글의 논리적인 순서번호를 관리하기 위한 필드 (3개)
	private int bGroupNo;
	private int bStep;
	private int bDepth;
	private String mId;
	private Member member;
	
	@Override
	public String toString() {
		return "Board [boardNo=" + bNo + ", title=" + bTitle + ", writer=" + bWriter + ", content=" + bContent
				+ ", Date=" + bDate + ", readCount=" + bReadCount + ", groupNo=" + bGroupNo + ", step=" + bStep
				+ ", depth=" + bDepth + "]\n";
	}
	
}
