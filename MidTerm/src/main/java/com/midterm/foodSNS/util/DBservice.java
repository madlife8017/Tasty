package com.midterm.foodSNS.util;

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
