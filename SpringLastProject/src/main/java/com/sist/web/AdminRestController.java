package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.ReserveService;

@RestController
public class AdminRestController{
	@Autowired
	private ReserveService rService;
	
	
}
