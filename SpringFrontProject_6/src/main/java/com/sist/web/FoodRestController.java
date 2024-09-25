package com.sist.web;

import java.util.*;
import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FoodRestController {
	//DAO 
	@Autowired
	private FoodDAO dao;
	
	@GetMapping(value="food/list_vue.do", produces="text/plain;charset=UTF-8")
	//JSON : 데이터를 모아서 자바스크립트로 전송
	
	public String food_list(int page, String type) throws Exception{
		int rowSize=20;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		//#{type} -> map.get("type")
		
		List<FoodVO> list=dao.foodTypeListData(map);
		int totalpage=dao.foodTypeTotalPage(type);
		
		map=new HashMap();
		map.put("list", list);		//==model.addAttrubute
		
		//Vue에서 처리
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("type", type);
		
		//JSON으로 변경
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);
		
		return json;
	}
	
	@GetMapping(value="food/detail_vue.do", produces="text/plain;charset=UTF-8")
	public String food_detail(int fno, int page) throws Exception{
		FoodVO vo=dao.foodDetailData(fno);
		   // 서울 은평구 대조동 
		   String addr1=vo.getAddress();
		   addr1=addr1.substring(addr1.indexOf(" ")+1);
		   String addr2=addr1.trim();
		   addr2=addr2.substring(0,addr2.indexOf(" "));
			/*
			 * String addr3=addr2.trim(); 
			 * addr3=addr3.substring(0,addr3.indexOf(" "));
			 */
		   System.out.println("address:"+addr2.trim());
		   List<FoodVO> list=dao.foodRearHouseData(addr2);
		   ObjectMapper mapper=new ObjectMapper();
		   Map map=new HashMap();
		   map.put("vo", vo);
		   map.put("page", page);
		   map.put("address", vo.getAddress());
		   map.put("fno", fno);
		   map.put("list", list);
		   String json=mapper.writeValueAsString(map);
		   return json;
	}
}
