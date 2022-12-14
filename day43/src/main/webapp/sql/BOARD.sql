CREATE TABLE BOARD(
	BID INT PRIMARY KEY, -- AUTO_INCREMENT
	TITLE VARCHAR(20) NOT NULL,
	CONTENT VARCHAR(50) NOT NULL,
	WRITER VARCHAR(20) NOT NULL, -- MEMBER의 MID : 외래키는 상대 테이블의 PK를 사용함
	DATETIME VARCHAR(50) NOT NULL
);

INSERT INTO BOARD VALUES((SELECT NVL(MAX(BID),0)+1 FROM BOARD),'탑','버섯','timo','null','null');

SELECT * FROM BOARD ORDER BY BID DESC;
SELECT * FROM BOARD A, MEMBER B WHERE A.WRITER=B.MID AND MID='timo';
SELECT * FROM MEMBER WHERE MID='timo';

SELECT BID,TITLE,CONTENT,MNAME FROM BOARD JOIN MEMBER ON BOARD.WRITER = MEMBER.MID ORDER BY BID DESC; 

CREATE TABLE AA(
	DATETIME VARCHAR(50) NOT NULL
);

INSERT INTO AA VALUES((SELECT SYSDATE FROM DUAL));

SELECT * FROM AA;

SELECT SYSDATE FROM DUAL;

DROP TABLE BOARD;

UPDATE BOARD SET writer='timo' WHERE writer='(이름없음)';

-- 추가해볼만한 칼럼
--  1. 작성일 : 날짜 타입
--  2. 좋아요 수 : 테이블 관계, 이퀄조인, 외래키
--  3. 조회수 : scope 이슈 / 로직
