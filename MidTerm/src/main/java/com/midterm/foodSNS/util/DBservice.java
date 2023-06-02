package com.midterm.foodSNS.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import com.midterm.foodSNS.user.mapper.IUserMapper;
import com.midterm.foodSNS.util.MDBVO.COOKRCP01.Row;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class DBservice {
	
	@Autowired
	private IUserMapper mapper;	
	
	private String requestUri = "http://openapi.foodsafetykorea.go.kr/api/ff44efcb27354095b86b/COOKRCP01/json/1/500";
	
	private String requestUriWeather ="https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=df4d5c8673ea4b02bae03b075c3c269f";
	
	public Map<String, Object> getWeather() {
		
		RestTemplate template = new RestTemplate();
		ResponseEntity<MWeatherVO> responseEntity = template.exchange(
				requestUriWeather,
				HttpMethod.GET,
				null,			
				MWeatherVO.class
				);
		
		MWeatherVO responseData = responseEntity.getBody();
		
		log.info("날씨 : "+responseData.getWeather().get(0).getMain());
		log.info("온도 : "+responseData.getMain().getTemp());
		log.info("아이콘 : "+responseData.getMain().getTemp());
		
		Map<String, Object> map = new HashMap<>();
		map.put("weather", responseData.getWeather().get(0).getMain()); 
		map.put("temp", responseData.getMain().getTemp());
		map.put("icon", responseData.getWeather().get(0).getIcon()); 
		
		return map;
		
	}
	
	
	
	
	public void getDB() {
		RestTemplate template = new RestTemplate();
		ResponseEntity<MDBVO> responseEntity = template.exchange(
				requestUri,
				HttpMethod.GET,
				null,			
				MDBVO.class
				);
		
		MDBVO responseData = responseEntity.getBody();
		
		for(Row i : responseData.getCookrcp01().getRow()) {			
			log.info("dd : "+ i.getFoodname());	
			MDBVOList list = new MDBVOList();
			list.setFoodname(i.getFoodname());
			list.setTitleimg(i.getTitleimg());
			list.setIngredient(i.getIngredient());
			list.setTip(i.getTip());
			
			list.setImg1(i.getImg1());
			list.setImg2(i.getImg2());
			list.setImg3(i.getImg3());
			list.setImg4(i.getImg4());
			
			list.setText1(i.getText1());
			list.setText2(i.getText2());
			list.setText3(i.getText3());
			list.setText4(i.getText4());
			
			mapper.dbRegist(list);
			
		}
		
				
	}	
}
