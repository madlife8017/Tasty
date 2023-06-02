package com.midterm.foodSNS.util;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class MWeatherVO {

	/*
	 @JsonProperty
	 Rest API 통신을 진행하다 보면 데이터를 주고 받을 때 JSON 형태의 데이터를 주로 이용합니다.
	 json은 스네이크 케이스 방식을 사용하고, 서버단에서는 카멜 케이스 방식을 사용합니다.
	 서로 표현 방식이 다름에 따라 데이터의 key가 달라지는 경우가 발생합니다.
	 이 때 @JsonProperty를 사용하면 값을 매칭할 수 있습니다. 
	 */
	
	
	@JsonProperty("weather")
	private List<weather> weather;
	
	



	@Getter @Setter @ToString
	static class weather  {
		
		@JsonProperty("main")
		private String main;
		
		@JsonProperty("icon")
		  private String icon;
	}
	
	
	@JsonProperty("main")
	private main main;
	
	@Getter @Setter @ToString
	public static class main  {
		
		@JsonProperty("temp")
		private float temp;
		
	}
	
}
		
		
	





