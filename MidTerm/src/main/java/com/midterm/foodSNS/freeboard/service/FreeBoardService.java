package com.midterm.foodSNS.freeboard.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.freeboard.mapper.IFreeBoardMapper;
import com.midterm.foodSNS.util.PageVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FreeBoardService implements IFreeBoardService {
	
	@Autowired
	private IFreeBoardMapper mapper;

	@Override
	public void registImg(MfreeboardImgVO ivo, List<MultipartFile> file) {
		// 날짜별로 폴더를 생성해서 관리할 예정입니다.
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
        String fileLoca = now.format(dtf);

        // 기본 경로는 C:/test/upload 로 사용하겠습니다.
        String uploadPath = "C:/test/upload/";

        // 폴더 없으면 새롭게 생성해 주시라
        File folder = new File(uploadPath + fileLoca);
        if(!folder.exists()) folder.mkdirs();
        // 저장된 파일명은 UUID를 이용한 파일명으로 저장합니다.
        // UUID가 제공하는 랜덤 문자열에 -을 제거해서 전부 사용하겠습니다
        for(MultipartFile mf : file)
        {
        	String fileRealName = mf.getOriginalFilename();  

            UUID uuid = UUID.randomUUID();
            String uuids = uuid.toString().replaceAll("-", "");

            // 확장자 추출.
            String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));

            log.info("저장할 폴더 경로: " + uploadPath);
            log.info("실제 파일명: " + fileRealName);
            log.info("폴더명: " + fileLoca);
            log.info("확장자 : " + fileExtension);
            log.info("고유랜덤문자: " + uuids);

            String fileName = uuids + fileExtension;
            log.info("변경해서 저장할 파일명: " + fileName);

            // 업로드한 파일을 저장한 로컬 경로로 전송
            File saveFile = new File(uploadPath + fileLoca + "/" + fileName);
            try {
            	mf.transferTo(saveFile);

            } catch (Exception e) {
                e.printStackTrace();
            }
            ivo.setUploadPath(uploadPath);
            ivo.setFileLoca(fileLoca);
            ivo.setFileName(fileName);
            ivo.setFileRealName(fileRealName);
            mapper.registImg(ivo);
            
        
        }
		
	}
	
	
	
	@Override
	public void registArticle(MfreeboardArticleVO avo) {	
		mapper.registArticle(avo);		
	}
	
	@Override
	public MfreeboardArticleVO getArticle(int faNum) {		
		return mapper.getArticle(faNum);
	}
	
	@Override
	public void delete(int faNum) {
		log.info("dddddff"+faNum);
		mapper.delete(faNum);
		
	}
	
	@Override
	public void deleteimg(int iNum) {
		mapper.deleteimg(iNum);
		
	}

	@Override
	public List<MfreeboardImgVO> getCarousel(int faNum) {
		
		return mapper.getCarousel(faNum);
	}
	


	@Override
	public List<MfreeboardArticleVO> getList(PageVO vo) {
		// TODO Auto-generated method stub
		return null;
	}



	public void update(MfreeboardArticleVO vo) {

		// TODO Auto-generated method stub
		
	}



}
