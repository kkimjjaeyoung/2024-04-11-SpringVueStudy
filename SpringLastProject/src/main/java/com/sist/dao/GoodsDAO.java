package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class GoodsDAO {
	@Autowired
	private GoodsMapper mapper;
	
	public List<GoodsVO> goodsListData(Map map){
		return mapper.goodsListData(map); 
	}
	
	public int goodsTotalPage() {
		return mapper.goodsTotalPage();
	}
	
	public void hitIncrement(int no) {
		mapper.hitIncrement(no);
	}
	
	public GoodsVO goodsDetailData(int no) {
		return mapper.goodsDetailData(no);
	}
	
	public MemberVO memberInfoData(String userId) {
		return mapper.memberInfoData(userId);
	}
	
	public void goodsCartInsert(CartVO vo)
	  {
		  mapper.goodsCartInsert(vo);
	  }
	  /*
	   *   @Update("UPDATE spring_cart SET "
			  +"account=account+#{account} "
			  +"WHERE cno=#{cno}")
	       public void goodsCartAccountUpdate(CartVO vo);
	   */
	  public void goodsCartAccountUpdate(CartVO vo)
	  {
		  mapper.goodsCartAccountUpdate(vo);
	  }
	  /*
	   *   @Select("SELECT COUNT(*) FROM spring_cart "
			  +"WHERE gno=#{gno}")
	       public int goodsCartGnoCount(int gno);
	   */
	  public int goodsCartGnoCount(int gno)
	  {
		  return mapper.goodsCartGnoCount(gno);
	  }
	  /*
	   *   @Results({
		   @Result(property = "gvo.goods_name",column = "goods_name"),
		   @Result(property = "gvo.goods_poster",column = "goods_poster"),
		   @Result(property = "gvo.goods_price",column = "goods_price")
	   })
	   @Select("SELECT cno,gno,account,isBuy,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,"
			  +"goods_name,goods_poster,goods_price "
			  +"FROM spring_cart sc,goods_all ga "
			  +"WHERE sc.gno=ga.no "
			  +"AND id=#{id}")
	   public List<CartVO> goodsCartListData(String id);
	   */
	  public List<CartVO> goodsCartListData(String id){
		  return mapper.goodsCartListData(id);
	  }
	  
	  public void goodsCartCancel(int cno) {
		  mapper.goodsCartCancel(cno);;
	  }
	  
	  public void goodsBuy(int cno) {
		  mapper.goodsBuy(cno);
	  }
	   
	  public List<CartVO> goodsBuyListData(String id){
		  return mapper.goodsBuyListData(id);
	  }
}
