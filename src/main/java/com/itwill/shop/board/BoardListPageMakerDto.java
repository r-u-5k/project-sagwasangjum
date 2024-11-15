package com.itwill.shop.board;

import java.util.List;

import com.itwill.shop.board.util.PageMaker;

// 리스트 페이지에서 출력에 필요한 테이블 데이터 및 페이징처리에 필요한 정보
public class BoardListPageMakerDto {

	public List<Board> boardList; // 보드 데이터 컬렉션
	public PageMaker pageMaker;

}
