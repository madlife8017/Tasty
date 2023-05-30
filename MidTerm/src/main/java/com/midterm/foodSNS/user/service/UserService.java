package com.midterm.foodSNS.user.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.midterm.foodSNS.command.MfreeboardImgVO;

import org.springframework.security.core.userdetails.User;


import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.user.mapper.IUserMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserService implements IUserService {

	@Autowired
	private IUserMapper mapper;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Override
	public void join(MusersVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		String securePw = encoder.encode(vo.getUserPw()); 			
		vo.setUserPw(securePw); 
		mapper.join(vo); 
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id); 
	}

	@Override
	public String login(String id, String pw) {
		String dbPw = mapper.login(id);

		if(dbPw != null) {
			if(encoder.matches(pw, dbPw)) return id;
		}		
		return null;
	}

	@Override
	public MusersVO userInfo(String id) {
		return mapper.userInfo(id);


	}

	@Override
	public MusersVO userInfo(String id) {
		return mapper.userInfo(id);

	}

	@Override
	public MusersVO getInfo(MusersVO vo) {
		return mapper.getInfo(vo);
	}


	// 회원 탈퇴
	@Override
	public void userDelete(MusersVO vo) {
		mapper.userDelete(vo);
	}

	// 회원 탈퇴

	@Override
	public int passChk(String pwinput,MusersVO vo) throws Exception {
		
		if(encoder.matches(pwinput,vo.getUserPw())) {
			log.info("비번맞음");
			return 1;
			
		} else {
			log.info("비번틀림");
			return 0;
		}		
	}
	
	
	
	


	@Override
	public void updateMusers(MusersVO vo) {
		String securePw = encoder.encode(vo.getUserPw()); 			
		vo.setUserPw(securePw); 
		mapper.updateMusers(vo);
	}
	@Override
	public void deleteMusers(MusersVO vo) {
		String dbPw = mapper.login(vo.getUserId());

		if(dbPw != null) {
			if(encoder.matches(vo.getUserPw(), dbPw))
				mapper.deleteMusers(vo);
		}		
		return;

	}


	@Override
	public void profilemodify(MusersVO vo, MultipartFile file) {
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
		String fileRealName = file.getOriginalFilename();


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
			file.transferTo(saveFile);

		} catch (Exception e) {

			e.printStackTrace();
		}
		vo.setUploadPath(uploadPath);
		vo.setFileLoca(fileLoca);
		vo.setFileName(fileName);
		vo.setFileRealName(fileRealName);
		log.info("오냐"+vo.toString());
		mapper.profilemodify(vo);

	}

	@Override
	public MfreeboardImgVO registImg(MfreeboardImgVO ivo, MultipartFile file) {
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
        
        	String fileRealName = file.getOriginalFilename();  

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
            	file.transferTo(saveFile);

            } catch (Exception e) {
                e.printStackTrace();
            }
            ivo.setUploadPath(uploadPath);
            ivo.setFileLoca(fileLoca);
            ivo.setFileName(fileName);
            ivo.setFileRealName(fileRealName);
            mapper.registImg(ivo);
            
        
        
        return ivo;
		
	}
	
	@Override
	public MfreeboardImgVO load(int fiNum) {
		return mapper.load(fiNum);
		
	}
}
