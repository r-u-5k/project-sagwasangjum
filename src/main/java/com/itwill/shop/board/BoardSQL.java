package com.itwill.shop.board;

public class BoardSQL {
	
	// insert
	
	public static final String BOARD_INSERT = "insert into board (b_no , b_title , b_writer , b_content , b_date , b_groupNo , b_step , m_id) values (board_sequence.nextval , ? , ? , ? , sysdate , board_sequence.currval , 1,?)";
	
	// reply 전 step 증가
	
	public static final String BOARD_UPDATE_STEP_REPLY = "update board set b_step = b_step + 1 where b_step > ? and b_groupNo = ?";
	
	// reply insert
	
	public static final String BOARD_INSERT_REPLY = "insert into board (b_no , b_title , b_writer , b_content , b_date , b_groupNo , b_step , b_depth) values (board_sequence.nextval, ? , ? , ? , sysdate , ? , ? , ?)";
	
	// 특정 범위의 게시글 리스트
	
	public static final String BOARD_SELECT_LIST_BY_ROWUM_RANGE = "select * from (" + "select rownum idx , s.* from (" + "select b_no , b_title , b_writer , b_date , " + "b_readCount , b_groupNo , b_step , b_depth " + "from board order by b_groupNo desc , b_step asc" + ") s " + " )" + "where idx >= ? and idx <= ?";
	
	// 답변 게시글 존재여부 확인
	
	public static final String BOARD_SELECT_REPLY_COUNT_BY_GROUPNO_DEPTH_STEP = "select count(*) cnt from board where b_groupNo = ? and b_depth >= ? and b_step >= ? order by b_step , b_depth asc";
	
	// delete
	
	public static final String BOARD_DELETE_BY_BOARDNO = "delete board where b_no = ?";
	
	// update 
	
	public static final String BOARD_UPDATE_BY_BOARDNO = "update board set b_title = ? , b_content = ? , b_writer = ? where b_no =?";
	
	// 번호로 찾기
	
	public static final String BOARD_SELECT_BY_BOARDNO = "select b_no , b_title , b_writer , b_content , sysdate , b_readCount , b_groupNo , b_step , b_depth from board where b_no = ? ";
	
	// 조회수 증가
	
	public static final String BOARD_UPDATE_READ_COUNT_BY_BOARDNO = "update board set b_readCount = b_readCount + 1 where b_no = ? ";
	
	// 게시판 전체 글의 수
	
	public static final String BOARD_SELECT_COUNT_TOT_RECORD = "select count(*) from board";
	
	
	
	

}
