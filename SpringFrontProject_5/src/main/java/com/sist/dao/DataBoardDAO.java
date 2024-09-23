package com.sist.dao;

import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DataBoardDAO {
	@Autowired
	private DataBoardMapper mapper;
	
	public List<DataBoardVO> databoardListData(int start, int end){
		return mapper.boardListData(start, end);
	}
	
	public int databoardTotalPage() {
		return mapper.boardTotalPage();
	}
}
