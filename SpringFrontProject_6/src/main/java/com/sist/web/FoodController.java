package com.sist.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FoodController {
	@GetMapping("food/list.do")
	public String food_list() {
		return "food/list";
	}
	
	@GetMapping("food/defail.do")
	public String food_detail(int fno, int page, Model model) {
		model.addAttribute("fno", fno);
		model.addAttribute("page", page);
		return "food/detail";
	}
}
