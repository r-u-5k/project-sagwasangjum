package com.itwill.shop.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.board.Board;

public interface BoardMapper {

	// insert

	@Insert("insert into board (b_no,b_title,b_writer,b_content,b_date,b_groupNo,b_step,m_id) values (board_sequence.nextval , #{bTitle},#{bWriter},#{bContent},sysdate,board_sequence.currval,1,#{mId})")
	int create(Board board) throws Exception;

	// 답글 전 step 증가 메쏘드
	@Update("update board set b_step = b_step + 1 where b_step > #{bStep} and b_groupNo = #{bGroupNo}")
	int updateReplyStep(Board temp) throws Exception;

	// 답글 insert

	@Insert("insert into board(b_no, b_title, b_writer, b_content, b_date, b_groupNo, b_step, b_depth,m_id) values(board_sequence.nextval, #{bTitle}, #{bWriter}, #{bContent},sysdate,#{bGroupNo}, #{bStep}, #{bDepth},#{mId})")
	int createReply(Board board) throws Exception;

	// 게시글 리스트를 시작번호와 끝번호 범위에서 반환
	@Select("select * from ( select rownum idx, s.* from( "
			+ "select b_no, b_title, b_writer, b_content , b_date,b_readcount,b_groupNo, b_step, b_depth "
			+ "from board order by b_groupNo desc, b_step asc" + ") s" + ")"
			+ "where idx >= #{start} and idx <= #{last}")
	List<Board> findBoardList(Map param) throws Exception;

	// 답변 게시글 존재 여부 확인
	@Select("select count(*) cnt from board where b_groupNo = #{bGroupNo} and b_depth >= #{bDepth} and b_step >=#{bStep} order by b_step,b_depth asc")
	int countReplay(Board board) throws SQLException;

	// delete 리플까지
	@Delete("delete board where b_groupNo = #{bGroupNo} ")
	int removeAll(@Param("bGroupNo") int bGroupNo) throws Exception;

	//delete 1개
	@Delete("delete board where b_no = #{bNo} ")
	int removeFindByNo(int bNo) throws Exception;
	
	// update
	@Update("update board  set b_title = #{bTitle}, b_content =  #{bContent},b_writer =  #{bWriter} where b_no = #{bNo}")
	int update(Board board) throws Exception;

	// 번호로 게시물 찾기
	@Select("select b_no, b_title, b_writer, b_content,b_date, b_readCount,b_groupNo, b_step, b_depth,m_id from board where b_no = #{bNo}")
	Board findBoardNo(int bNo) throws Exception;

	// 게시물 조회수 1씩 증가
	@Update("update board set b_readCount = b_readCount + 1 where b_no = #{bNo}")
	void increaseReadCount(int bNo) throws Exception;

	// 게시물 총 건수 조회
	@Select("select count(*) from board")
	int getBoardCount() throws Exception;

}
