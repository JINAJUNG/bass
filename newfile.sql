
/* Drop Tables */

DROP TABLE student CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE student
(
	-- 학번
	student_num number(10,0) NOT NULL UNIQUE,
	-- 학생이름
	student_name varchar2(60) NOT NULL,
	-- 학과
	student_major varchar2(100) NOT NULL,
	-- 이수학점
	Total_Credit_Hour number(2,0) NOT NULL,
	-- 평균학점
	GPA number NOT NULL,
	-- 폰번호
	student_phone char(11) NOT NULL,
	-- 집주소
	student_address varchar2(500),
	-- 담당교수
	-- 
	student_Professor varchar2(60) NOT NULL,
	-- email
	student_email varchar2(200),
	-- 학년정보
	student_grade char(1) NOT NULL,
	PRIMARY KEY (student_num)
);



/* Comments */

COMMENT ON COLUMN student.student_num IS '학번';
COMMENT ON COLUMN student.student_name IS '학생이름';
COMMENT ON COLUMN student.student_major IS '학과';
COMMENT ON COLUMN student.Total_Credit_Hour IS '이수학점';
COMMENT ON COLUMN student.GPA IS '평균학점';
COMMENT ON COLUMN student.student_phone IS '폰번호';
COMMENT ON COLUMN student.student_address IS '집주소';
COMMENT ON COLUMN student.student_Professor IS '담당교수
';
COMMENT ON COLUMN student.student_email IS 'email';
COMMENT ON COLUMN student.student_grade IS '학년정보';



