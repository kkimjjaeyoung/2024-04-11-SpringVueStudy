package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.FoodService;
import com.sist.service.RecipeService;
import java.util.*;
import com.sist.vo.*;
/*
 * 스프링
 * 	DI : 클래스를 관리하는 영역
 * 		객체생성, 객체소멸(객체의 생명주기 관리)
 * 		객체생성시 멤버변수의 초기화 필요시 사용
 * 			1)클래스 한개 : Component
 * 			2) 클래스 여러개 : Container
 * 			스프링은 컨테인다(클래스로 제작됨:경량컨테이너)
 * 		변수의 초기화
 * 			setterDI = p:name, setName()
 * 			생성자 DI = c:
 * 	AOP : 공통모듈(실행시마다 호출해야하는 기능이 있는 경우 자동호출이 가능하게함)
 * 		사용자 정의보다는 트렌젝션/보안/로그
 * 	MVC : 웹(라이브러리)
 * 
 * 	라이브러리 : 있는 그대도 사용(사용법/어떤기능/찾기)
 * 		수정하지 않고 사용(ORM : 마이바티스)
 * 
 * 	프레임워크 : 기본동작을 위한 틀이 만들어져있음(형식에 맞게 세팅해 사용)
 * 		1) 라이브러리 추가 : pom.xml / gredle
 * 		
 * 	MVC 
 * 		Model : 사용자의 요청을 받아서 처리결과를 jsp로 전송하는 역할(@Controller, @restController)
 * 			@Controller
 * 			@RestContloller : 자바스크립트로 전송
 * 		View : JSP, HTML
 * 			관리 - HandleMapping : 해당 메소드 찾기
 * 			ViewResolver : JSP를 찾아 request를 전송
 * 		Controller : 사용자 요청을 받는 클래스(스프링에서 제공)
 * 			DispacherServlet : 메뉴얼만 제작
 * 			web.xml
 * 	WebApplicationContext : 사용자 정의 클래스를 관리
 * 		클래스를 관리
 * 			클래스 등록
 * 			
 * 			넘겨주는 방법
 * 
 * 
 * 	사용자 요청 (DispatcherServlet - HandleMapping - Model처리 - ViewResolver - JSP)
 * 		ViewSesolver
 * 			p:prefix : 경로명
 * 			p:suffix : 확장자명
 * 
 * 	요청에 대한 처리
 * 		1) 데이터베이스(마이바티스)
 * 			DAO : 테이블 1개
 * 			Service : 관련된 DAO를 묶어서 처리
 * 		2)외부 API(날씨, 뉴스, 메일)
 * 		3)전송
 * 			redirect : 기존에 있는 메소드 재호출
 * 				return "redirect:list.do"
 * 			forward : 해당 데이터를 전송(select)
 * 				return "경로/파일명"
 * 			
 * 	1) jsp : EL/JSTL
 * 	2) 자바스크립트 : Ajax / VueJS / ReactJS
 * 		List : []
 * 		vo : {}
 * 			JSON(jackson) : spring-boot에선 자동처리
 * 			일반데이터형 : 정수/실수/논리/문자
 */
// jsp연동 
@Controller
@RequestMapping("main/")
public class MainController {
   // 필요한 클래스 => 스프링에서 가지고 온다 (객체 주소)
	@Autowired
	private RecipeService rService;
	
	@Autowired
	private FoodService fService;
   // 사용자에 요청 따라 => 처리 
   @GetMapping("main.do")
   public String main_main(Model model)
   {
	   RecipeVO rvo=rService.recipeMaxHitData();
	   List<RecipeVO> rList=rService.recipeHitTop8();
	   List<FoodVO> fList=fService.foodHitTop5();
	   ChefVO cvo=rService.chefToday();
	   
	   model.addAttribute("rvo", rvo);
	   model.addAttribute("cvo", cvo);
	   model.addAttribute("rList", rList);
	   model.addAttribute("fList", fList);
	   
	   return "main";
   }
}
