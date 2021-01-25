DROP TABLE IF EXISTS board;
 
CREATE TABLE board (
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(45) NOT NULL,
	writer VARCHAR(45) NOT NULL,
	content text NULL,
	today datetime NULL,
PRIMARY KEY (id));

INSERT INTO board ( title , writer , content , today ) VALUES ( 'first data1','first data1','first data1', now());
INSERT INTO board ( title , writer , content , today) VALUES ( 'first data2','first data2','first data2', now());
INSERT INTO board ( title , writer , content , today) VALUES ( '세 번째 게시물','오승연','세 번째 게시물입니다.', now());
INSERT INTO board ( title , writer , content , today) VALUES ( '네 번째 게시물','오가연','네 번째 게시물입니다.', now());
INSERT INTO board ( title , writer , content , today) VALUES ( '다섯 번째 게시물','오승승','다섯 번째 게시물입니다.', now());
INSERT INTO board ( title , writer , content , today) VALUES ( '여섯 번째 게시물','한승연','여섯 번째 게시물입니다.', now());