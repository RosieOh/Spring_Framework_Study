CREATE DATABASE haebeop;

USE haebeop;

CREATE TABLE test(num INT AUTO_INCREMENT PRIMARY KEY,
                  title VARCHAR(100) NOT NULL);

INSERT INTO test VALUES (DEFAULT, '테스트제목1');
INSERT INTO test VALUES (DEFAULT, '테스트제목2');
INSERT INTO test VALUES (DEFAULT, '테스트제목3');
INSERT INTO test VALUES (DEFAULT, '테스트제목4');
INSERT INTO test VALUES (DEFAULT, '테스트제목5');

SELECT * from test;

COMMIT;

SELECT * FROM emp;

DESC test;

DESC emp;

CREATE TABLE user(
                     id VARCHAR(20) PRIMARY KEY,
                     pw VARCHAR(350) NOT NULL,
                     name VARCHAR(50) NOT NULL,
                     email VARCHAR(150),
                     tel VARCHAR(20),
                     addr1 VARCHAR(200),
                     addr2 VARCHAR(200),
                     postcode VARCHAR(20),
                     regdate DATETIME DEFAULT CURRENT_TIME,
                     birth DATE DEFAULT CURRENT_DATE,
                     pt INT DEFAULT 0,
                     visited INT DEFAULT 0
);

INSERT INTO user VALUES ('admin', '1234', '관리자','admin@haebeop.com', '010-1234-1234', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO user VALUES ('dhxogns920', '1234', '오태훈','dhxogns920@haebeop.com', '010-7329-7484', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

UPDATE user SET pw='$2a$10$B1eSQwtXQMZIht3sHOWS7.a/wOmnXT9T3EqYwl7qBbOfAuj8YuKvW' WHERE id='admin';
UPDATE user SET pw='$2a$10$B1eSQwtXQMZIht3sHOWS7.a/wOmnXT9T3EqYwl7qBbOfAuj8YuKvW' WHERE id='dhxogns920';

SELECT * FROM user;
