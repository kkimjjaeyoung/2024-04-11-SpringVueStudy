package com.sist.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String userId,userPwd, userName, sex,post,addr1,addr2,email,phone1, phone2,phone,content, birthday;
	private int enabled;
	private Date redgate, modifydate, lasstlogin;
	private String msg, authority;
}
