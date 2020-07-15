--커서있는곳 or 블럭한곳만 실행됨
CREATE TABLE t_student(
    i_student number,           --PK특성 unique는 중복 X , not null은 null을 넣을수 없음 (unique,not null)
                                --PK를 넣으면 두기능이 자동으로 들어감
    nm varchar(15) not null,    -- char와 varchar의 차이 : var가 붙으면 크기가 동적할당된다 
    age number(3) not null,     -- ex)nm char(10):10바이트크기( 1개를 넣던 5개를넣던 항상 10개를차지)
    --mySQL은 int적음            -- varchar2(10) : 최대는 10개지만 1개를 넣는만큼만 차지 1개넣으면 1개 5개넣으면 5개
    primary key(i_student)      -- 주민번호 문자열로 저장하는 이유 : 앞에 00이 들어갈수있어서 (00이들어가면 숫자는 다 날아감)
    --primary key를 나중에 선언하는 방법
    -- ,하면서 일자로 그냥 쭉써도됨 마지막에는 콤마 붙이면안됨
    --sql을 지워도 테이블은 남아있다 (ctrl + enter)을 해야만 테이블에 올라간다
    --그냥 txt파일로 저장했다가 쓸때 복붙해도됨
);

--------------------------------INSERT---------------------------------------------------
INSERT INTO t_student --t_student에다가 값을 집어넣겠다
(i_student, nm, age) --i_student,nm,age 변수에다가 값을 넣겠다
VALUES     -- 그 값은
(3,'김수인',22);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(4,'김시운',23);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(5,'김은정',24);
---------------------------------------------------------------------------------------------------
--------------------------------------UPDATE-------------------------------------------------
UPDATE t_student -- 수정
SET nm = '김도빈', --nm과 age를 지금 입력한값으로 설정(SET)하겠다
age = 21 -- age = age + 1도 가능
WHERE i_student = 2; --위치는 i_student의 값이 2인곳
--WHERE은 조건문 i_student의 값이 2인곳 이게 없다면 모든값이 다 바뀜
--UPDATE와 DELETE는 조심히 써야함
---------------------------------------------------------------------------------------------------
----------------------------------------DELETE-------------------------------------------------
DELETE FROM t_student -- t_sudent에서 값을 빼겠다(삭제)
WHERE i_student = 3; -- 위치는 i_student가 3인곳
--------------------------------------------------------------------------------------
---------------------------------------------------SELECT-----------------------------------------------
--SELECT*FROM t_student  -- 읽어오기 - *는 모든 컬럼 t_student에서 모든값을 읽어온다
SELECT i_student,nm,age as student_age --이렇게 일일이 적는거 추천 as student_age 적어주면 결과를 표시할때 컬럼명을 적어준대로 표시해줌(별명)
FROM t_student
WHERE (i_student <=3 AND age =21) OR i_student = 5 --(i_student의 값이 3이하인 레코드)만 보여줌 AND (age값이 21인레코드)만  AND는 둘다 true일때 OR 또는 i_student값이 5인 레코드
ORDER BY i_student,age,nm; --를적어주면 1,2,3,4,5정렬이 된다 뒤에 DESC넣어주면 내림차순 정렬 (기본값 ASC 오름차순)
                            -- 만약 앞에적어준 i_student에 중복된게 있다면 age순으로정렬 또 중복이라면 nm순으로 정렬
                            --ORDER BY는 항상 마지막줄
                            
SELECT i_student,nm,age as student_age
FROM t_student
ORDER BY nm ASC, age DESC; --이름은 오름차순으로 하다가 이름이 중복된다면 나이로 내림차순

SELECT i_student,nm,age as student_age
FROM t_student
--WHERE nm = '김시운' 에서 김시운을 검색
--WHERE nm LIKE '김%'  -- nm에서 제일앞글자가 김인 사람
WHERE nm LIKE '%효%' -- nm에 효가 포함된 사람
--WHERE nm LIKE '%균' -- nm의 제일 뒷글자가 균인사람

ORDER BY age DESC, nm DESC; --나이 내림차순하다가 나이가 같으면 이름 내림차순
--ORDER를 안적어주면 할때마다 랜덤이됨

SELECT 1 as dd,'하하' as nm,i_student FROM t_student
--1이란 값을 표시하는곳의 컬럼명을 dd / '하하'라는 값을 가지고있는 컬럼명을 nm / t_student에있는 i_student의 값을 보여줌
-- t_student의 i_student가 9개이기떄문에 9개가 나옴
union all
SELECT 2 as dd,'호호' as nm,i_student FROM t_student;
--이렇게 구분지을때 사용

-------------------------------------------------------------------------------------------------------
----------------------------복수의 테이블 삭제----------------------------------------------------------

-- DELETE FROM t_student; 테이블데이터 전체 삭제

-- DELETE FROM t_student
-- WHERE i_student in (1,2,3); 1,2,3의 데이터 삭제

-- DELETE FROM t_student
-- WHERE o_student = 1 or i_student = 2 or i_student = 3; 1,2,3의 데이터삭제 포퍼먼스가 더 좋음
---------------------------------------------------------------------------------------------------
----------------------------블럭해서 여러개 INSERT-------------------------------------------------
INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(1,'권하균',20);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(2,'김도빈',21);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(3,'김수인',22);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(4,'김시운',23);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(5,'김은정',24);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(6,'김은정',25);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(7,'김은정',26);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(8,'김재섭',23);

INSERT INTO t_student 
(i_student, nm, age) 
VALUES   
(9,'김효진',23);
-------------------------------------------------------------------------------------------
-------------------------------미션---------------------------------------------------------
--employees 테이블에서
--전화번호(423이 포함된 사람들 모두 나오도록)
SELECT *
FROM employees
WHERE phone_number like '%423.%';


--테이블에는 pk(primary key)가 필요
--pk - 식별하기 위해 씀 (레코드를 구별)
--   - pk는 절대 중복된값을 허용하지 않는다
--   - 왠만하면 정수값(1,2,3,4...)주는걸 추천
--pk(unique,not null) 특징
--unique = 중복X
--not null = 값을 넣을떄 절대 null이 들어가지 않는다
--pk넣는순간 이 두기능이 자동으로 들어감
--
--t_student		varchar2	number     <----타입   (자바의 타입이라 생각)
--pk(primary key)	name	age	<----타입명 (자바의 변수명이라 생각)
--	1	aaa	20   <-----한행을 레코드라 부름
--	2	bbb	21	레코드(한행)마다 pk가 있어야함
--
--DB는 대소문자 안가림, 소괄호를 씀
--t_student 앞의 t i는 예약어 피하기위해 그냥쓰는거

SELECT
UPPER(first_name) as first_name           -- UPPER 는 모두 대문자로 나타냄
FROM EMPLOYEES
WHERE PHONE_NUMBER like '%.423.%';        -- 폰넘버 컬럼의 중간 423만 나타내겠다 란 뜻 


commit;
