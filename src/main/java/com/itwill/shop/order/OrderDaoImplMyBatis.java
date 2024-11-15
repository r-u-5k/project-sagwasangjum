package com.itwill.shop.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.OrderMapper;

public class OrderDaoImplMyBatis {
	private SqlSessionFactory sqlSessionFactory;

	public OrderDaoImplMyBatis() throws Exception {
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));

	}

	/*
	 * 주문생성
	 */
	public int insert(Order order) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int rowCount = orderMapper.insert(order);
		List<OrderItem> orderItemList = order.getOrderItemList();
		for (OrderItem orderItem : orderItemList) {
			orderItem.setOrderNo(order.getOrderNo());
			orderMapper.insertOrderItem(orderItem);
		}
		sqlSession.close();
		return rowCount;
	}

	/*
	 * 주문1개보기(주문상세리스트)
	 */
	public Order findOrderByOrderNo(int orderNO) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		Order order = orderMapper.findOrderByOrderNo(orderNO);
		sqlSession.close();
		return order;
	}

	/*
	 * 주문+주문아이템 전체(특정사용자)
	 */
	public List<Order> findOrderListByMemberId(String sMemberId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.findOrderListByMemberId(sMemberId);
		sqlSession.close();
		return orderList;
	}

	/*
	 * 주문전체삭제(ON DELETE CASCADE)
	 */
	public int deleteByMemberId(String sMemberId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int rowCount = orderMapper.deleteByMemberId(sMemberId);
		sqlSession.close();
		return rowCount;
	}

	/*
	 * 주문1건삭제(ON DELETE CASCADE)
	 */
	public int deleteByOrderNO(int orderNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int rowCount = orderMapper.deleteByOrderNO(orderNo);
		sqlSession.close();
		return rowCount;
	}

	public int getOrderCount(String sMemberId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int totCount = orderMapper.getOrderCount(sMemberId);
		sqlSession.close();
		return totCount;

	}
	/**
	 * 게시물 리스트를 반환(게시물시작번호,게시물끝번호)
	 *//*
		@Override
		public List<Board> findBoardList(int start, int last) throws Exception {
		System.out.println("" + start + " ~ " + last);
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		BoardMapper boardMapper=sqlSession.getMapper(BoardMapper.class);
		Map param=new HashMap();
		param.put("start", start);
		param.put("last", last);
		List<Board> boardList= boardMapper.findBoardList(param);
		sqlSession.close();
		return boardList;
		}*/
	public List<Order> findOrderList(int start, int last, String sMemberId) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		Map param = new HashMap();
		param.put("start", start);
		param.put("last", last);
		param.put("sMemberId", sMemberId);
		List<Order> orderList = orderMapper.findOrderList(param);
		sqlSession.close();
		return orderList;
	}

}
