package com.midterm.foodSNS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MSnsBoardVO;
import com.midterm.foodSNS.snsboard.service.ISnsBoardService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/snsboard")
@Slf4j
public class SnsBoardController {
	
	@Autowired
	private ISnsBoardService service;
	
	//이미지 파일 업로드 요청
	@PostMapping("/upload")
	public void upload(MSnsBoardVO vo, MultipartFile file) {service.insert (vo, file);}

}
