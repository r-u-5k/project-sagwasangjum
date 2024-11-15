package com.itwill.shop.order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

// 리스트 페이지 관련 사용자 설정을 위한 DTO(VO)
public class OrderPageInputDto{
	private int rowCountPerPage;   // 테이블(리스트)당 출력 행수
	private int pageCountPerPage;  // 한페이지에 보여지는 페이지 수
	private String selectPage;     // 선택한 현재 페이지 번호
	private String searchType;     // 사용자 선택 검색타입
	private String searchContent;  // 사용자 입력 검색내용
}