package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class BoardDAO {
	//스프링으로부터 구현된 mapper의 주소 대입
	@Autowired		//주소값 자동주입(객체만 적용 가능)
	/*
	 * @autowired
	 * 	1. 멤버변수
	 * 	2. 생성자
	 * 	3. setXxx()
	 * 어노테이션은 밑에 있는 변수/메소드/생성자 적용
	 */
	private BoardMapper mapper;

	public List<BoardVO> boardListData(int start, int end){
		return mapper.boardListData(start, end);
	}
	
	public int boardTotalPage() {
		return mapper.boardTotalPage();
	}
	
	//글쓰기
	public void boardInsert(BoardVO vo) {
		mapper.boardInsert(vo);
	}
}
