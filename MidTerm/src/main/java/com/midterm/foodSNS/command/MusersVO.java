package com.midterm.foodSNS.command;

import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MusersVO {
	
	private String userId;
	private String userPw;
	private String userPhone1;
	private String userPhone2;
	private String userEmail1;
	private String userEmail2;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;
	private LocalDateTime regDate;	

}
