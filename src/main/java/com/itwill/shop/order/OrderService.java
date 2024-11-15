package com.itwill.shop.order;

import java.util.List;

import com.itwill.shop.cart.CartDao;
import com.itwill.shop.cart.CartDaoImplMyBatis;
import com.itwill.shop.product.ProductDao;
import com.itwill.shop.product.ProductDaoImplMyBatis;

public class OrderService {

	OrderDaoImplMyBatis orderDao;
	ProductDao productDao;
	CartDao cartDao;

	public OrderService() throws Exception {
		orderDao = new OrderDaoImplMyBatis();
		productDao = new ProductDaoImplMyBatis();
		cartDao = new CartDaoImplMyBatis();
	}

	/*
	 * 세션객체를 사용한 선택주문,상품에서 직접주문
	 */
	public int create(Order order, String[] cartItemNoStrArray) throws Exception {
		int rowCount = orderDao.insert(order);
		if (cartItemNoStrArray != null) {
			for (int i = 0; i < cartItemNoStrArray.length; i++) {
				cartDao.deleteByCartNo(Integer.parseInt(cartItemNoStrArray[i]));
			}
		}
		return rowCount;
	}

	/*
	 * 세션객체를 사용한 장바구니전체주문
	 */
	public int create(Order order) throws Exception {
		int rowCount = orderDao.insert(order);
		cartDao.deleteByMemberId(order.getmId());
		return rowCount;
	}

	/*
	 * 주문1개삭제
	 */
	public int deleteByOrderNo(int orderNo) throws Exception {
		return orderDao.deleteByOrderNO(orderNo);
	}

	/*
	 * 주문전체삭제
	 */
	public int delete(String sMemberId) throws Exception {
		return orderDao.deleteByMemberId(sMemberId);
	}

	/*
	 * 주문+주문아이템 목록
	 */
	public List<Order> orderList(String sMemberId) throws Exception {
		return orderDao.findOrderListByMemberId(sMemberId);
	}

	/*
	 * 주문+주문아이템 상세보기
	 */
	public Order orderDetail(int orderNo) throws Exception {
		return orderDao.findOrderByOrderNo(orderNo);
		
	}

	/*
	public BoardListPageMakerDto findBoardList(int currentPage) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = boardDao.getBoardCount();
		//2.paging계산(PageMaker 유틸클래스)
		PageMaker pageMaker=new PageMaker(totalRecordCount,currentPage);
	
		//3.게시물데이타 얻기
		List<Board> boardList=
				boardDao.findBoardList(pageMaker.getPageBegin(),
											pageMaker.getPageEnd());
		
		BoardListPageMakerDto pageMakerBoardList=new BoardListPageMakerDto();
		pageMakerBoardList.itemList=boardList;
		pageMakerBoardList.pageMaker=pageMaker;
		return pageMakerBoardList;
	}*/
	public OrderListPageMakerDto findOrderList(int currentPage, String sMemberId) throws Exception{
		int totalRecordCount = orderDao.getOrderCount(sMemberId);
		OrderPageMaker orderPageMaker = new OrderPageMaker(totalRecordCount, currentPage);
		List<Order> orderList= orderDao.findOrderList(orderPageMaker.getPageBegin(),orderPageMaker.getPageEnd(),sMemberId);
		
		OrderListPageMakerDto orderListPageMakerDto = new OrderListPageMakerDto();
		orderListPageMakerDto.itemList=orderList;
		orderListPageMakerDto.orderPageMaker=orderPageMaker;
		return orderListPageMakerDto;
		
	}
	
	
	
}
