package com.midterm.foodSNS.command;
/*
CREATE TABLE likeDB (
	likenum INT PRIMARY KEY AUTO_INCREMENT,
    cooknum INT, 
    FOREIGN KEY (cooknum) REFERENCES cookDB (cooknum) ON DELETE CASCADE,
    freeboard_article_number INT, 
    FOREIGN KEY (freeboard_article_number) REFERENCES FreeboardArticle (freeboard_article_number) ON DELETE CASCADE,
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Musers (user_id) ON DELETE CASCADE
);
*/

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class LikeVO {
	private int cooknum;
	private int freeboardArticleNumber;
	private int likenum; //좋아요개수
	private String userId;
}
