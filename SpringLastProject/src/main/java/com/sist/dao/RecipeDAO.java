package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class RecipeDAO {
	@Autowired
	private RecipeMapper mapper;
	
	public RecipeVO recipeMaxHitData() {
		return mapper.recipeMaxHitData();
	}
	
	public List<RecipeVO> recipeHitTop8(){
		return mapper.recipeHitTop8();
	}
	
	//목록
	public List<RecipeVO> recipeListData(Map map){
		return mapper.recipeListData(map);
	}
	
	public int recipeTotalPage() {
		return mapper.recipeTotalPage();
	}
}
