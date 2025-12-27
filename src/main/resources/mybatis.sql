--spring/spring
-- sys에서 계정생성
CREATE TABLE MEMBER (
    userId VARCHAR2(100) PRIMARY KEY, -- 아이디
    userPw VARCHAR2(256) NOT NULL,   -- 비밀번호 (암호화된 문자열 저장용, 길게 잡음)
    userName VARCHAR2(100) NOT NULL   -- 이
     regDate TIMESTAMP DEFAULT SYSDATE
);
CREATE TABLE BOARD (
    bId NUMBER(4) PRIMARY KEY,       -- 글 번호
    bName VARCHAR2(50),              -- 작성자 (userId)
    bTitle VARCHAR2(100),            -- 제목
    bContent VARCHAR2(2000),         -- 내용
    bDate TIMESTAMP DEFAULT SYSDATE, -- 작성일
    bHit NUMBER(4) DEFAULT 0         -- 조회수
);
CREATE SEQUENCE BOARD_SEQ; -- 글 번호 자동 생성기
ALTER TABLE BOARD ADD fileName VARCHAR2(200);

CREATE TABLE REPLY (
    rId NUMBER(4) PRIMARY KEY,       -- 댓글 번호
    bId NUMBER(4),                   -- 원본 글 번호 (어떤 글의 댓글인지)
    rName VARCHAR2(50),              -- 댓글 작성자
    rContent VARCHAR2(500),          -- 댓글 내용
    rDate TIMESTAMP DEFAULT SYSDATE,
    CONSTRAINT FK_BOARD_REPLY FOREIGN KEY(bId) REFERENCES BOARD(bId) ON DELETE CASCADE
);
CREATE SEQUENCE REPLY_SEQ;


CREATE TABLE qna_board (
    qId NUMBER(4) PRIMARY KEY,      -- 글 번호
    qName VARCHAR2(20),             -- 작성자
    qTitle VARCHAR2(100),           -- 제목
    qContent VARCHAR2(2000),        -- 내용
    qDate DATE DEFAULT SYSDATE,     -- 작성일
    qHit NUMBER(4) DEFAULT 0,       -- 조회수
    qGroup NUMBER(4),               -- (답글용) 그룹 번호
    qStep NUMBER(4),                -- (답글용) 순서
    qIndent NUMBER(4)               -- (답글용) 들여쓰기
);

CREATE SEQUENCE qna_seq;


INSERT INTO qna_board (qId, qName, qTitle, qContent, qGroup, qStep, qIndent)
VALUES (qna_seq.nextval, 'admin', '무엇이든 물어보세요', '고객센터가 오픈되었습니다.', qna_seq.currval, 0, 0);


COMMIT;

