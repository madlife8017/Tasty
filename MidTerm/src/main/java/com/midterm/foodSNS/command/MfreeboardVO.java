package com.midterm.foodSNS.command;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
bno INT primary key auto_increment,
    update_date datetime default Null ,
    title varchar(300) NOT null,
    writer varchar(50) not null,
    content varchar(5000) not null,
    reg_date datetime default current_timestamp, 
    like_num int default 0	 
 * */


@Getter
@Setter
@ToString
public class MfreeboardVO {
	
	private int bno;
	private LocalDateTime updateDate;
	private String title;
	private String writer;
	private String content;
	private LocalDateTime regDate;
	private int likeNum;

}
