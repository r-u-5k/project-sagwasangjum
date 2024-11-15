package com.itwill.shop.board;

import java.sql.SQLException;

import java.util.List;

public interface BoardDao {

	// insert

	int create(Board board) throws Exception;

	// 답글 insert

	int createReply(Board board) throws Exception;

	// 게시물 리스트 시작번호 와 끝번호로 반환

	List<Board> findBoardList(int start, int last) throws Exception;

	// 답변 게시물 존재여부

	boolean countReplay(Board board) throws SQLException;

	// delete All

	int removeAll(int bGroupNo) throws Exception;

	// delete findbyNo
	int removeFindByNo(int bNo) throws Exception;
	
	// update

	int update(Board board) throws Exception;

	// 게시물 번호로 게시물 찾기

	Board findBoardNo(int bNo) throws Exception;

	// 게시물 조회수 1씩 증가

	void increaseReadCount(int bNo) throws Exception;

	// 게시물 총 건수

	int getBoardCount() throws Exception;

}
