package com.itwill.shop.board;

public class BoardException extends Exception {

	public BoardException() {

		this("게시판 관련 에러 발생입니다.");
	}

	public BoardException(String errorMsg) {
		super(errorMsg);
	}

	public BoardException(String errorMsg, Throwable cause) {
		super(errorMsg, cause);
	}

}
