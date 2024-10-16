package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ReserveMapper;
import com.sist.vo.*;

@Repository
public class ReserveDAO {
	@Autowired
	private ReserveMapper mapper;
	
	public List<FoodVO> reserveFoodInfoData(Map map){
		return mapper.reserveFoodInfoData(map);
	}
	
	public int reserveFoodTotalPage(Map map) {
		return mapper.reserveFoodTotalPage(map);
	}
	
	public void reserveInsert(ReserveVO vo)
	   {
		   mapper.reserveInsert(vo);
	   }
	   public List<ReserveVO> reserveMyPageListData(String id)
	   {
		   return mapper.reserveMyPageListData(id);
	   }
	   
	   
	   	
	public ReserveVO reserveInfoData(int rno) {
		return mapper.reserveInfoData(rno);
	}
}
