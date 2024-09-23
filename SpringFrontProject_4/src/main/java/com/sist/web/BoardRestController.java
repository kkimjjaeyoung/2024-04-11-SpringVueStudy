//자바스크립트/다른 언어로 데이터 전송(화면제어 불가)
package com.sist.web;

import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BoardRestController {
	@Autowired
	private BoardDAO dao;
	
	@GetMapping(value="board/list_vue.do", produces="text/plain;charset=UTF-8")
	public String board_list(int page) throws Exception {
		int rowSize=10;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		
		List<BoardVO> list=dao.boardListData(start, end);
		int count=dao.boardTotalPage();
		int totalpage=(int)(Math.ceil(count/10.0));
		count=count-((rowSize*page)-rowSize);
		
		//화면출력
		Map map=new HashMap();
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("count", count);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);
		
		return json;
	}
	
	@PostMapping(value="board/insert_vue.do", produces="text/plain;charset=UTF-8")
	public String board_insert(BoardVO vo) {
		String result="yes";
		try {
			result="yes";
			dao.boardInsert(vo);
		}catch (Exception ex) {
			result="no";
		}
		
		return result;
	}
}
