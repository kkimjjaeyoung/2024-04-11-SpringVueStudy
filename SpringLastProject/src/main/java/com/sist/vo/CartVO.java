package com.sist.vo;

import java.util.*;
import lombok.Data;

@Data
public class CartVO {
	private int cno,gno,account,isbuy;
	private String dbday,id;
	private Date regdate;
	private MemberVO mvo=new MemberVO();
	private GoodsVO gvo=new GoodsVO();
}
