package com.sist.service;

import com.sist.vo.MemberVO;

public interface MemberService {
	//아이디 체크
	public int idCheck(String userId);
	
	public void memberInsert(MemberVO vo);
	public void memberAuthorityInsert(String userId);
	public MemberVO memberInfoData(String userId);
	public MemberVO memberSessionData(String userId);
}
