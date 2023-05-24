package com.midterm.foodSNS.command;
/*
 * 
 * CREATE TABLE MRecipe(
	rno INT primary key auto_increment,
    update_date datetime default Null ,
    title varchar(300) NOT null,
    writer varchar(50) not null,
    ingredient varchar(3000) not null,
    recipe varchar(5000) not null,
    reg_date datetime default current_timestamp, 
    like_num int default 0
);
 * */

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MRecipeVO {
	
	private int rno;
	private LocalDateTime updateDate;
	private String title;
	private String writer;
	private String ingredient;
	private String recipe;
	private LocalDateTime regDate;
	private int likeNum;

}
