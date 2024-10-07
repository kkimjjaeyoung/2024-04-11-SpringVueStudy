package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;

public interface MemberMapper {
	@Select("SELECT COUNT(*) FROM spring_member "
			+ "WHERE userId=#{userId}")
	public int idCheck(String userId);
	
	@Insert("INSERT INTO spring_member(userId,userName,userPwd,enabled,sex,birthday,email,post,addr1,addr2,phone,content) "
			+"VALUES(#{userId},#{userName},#{userPwd},1,#{sex},#{birthday},#{email},#{post},#{addr1},#{addr2},#{phone},#{content})")
	public void memberInsert(MemberVO vo);
	  
	// role_admin / role_user
	@Insert("INSERT INTO authority VALUES(#{userId},'ROLE_USER') ")
	public void memberAuthorityInsert(String userId);
	  
	//로그인 처리
	//ID여부 확인(idcheck)
	
	//비밀번호 검사
	@Select("SELECT userId,userName,userPwd,enabled, authority "
			+ "FROM psring_member sm, authority au "
			+ "WHERE pm.userId=au.userId "
			+ "AND pm.userId=#{userId}")
	public MemberVO memberInfoData(String userId);
	
	@Select("SELECT userId,userName,userPwd, sex, email "
			+ "FROM psring_member "
			+ "WHERE userId=#{userId}")
	public MemberVO memberSessionData(String userId);
	
	
}
