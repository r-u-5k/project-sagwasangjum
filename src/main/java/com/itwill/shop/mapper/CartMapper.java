package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.cart.Cart;

public interface CartMapper {

	/*
	 * 장바구니에 제품 존재 여부
	 */
	@Select("select count(*) as p_count from cart where m_id = #{mId} and p_no = #{pNo}")
	int countByProductNo(@Param("mId") String sMemberId, @Param("pNo") int pNo) throws Exception;
	
	/*
	 * 장바구니 생성
	 */
	@Insert("insert into cart(c_no, c_qty, p_no, m_id) values(cart_c_no_SEQ.nextval, #{cQty}, #{pNo}, #{mId})")
	int insert(@Param("mId") String sMemberId, @Param("pNo") int pNo, @Param("cQty") int cQty) throws Exception;
	
	/*
	 * 상품 리스트에서 장바구니 추가 시 수량 변경
	 */
	@Update("update cart set c_qty = c_qty + #{cQty} where m_id = #{mId} and p_no = #{pNo}")
	int updateByProductNo(@Param("mId") String sMemberId, @Param("pNo") int pNo, @Param("cQty") int cQty) throws Exception;
	
	/*
	 * 장바구니 화면에서 수량 변경
	 */
	@Update("update cart set c_qty = #{cQty} where c_no = #{cNo}")
	int updateByCartNo(@Param("cNo") int cNo, @Param("cQty") int cQty) throws Exception;
	
	/*
	 * 장바구니 리스트
	 */
	@ResultMap("cartResultMap")
	@Select("select c.*, p.* from cart c join product p on c.p_no = p.p_no where m_id = #{mId}")
	List<Cart> findByMemberId(@Param("mId") String memberId) throws Exception;
	
	/*
	 * PK(c_no)로 장바구니 삭제
	 */
	@Delete("delete from cart where c_no = #{cNo}")
	int deleteByCartNo(@Param("cNo") int cNo) throws Exception;
	
	/*
	 * memberid로 장바구니 삭제
	 */
	@Delete("delete from cart where m_id = #{mId}")
	int deleteByMemberId(@Param("mId") String sMemberId) throws Exception;
	
	/*
	 * 장바구니 번호로 장바구니 검색
	 */
	@ResultMap("cartResultMap")
	@Select("select * from cart c join product p on c.p_no = p.p_no where c_no = #{cNo}")
	Cart findByCartNo(@Param("cNo") int cNo) throws Exception;
	
}