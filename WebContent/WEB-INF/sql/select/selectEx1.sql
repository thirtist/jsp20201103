SELECT * FROM employee;
SELECT * FROM bonus;
SELECT * FROM department;
SELECT * FROM salgrade;

SELECT ename FROM employee;
SELECT eno, ename FROM employee;
SELECT ename, eno FROM employee;
SELECT ename, salary FROM employee;
SELECT ename, salary, salary*12 FROM employee;
SELECT ename, salary/100 FROM employee;
SELECT ename, salary+100 FROM employee;
SELECT ename, salary-100 FROM employee;
SELECT ename, salary, salary*12 AS 연봉 FROM employee;
SELECT ename, salary, salary*12 연봉 FROM employee;
-- 한줄 주석
/*
여러줄 주석
*/
SELECT * FROM employee;
SELECT ename, salary, commission, salary + commission FROM employee;
SELECT ename, salary, commission, NVL(commission,0) FROM employee;
SELECT ename, salary + NVL(commission,0) 합 FROM employee;

--32페이지부터 37페이지까지
SELECT * FROM employee; --전체 사원 출력하기
SELECT eno,ename FROM employee; --사원번호와 사원명만 출력하기
SELECT ename, salary, salary*12 FROM employee; --연봉구하기
SELECT ename, salary, salary*12+commission FROM employee;--커미션을 더한 연봉 구하기
SELECT ename, salary, salary*12+NVL(commission,0) FROM employee;--NVL함수사용하기
SELECT ename, salary, salary*12+NVL(commission,0)연봉 FROM employee;--별칭지정
SELECT ename, salary, salary*12+NVL(commission,0)as연봉 FROM employee;--별칭사이as추가
SELECT ename, salary, salary*12+NVL(commission,0) "po연★봉wer" FROM employee;--별칭에 공백이나 특수문자추가할경우""를 부여

SELECT distinct (dno) FROM employee;
SELECT distinct dno FROM employee;
