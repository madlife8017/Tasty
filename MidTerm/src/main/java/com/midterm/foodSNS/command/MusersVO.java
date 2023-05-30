package com.midterm.foodSNS.command;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MusersVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userNick;
	private String userPhone1;
	private String userPhone2;
	private String userEmail1;
	private String userEmail2;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;	
	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private String fileRealName;
	private String message;
	private LocalDateTime regDate;
	

}
