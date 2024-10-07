package com.sist.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class MemberDao {
	@Autowired
	private MemberMapper mapper;
	
	public int idCheck(String userId) {
		return mapper.idCheck(userId);
	}
	
	public void memberInsert(MemberVO vo) {
		mapper.memberInsert(vo);
	}
	public void memberAuthorityInsert(String userId){
		mapper.memberAuthorityInsert(userId);
	}
	
	public MemberVO memberInfoData(String userId) {
		return mapper.memberInfoData(userId);
	}
		
	public MemberVO memberSessionData(String userId) {
		return mapper.memberSessionData(userId);
	}
}
