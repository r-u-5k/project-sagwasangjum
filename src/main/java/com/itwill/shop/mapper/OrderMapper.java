package com.itwill.shop.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.itwill.shop.order.Order;
import com.itwill.shop.order.OrderItem;

public interface OrderMapper {
	
	/*
	 * 1. 멤버 한사람의 주문전체목록
	 */
	@Select("select * from orders where m_id=#{mId}")
	List<Order> findOrderByMemberId(@Param("mId") String sMemberId);
	
	/*
	 * 주문1개보기(주문상세리스트)
	 */
	@ResultMap("orderResultMap")
	@Select("select * from orders  o join order_item oi on o.order_no=oi.order_no join product p on oi.p_no=p.p_no where o.order_no=#{orderNo}")
	Order findOrderByOrderNo (int orderNo);
	/*
	 * 주문+주문아이템 전체(특정사용자)
	 */
	@ResultMap("orderResultMap")
	@Select("select * from orders  o join order_item oi on o.order_no=oi.order_no join product p on oi.p_no=p.p_no where o.m_id=#{mId}")
	List<Order> findOrderListByMemberId(@Param("mId") String sMemberId);
	/*
	 * 주문생성
	 */
	@SelectKey(before =true,keyProperty = "orderNo",resultType = Integer.class, statement = "select orders_order_no_SEQ.nextval from dual"  )
	@Insert("INSERT INTO orders (order_no, order_date, order_desc, order_price, m_id, order_addr, order_name, order_phone) VALUES (#{orderNo}, sysdate  ,#{orderDesc} , #{orderPrice}, #{mId},#{orderAddr},#{orderName},#{orderPhone})")
	int insert (Order order);
	
	@Insert("INSERT INTO order_item (oi_no, oi_qty, order_no, p_no) VALUES (order_item_oi_no_SEQ.nextval, #{oiQty},#{orderNo}, #{product.pNo} )")
	int insertOrderItem(OrderItem orderItem);
	
	/*
	 * 주문전체삭제(ON DELETE CASCADE)
	 */
	@Delete("delete from orders where m_id=#{mId}")
	int deleteByMemberId(@Param("mId") String sMemberId);
	/*
	 * 주문1건삭제(ON DELETE CASCADE)
	 */
	@Delete("delete from orders where order_no=#{orderNo}")
	int deleteByOrderNO(int orderNo);
	/**
	 * 주문 총 건수를 조회, 반환
	 */
	@Select("select count(*) from orders where m_id=#{sMemberId}")
	int getOrderCount(String sMemberId) throws Exception;
	/**
	 * 주문 리스트를 반환(주문시작번호,주문끝번호)
	 */
	@ResultMap("orderResultMap")
	@Select("SELECT *\r\n"
			+ "FROM (\r\n"
			+ "    SELECT DENSE_RANK() OVER (ORDER BY o.order_no DESC) AS idx, o.*\r\n"
			+ "    FROM (\r\n"
			+ "        SELECT *\r\n"
			+ "        FROM orders\r\n"
			+ "        WHERE m_id = #{sMemberId}\r\n"
			+ "        ORDER BY order_no DESC\r\n"
			+ "    ) o\r\n"
			+ ") indexed_orders\r\n"
			+ "JOIN order_item oi ON indexed_orders.order_no = oi.order_no\r\n"
			+ "JOIN product p ON oi.p_no = p.p_no\r\n"
			+ "WHERE indexed_orders.idx BETWEEN #{start} AND #{last}\r\n"
			+ "ORDER BY indexed_orders.idx ASC")
	List<Order> findOrderList(Map param) throws Exception;
	



}
