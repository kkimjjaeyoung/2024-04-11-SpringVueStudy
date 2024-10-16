package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface ReserveMapper {
	@Select("SELECT fno,poster,name,num "
			+ "FROM(SELECT fno, poster, name, rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASC(food_house fh_fno_pk)*/fno, poster, name "
			+ "FROM food_house WHERE type LIKE '%'||#{type}||'%')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FoodVO> reserveFoodInfoData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/30.0) "
			+ "FROM food_house "
			+ "WHERE type LIKE '%'||#{type}||'%'")
	public int reserveFoodTotalPage(Map map);
	
	@Insert("INSERT INTO spring_reserve(rno,fno,id,rday,rtime,rinwon) "
			 +"VALUES(sr2_rno_seq.nextval,#{fno},#{id},"
			 +"#{rday},#{rtime},#{rinwon})")
	  public void reserveInsert(ReserveVO vo);
	
	@Results({
		  @Result(property = "fvo.poster" , column = "poster"),
		  @Result(property = "fvo.name",column = "name")
	  })
	  @Select("SELECT rno,sr.fno,poster,name,rday,rtime,rinwon,TO_CHAR(regdate,'YYYY-MM-DD') as dbday, isReserve "
			 +"FROM spring_reserve sr,food_house pf "
			 +"WHERE sr.fno=pf.fno "
			 +"AND id=#{id}"
			 )
	  public List<ReserveVO> reserveMyPageListData(String id);
	
	//adminpage 불러오기
	
	
	//예약정보
	@Results({
		@Result(property="fvo.name",column="name"),
		@Result(property="fvo.poster",column="poster"),
		@Result(property="fvo.type",column="type"),
		@Result(property="fvo.address",column="adress"),
		@Result(property="fvo.phone",column="phone"),
		@Result(property="fvo.score",column="score"),
		@Result(property="fvo.time",column="time"),
		@Result(property="fvo.parking",column="parking"),
		@Result(property="fvo.theme",column="theme"),
		@Result(property="fvo.content",column="content")
	})
	@Select("SELECT rno, rday, rtime, rinwon, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, name, poster, type, address, phone, score, time, parking, theme, content "
			+ "FROM spring_reserve sr, food_house pf "
			+ "WHERE sr.fno=pf.fno "
			+ "AND rno=#{rno}")
	public ReserveVO reserveInfoData(int rno);
}
