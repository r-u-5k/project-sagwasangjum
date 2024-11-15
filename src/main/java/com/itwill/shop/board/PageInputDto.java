package com.itwill.shop.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PageInputDto {

	private int rowCountPerPage; // 테이블(리스트)당 출력 행 수
	private int pageCountPerPage; // 한 페이지에 보여지는 페이지 수
	private String selectPage; // 선택한 현재 페이지 번호
	private String searchType; // 사용자 선택 검색타입
	private String searchContent; // 사용자 입력 검색 내용

}
