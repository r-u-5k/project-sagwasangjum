package com.itwill.shop.board;

import java.util.List;

import com.itwill.shop.board.util.PageMaker;
import com.itwill.shop.member.Member;

public class BoardService {

	private BoardDao boardDao;

	public BoardService() throws Exception {
		boardDao = new BoardDaoImplMyBatis();

	}

	// delete

	public int remove(int bNo) throws Exception, BoardException {
		Board tempBoard = boardDao.findBoardNo(bNo);
		boolean rExist = boardDao.countReplay(tempBoard);
//		System.out.println("답글 존재여부: " + rExist);

		
		 if (boardDao.countReplay(tempBoard)) {
			 
			 return boardDao.removeAll(bNo);
			 
			 // throw new BoardException("답글이 있는 게시글은 관리자만 삭제할 수 있습니다.");
		 
		 } else {
		 
			return boardDao.removeFindByNo(bNo);
			 }

	}

	// insert

	public int create(Board board) throws Exception {
		return boardDao.create(board);
	}

	// reply insert

	public int createReply(Board board) throws Exception {
		return boardDao.createReply(board);
	}

	// 번호로 찾기

	public Board findBoard(int bNo) throws Exception {
		Board board = boardDao.findBoardNo(bNo);
		return board;
	}

	public void updateCount(int bNo) throws Exception {
		boardDao.increaseReadCount(bNo);
	}

	// update

	public int update(Board board) throws Exception {
		return boardDao.update(board);
	}

	// List

	public BoardListPageMakerDto findBoardList(int currentPage) throws Exception {

		// 전체 글의 갯수
		int totalRecordCount = boardDao.getBoardCount();

		// 전체 글의 수에 맞는 페이지 계산 (한 페이지당 10개의 게시글)
		PageMaker pageMaker = new PageMaker(totalRecordCount, currentPage);

		// 게시물 DATA
		List<Board> boardList = boardDao.findBoardList(pageMaker.getPageBegin(), pageMaker.getPageEnd());

		BoardListPageMakerDto pageMakerBoardList = new BoardListPageMakerDto();
		pageMakerBoardList.boardList = boardList;
		pageMakerBoardList.pageMaker = pageMaker;

		return pageMakerBoardList;

	}
	
	
}
