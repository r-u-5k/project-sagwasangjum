package com.itwill.shop.member;

/*
 * - 회원관리 업무(비즈니스로직,예외처리,트랜젝션,보안,로깅)을 수행하는 클래스
 * - 웹컴포넌트(서블릿,JSP)에서 직접접근(메쏘드호출)하는 클래스(객체)
 * - Dao를 이용해서 데이타베이스를 조작작업(CRUD)하는 클래스
 */
public class MemberService {

	private MemberDao memberDao;

	public MemberService() throws Exception {
		memberDao = new MemberDaoImplMyBatis();
	}

	/*
	 * 회원가입
	 */

	public int create(Member member) throws Exception {
		/*
		 * -1:아이디중복
		 *  1:회원가입성공
		 */

		if (memberDao.countByM_Id(member.getMId()) == 1) {
			// 아이디중복
			return -1;
		} else {
			// 아이디안중복
			// 회원가입
			memberDao.insert(member);
			return 1;
		}
	}

	public int login(String mId, String mPw) throws Exception {

		int result = -1;
		// 1.아이디존재여부
		Member member = memberDao.findMember(mId);
		if (member == null) {
			// 아이디존재안함
			result = 0;
		} else {
			// 아이디존재함
			if (member.getMPw().equals(mPw)) {
				// 패쓰워드일치
				result = 2;
			} else {
				// 패쓰워드불일치
				result = 1;
			}
		}
		return result;
	}

	/*
	 * 회원상세보기
	 */
	public Member findMember(String mId) throws Exception {
		return memberDao.findMember(mId);
	}

	/*
	 * 회원수정
	 */
	public int update(Member member) throws Exception {
		return memberDao.update(member);
	}

	/*
	 * 회원탈퇴
	 */
	public int remove(String mId) throws Exception {
		return memberDao.delete(mId);
	}

	public boolean isDuplicateId(String mId) throws Exception {
		int count = memberDao.countByM_Id(mId);
		boolean isExist = false;
		if (count > 0) {
			isExist = true;
		}
		return isExist;
	}

	public boolean isDuplicateName(String mName) throws Exception {
		int count = memberDao.countByM_Name(mName);
		boolean isExist = false;
		if (count > 0) {
			isExist = true;
		}
		return isExist;
	}

	/*
	 * 아이디 찾기
	 */
	public Member findMemberId(String mName, String mPhone) throws Exception {
		Member findId = memberDao.findId(mName, mPhone);
		return findId;
	}

	/*
	 * 비밀번호 찾기 
	 */

	public Member findMemberPw(String mId, String mName) throws Exception {
		Member findPw = memberDao.findPw(mId, mName);
		return findPw;
	}

}
