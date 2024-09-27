package com.sist.aop;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.sist.vo.*;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sist.service.*;


@Aspect		//공통모듈
@Component		//메모리 할당
public class CommonsAspect {
	@Autowired
	private FoodService fService;
	
	//finally(무조건 실행)
	@After("execution(* com.sist.web.*Controller.*(..))")	//모든 컨트롤러에 들어가는 메소드
	public void footerCookieSend() {
		//request 수령
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
				
		Cookie[] cookies=request.getCookies();
		
		List<FoodVO> list=new ArrayList<FoodVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1; i>=0; i--) {
				if(cookies[i].getName().startsWith("food_")) {	//food_로 시작되었다면
					String fno=cookies[i].getValue();
					FoodVO vo=fService.foodInfoData(Integer.parseInt(fno));
					list.add(vo);
				}
			}
		}
	}
	
}
