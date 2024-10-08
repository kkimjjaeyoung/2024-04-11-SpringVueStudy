package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class FoodDAO {
	@Autowired
	private FoodMapper mapper;
	
	public List<FoodVO> foodHitTop5(){
		return mapper.foodHitTop5(); 
	}
	
	public List<FoodVO> foodListData(int start, int end){
		return mapper.foodListData(start, end);
	}
	
	public int foodTotalPage() {
		return mapper.foodTotalPage();
	}
	
	public FoodVO foodDetailData(int fno) {
		mapper.hitIncrement(fno);
		return mapper.foodDetailData(fno);
	}
	
	public FoodVO foodInfoData(int fno) {
		return mapper.foodDetailData(fno);
	}
	
	public List<FoodVO> foodFindListData(Map map)
	  {
		  return mapper.foodFindListData(map);
	  }
	  public int foodFindTotalPage(Map map)
	  {
		  return mapper.foodFindTotalPage(map);
	  }
	
	public List<FoodVO> foodTypeListData(String type){
			return mapper.foodTypeListData(type);
	}
	  
}
