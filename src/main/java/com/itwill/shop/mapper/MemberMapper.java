package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.member.Member;

public interface MemberMapper {

	@Insert("insert into member values(#{mId}, #{mPw}, #{mName}, #{mPhone}, #{mEmail}, #{mAddress}, sysdate)")
	public int insert(Member member);

	@Update("update  member set m_pw=#{mPw}, m_name=#{mName}, m_phone=#{mPhone}, m_email=#{mEmail}, m_address=#{mAddress} where m_id=#{mId}")
	public int update(Member member);

	@Delete("delete member where m_id=#{mId}")
	public int delete(@Param("mId") String mId) throws Exception;

	@Select("select m_id, m_pw, m_name, m_phone, m_email, m_address from member where m_id=#{mId}")
	public Member findMember(String mId) throws Exception;

	@Select("select m_id from member where m_name = #{mName} and m_phone = #{mPhone}")
	public Member findId(@Param("mName") String mName, @Param("mPhone") String mPhone) throws Exception;

	@Select("select m_pw from member where m_id = #{mId} and m_name = #{mName}")
	public Member findPw(@Param("mId") String mId, @Param("mName") String mName) throws Exception;

	@Select("select count(*) cnt from member where m_id=#{mId}")
	public int countByM_Id(@Param("mId") String mId) throws Exception;

	@Select("select * from member where m_id =#{mId} and m_phone = #{mPhone}")
	public List<Member> findByidTF(@Param("mId") String mId, @Param("mPhone") String mPhone) throws Exception;

}