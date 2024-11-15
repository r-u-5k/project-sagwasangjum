package com.itwill.shop.member;

public interface MemberDao {

	/*
	 * 사용자관리테이블에 새로운사용자생성
	 */

	int insert(Member member) throws Exception;

	/*
	 * 기존의 사용자정보를 수정
	 */
	int update(Member member) throws Exception;

	/*
	 * 사용자아이디에해당하는 사용자를 삭제
	 */
	int delete(String mId) throws Exception;

	/*
	 * 사용자아이디에해당하는 정보를 데이타베이스에서 찾아서 User 도메인클래스에 저장하여 반환
	 */
	Member findMember(String mId) throws Exception;

	/*
	 * 사용자 ID, PW 찾기
	 */
	Member findId(String mName, String mPhone) throws Exception;

	Member findPw(String mId, String mName) throws Exception;

	/*
	 * 인자로 전달되는 아이디를 가지는 사용자가 존재하는지의 여부를판별
	 */
	int countByM_Id(String mId) throws Exception;

	int countByM_Name(String mName) throws Exception;

}