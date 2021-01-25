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
INSERT INTO board ( title , writer , content , today) VALUES ( '�� ��° �Խù�','���¿�','�� ��° �Խù��Դϴ�.', now());
INSERT INTO board ( title , writer , content , today) VALUES ( '�� ��° �Խù�','������','�� ��° �Խù��Դϴ�.', now());
INSERT INTO board ( title , writer , content , today) VALUES ( '�ټ� ��° �Խù�','���½�','�ټ� ��° �Խù��Դϴ�.', now());
INSERT INTO board ( title , writer , content , today) VALUES ( '���� ��° �Խù�','�ѽ¿�','���� ��° �Խù��Դϴ�.', now());