package com.midterm.foodSNS.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MSearchConditionVO {
	
	private String weather; 
	private String condition; 
	private String feeling;
	private String listCodtion = "total";

}
