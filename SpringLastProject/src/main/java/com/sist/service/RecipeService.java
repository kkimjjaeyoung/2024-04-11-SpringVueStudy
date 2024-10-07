package com.sist.service;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

//recipe 관련 기능 관리(결합성/의존성 낮은 프로그램)
//수정시 다른 클래스에 영향없게 만드는 프로그램(개발자 독립적 개발, 유지보수)
public interface RecipeService {

	public RecipeVO recipeMaxHitData();
	
	public List<RecipeVO> recipeHitTop8();
	
	public ChefVO chefToday();
	
	public List<RecipeVO> recipeListData(Map map);

	public int recipeTotalPage();
	
	public RecipeDetailVO recipeDetailData(int no);
}
