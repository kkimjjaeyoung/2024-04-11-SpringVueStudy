/*
 * SELECT : 데이터 검색
 * 	1. 컬럼 대신 사용 SELECT~ : 스칼라 서브쿼리
 * 	2. 테이블 대신 사용 FROM(SELECT~) : 인라인뷰(페이징)
 * 	3. 조건문에서 처리 가능 WHERE 컬럼명(SELECT~) : 서브쿼리
 */
package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface BoardMapper {
	@Select("SELECT no, subject, name,To_CHAR(regdate, 'yyyy-mm-dd') as dbday, hit,num "
			+ "FROM (SELECT no,subject, name,regdate,hit,rownum as num "
			+ "FROM (SELECT no, subject, name, regdate, hit "
			+ "FROM vue_board ORDER BY no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardListData(@Param("start")int start, @Param("end") int end);

	@Select("SELECT COUNT(*) FROM vue_board")
	public int boardTotalPage();
	
	
	//글쓰기
	@Insert("INSERT INTO vue_board(no,name,subject,content,pwd"
			+ "VALUES(vb_no_seq.nextval,#{name},#{subject},#{content},#{pwd})")
	public void boardInsert(BoardVO vo);
}
