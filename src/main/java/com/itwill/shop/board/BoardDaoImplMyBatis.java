package com.itwill.shop.board;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.BoardMapper;

public class BoardDaoImplMyBatis implements BoardDao {

	private SqlSessionFactory sqlSessionFactory;

	public BoardDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	// insert

	@Override
	public int create(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int rowCount = boardMapper.create(board);
		sqlSession.close();

		return rowCount;
	}

	// reply insert

	@Override
	public int createReply(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		Board temp = boardMapper.findBoardNo(board.getBNo());
		boardMapper.updateReplyStep(temp);

		board.setBGroupNo(temp.getBGroupNo());
		board.setBStep(temp.getBStep() + 1);
		board.setBDepth(temp.getBDepth() + 1);

		int rowCount = boardMapper.createReply(board);
		sqlSession.commit();
		sqlSession.close();

		return rowCount;
	}

	// 게시물 시작 ~ 끝번호 반환

	@Override
	public List<Board> findBoardList(int start, int last) throws Exception {
//		System.out.println("" + start + "~" + last);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);

		Map param = new HashMap();
		param.put("start", start);
		param.put("last", last);

		List<Board> boardList = boardMapper.findBoardList(param);
		sqlSession.close();
		return boardList;
	}

	// 답변 게시물 존재 여부

	@Override
	public boolean countReplay(Board board) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int rowCount = boardMapper.countReplay(board);
//		System.out.println(rowCount);

		Boolean isExist = false;
		if (rowCount > 1) {
			isExist = true;
		}
		sqlSession.close();

		return isExist;
	}

	// deleteAll

	@Override
	public int removeAll(int bGroupNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int rowCount = boardMapper.removeAll(bGroupNo);
		sqlSession.close();
		return rowCount;
	}
	
	// delete find by no
	
	@Override
	public int removeFindByNo(int bNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int rowCount = boardMapper.removeFindByNo(bNo);
		sqlSession.close();
		return rowCount;
	}

	// update

	@Override
	public int update(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int rowCount = boardMapper.update(board);
		sqlSession.close();

		return rowCount;
	}

	// 게시물 번호로 찾기

	@Override
	public Board findBoardNo(int bNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		Board board = boardMapper.findBoardNo(bNo);
//		System.out.println(board);
		sqlSession.close();

		return board;
	}

	// 게시물 조회수 증가

	@Override
	public void increaseReadCount(int bNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.increaseReadCount(bNo);
		sqlSession.close();

	}

	// 게시물 총 건수 조회

	@Override
	public int getBoardCount() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int totCount = boardMapper.getBoardCount();
		sqlSession.close();
		return totCount;
	}

}
