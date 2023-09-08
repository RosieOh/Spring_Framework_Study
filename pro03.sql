create database teaspoon;

USE teaspoon;

SHOW TABLE sample;

CREATE table sample(NO INTEGER AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(100));
 
 
INSERT INTO sample VALUES (DEFAULT, '김기태');
INSERT INTO sample VALUES (DEFAULT, '한선');
INSERT INTO sample VALUES (DEFAULT, '이은영');
INSERT INTO sample VALUES (DEFAULT, '서광');
INSERT INTO sample VALUES (DEFAULT, '이소윤');

COMMIT;

CREATE TABLE board(seq INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	content VARCHAR(100) NOT NULL,
	nickname VARCHAR(20),
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
	visited INT DEFAULT 0
);

INSERT INTO board VALUES(DEFAULT, '샘플 글 제목 1입니다.', '내용1 입니다.', 'dhxogns920', '2023-09-08', 0);
INSERT INTO board VALUES(DEFAULT, '샘플 글 제목 2입니다.', '내용2 입니다.', 'dhxogns920', '2023-09-08', 0);
INSERT INTO board VALUES(DEFAULT, '샘플 글 제목 3입니다.', '내용3 입니다.', 'dhxogns920', '2023-09-08', 0);
INSERT INTO board VALUES(DEFAULT, '샘플 글 제목 4입니다.', '내용4 입니다.', 'dhxogns920', '2023-09-08', 0);
INSERT INTO board VALUES(DEFAULT, '샘플 글 제목 5입니다.', '내용5 입니다.', 'dhxogns920', '2023-09-08', 0);
INSERT INTO board VALUES(DEFAULT, '샘플 글 제목 6입니다.', '내용6 입니다.', 'dhxogns920', '2023-09-08', 0);