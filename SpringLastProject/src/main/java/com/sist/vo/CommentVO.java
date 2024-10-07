package com.sist.vo;

import java.util.*;

import lombok.Data;

@Data
public class CommentVO {
	private int cno, rno, likecount, group_id, group_step,group_tap, depth, root;
	private String id,name,sex,msg,dbday;
	private Date regdate, modifydate;
}
