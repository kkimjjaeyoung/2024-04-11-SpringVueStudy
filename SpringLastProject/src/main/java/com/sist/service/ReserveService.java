package com.sist.service;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface ReserveService {
	public List<FoodVO> reserveFoodInfoData(Map map);

	public int reserveFoodTotalPage(Map map);
	
	public void reserveInsert(ReserveVO vo);
	public List<ReserveVO> reserveMyPageListData(String id);
	
	
	public ReserveVO reserveInfoData(int rno);
}
