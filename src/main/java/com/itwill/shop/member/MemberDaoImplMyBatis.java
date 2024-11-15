package com.itwill.shop.member;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.MemberMapper;

public class MemberDaoImplMyBatis implements MemberDao {

	private SqlSessionFactory sqlSessionFactory;

	public MemberDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	@Override
	public int update(Member member) throws Exception {
		/*System.out.println("#### UserDaoImplMyBatis : update() 호출  ");*/
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int rowCount = memberMapper.update(member);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public Member findMember(String mId) throws Exception {
		/*System.out.println("#### MemberDaoImplMyBatis : findMember() 호출  ");*/
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		Member member = memberMapper.findMember(mId);
		sqlSession.close();
		return member;
	}

	@Override
	public Member findId(String mName, String mPhone) throws Exception {
		/*System.out.println("#### MemberDaoImplMyBatis : findUserList 호출  ");*/
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		Member member = memberMapper.findId(mName, mPhone);
		sqlSession.close();
		return member;
	}

	@Override
	public Member findPw(String mName, String mId) throws Exception {
//		System.out.println("#### MemberDaoImplMyBatis : findUserList 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		Member member = memberMapper.findPw(mName, mId);
		sqlSession.close();
		return member;
	}

	@Override
	public int insert(Member member) throws Exception {
//		System.out.println("#### MemberDaoImplMyBatis : insert() 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int rowCount = memberMapper.insert(member);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int delete(String mId) throws Exception {
//		System.out.println("#### MemberDaoImplMyBatis : delete() 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int rowCount = memberMapper.delete(mId);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int countByM_Id(String mId) throws Exception {
//		System.out.println("#### MemberDaoImplMyBatis : countByMemberId 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int rowCount = memberMapper.countByM_Id(mId);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int countByM_Name(String mName) throws Exception {
//		System.out.println("#### MemberDaoImplMyBatis : countByMemberId 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int rowCount = memberMapper.countByM_Id(mName);
		sqlSession.close();
		return rowCount;
	}

}