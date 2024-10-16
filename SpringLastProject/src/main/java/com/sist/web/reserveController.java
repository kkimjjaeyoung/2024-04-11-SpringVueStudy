package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class reserveController {
	
	
	@GetMapping("reserve/reserve_main.do")
	public String reserve_main() {
		return "reserve/reserve_main";
	}
}
