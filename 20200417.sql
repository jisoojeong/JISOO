SELECT 에서 연산 :
날짜 연산(+, -) : 날짜 + 정수, -정수 : 날짜에서 +-정수를 한 과거 혹은 미래일자의 데이트 타입 변환
정수 연산(....) : 수업시간에 다루진 않음...
문자열 연산
   리터럴 : 표기방법
           숫자 리터럴 : 숫자로 표현
           문자 리터럴 : JAVA : "문자열" / sql : 'sql'
                       SELECT SELECT * FROM || table_name
                       SELECT 'SELECT * FROM' * || table_name
           문자열 결합연산 : +가 아니라 || (java 에서는 +)
        
    날짜?? : TO_DATE("날짜문자열", "날짜 문자열에 대한 포맷")
            TO_DATE('20200417', 'YYYYMMDD')

WHERE : 기술한 조건에 만족하는 행만 조회되도록 제한;
SELECT *
FROM users
WHERE userid = 'brown';



sal값이 1000보다 크거나 같고, 2000보다 작거나 같은 직원만 조회 -> BETWEEN AND
비교대상 컬럼 / 값 BETWEEN 시작값 AND 종료값
시작값과 종료값의 위치를 바꾸면 정상 동작하지 않음

SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

SELECT *
FROM emp
WHERE sal >=1000
  AND sal <=2000;
  
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN TO_DATE(19820101,'YYYYMMDD') AND TO_DATE(19830101,'YYYYMMDD');

SELECT ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE(19820101,'YYYYMMDD') AND hiredate <= TO_DATE(19830101,'YYYYMMDD');

IN 연산자
컬럼:특정값 IN (값1, 값2.....)
컬럼이나 특정값이 괄호안에 값중에 하나라도 일치를 하면 TRUE

SELECT *
FROM emp
WHERE deptno = 10 OR deptno = 30;

SELECT USERID,USERNM,ALIAS
FROM users
WHERE userid in('brown', 'cony', 'sally');

문자열 매칭 연산 : LIKE 연산 / JAVA : startswith(prefix), endsWith(suffix)
마스킹 문자열 : % - 모든 문자열(공백 포함)
              _ - 어떤 문자열이든지 딱 하나의 문자

문자열의 일부가 맞으면 TRUE

컬럼|특정값 LIKE 패턴 문자열

'cony' : cony인 문자열
'co%' : 문자열이 co로 시작하고 뒤에는 어떤 문자열이든 올 수 있는 문자열
        'cony', 'con', 'co'
'%co%' : co를 포함하는 문자열
        'cony', 'sally cony'
'co__' : co로 시작하고 뒤에 두개의 문자가 오는 문자열
'_on_' : 가운데 두글자가 on이고 앞 뒤로 어떤 문자열 이든지
         하나의 문자가 올 수 있는 문자열
 
 직원 이름(ename)이 대문자 s로 시작하는 직원만 조회;
 SELECT *
 FROM emp
 WHERE ename LIKE 'S%';
 
 --실습4
 SELECT MEM_ID, MEM_NAME
 FROM member
 WHERE mem_name LIKE '신%';
 
 --실습5
 SELECT MEM_ID, MEM_NAME
 FROM member
 WHERE mem_name LIKE '%이%';
 
 
 
 
 NULL 비교
 SQL 비교연산자 :
 WHERE usernm = 'brown'
 
 MGR 컬럼 값이 없는 모든 직원을 조회
 
 SELECT *
 FROM emp
 WHERE mgr IS NULL;
 
 ** SQL에서 NULL 값을 비교할 경우 일반적은
 비교연산자(=)를 사용 못하고, IS 연산자를 이용 **
 
 값이 있는 상황에서 등가 비교 : =, != , <>
 NULL : IS NULL , IS NOT NULL
 
 emp테이블에서 mgr 컬럼 값이 NULL이 아닌 직원을 조회
 SELECT *
 FROM emp
 WHERE mgr IS NOT NULL;
 
 
 --실습 6
 SELECT *
 FROM emp
 WHERE comm IS NOT NULL;
 
 
 
 
  
  SELECT *
  FROM emp
  WHERE mgr = 7698
  AND sal > 1000;
  
  SELECT *
  FROM emp
  WHERE mgr = 7698
  OR sal > 1000;
  
  SELECT *
  FROM emp
  WHERE mgr NOT IN (7698,7839);
==> WHERE mgr = 7698 OR mgr = 7839

SELECT *
  FROM emp
  WHERE mgr NOT IN (7698,7839);
==> WHERE (mgr != 7698 AND mgr != 7839)

--실습7
SELECT *
FROM emp
WHERE job = 'SALESMAN' AND hiredate>=TO_DATE('19810601','YYYYMMDD');

--실습 8
SELECT *
FROM emp
WHERE DEPTNO <>10 AND hiredate>=TO_DATE('1981061','YYYYMMDD');

--실습 9
SELECT *
FROM emp
WHERE DEPTNO NOT IN 10 AND hiredate>=TO_DATE('1981061','YYYYMMDD');

--실습 10
SELECT *
FROM emp
WHERE DEPTNO IN(20,30) AND hiredate>=TO_DATE('19810601','YYYYMMDD');

--실습 11
SELECT *
FROM emp
WHERE job = 'SALESMAN' OR hiredate>=TO_DATE('19810601','YYYYMMDD');

--실습 12
SELECT *
FROM emp
WHERE job = 'SALESMAN' OR EMPNO LIKE '78%';

--실습 13
SELECT *
FROM emp
WHERE job = 'SALESMAN' 
   OR EMPNO = 78
   OR EMPNO >= 780 AND EMPNO < 790
   OR EMPNO >=7800 AND EMPNO < 7900;

--실습 14

   
집합 : {a, b, c} == {a, b, c}

table에는 조회, 저장시 순서가 없어(보장하지 않음)
==> 수학시간의 집합과 유사한 개념

SQL에서는 데이터를 정렬하려면 별도의 구문이 필요
ORDER BY 컬럼명 [정렬형태], 컬럼명2 [정렬형태].....

정렬의 형태 : 오름차순(DEFAULT) -ASC, 내림차순 -DESC



직원 이름으로 오름 차순정렬

SELECT *
FROM emp
ORDER BY ename ASC;

직원 이름으로 내림 차순정렬

SELECT *
FROM emp
ORDER BY ename DESC;

-- job을 기준으로 오름 차순정렬하고 job이 같을 경우 입사일자로 내림차순 정렬
SELECT *
FROM emp
ORDER BY job ASC, hiredate DESC;