package com.midterm.foodSNS.command;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class MKakaoUserVO {
	
	
	@JsonProperty("id")
	private long id;
	
	@JsonProperty("connected_at")
	private LocalDateTime connectedAt;
	
	@JsonProperty("kakao_account")
	private KakaoAccount kakaoAccount;

	
	@Getter @Setter @ToString
	static public class KakaoAccount {

		private String email;
		private Profile profile;
		
		@Getter @Setter @ToString
		static class Profile {
			
			private String nickname;
			
			@JsonProperty("profile_image_url")
			private String profileImageUr;
			
			@JsonProperty("thumbnail_image_url")
			private String thumbnailImageUrl;
			
		}
		
	}
	
}
