package com.sist.web;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FoodController {
	@GetMapping("food/list.do")
	public String food_list() {
	return "food/list";
	}
	
	@GetMapping("food/detail_before.do")
	public String food_detail_before(int fno, HttpServletRequest request, HttpServletResponse response, Redirect ) {
		Cookie cookie=new Cookie("food_"+fno, String.valueOf(fno));
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		
		ra.addAttrubute()
	}
}
