package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class FoodDAO {
	@Autowired
	private FoodMapper mapper;
	
	public List<FoodVO> foodTypeListData(Map map){
		return mapper.foodTypeListData(map);
	}
	
	public int foodTypeTotalPage(String type) {
		return mapper.foodTypeTotalPage(type);
	}
	
	//상세보기
	public FoodVO foodDetailData(int fno) {
		mapper.hitIncrement(fno);;
		return mapper.foodDetailData(fno);
	}
	
	public List<FoodVO> foodRearHouseData(String address)
	   {
		   return mapper.foodRearHouseData(address);
	   }
}
