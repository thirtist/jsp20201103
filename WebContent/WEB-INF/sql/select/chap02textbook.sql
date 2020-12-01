SELECT * FROM employee WHERE salary >= 1500; --급여가 1500이상인 사원 출력하기
SELECT * FROM employee WHERE dno=10; --부서번호가 10인 사원 출력
SELECT * FROM employee WHERE ename=scott; --SCOTT를 칼럼으로 간주하고 오류를 발생
SELECT * FROM employee WHERE ename='SCOTT';--이름이 SCOTT사원 출력
SELECT * FROM employee WHERE hiredate <= '1981/01/01'; --입사일이 그거 이전인 사람 출력

--논리연산자를 활용하여 조건을 여러개 두기
SELECT * FROM employee WHERE dno=10 AND JOB='MANAGER';
SELECT * FROM employee WHERE dno=10 OR JOB='MANAGER';
SELECT * FROM employee WHERE NOT dno=10;
SELECT * FROM employee WHERE salary>=1000 AND salary<=1500;
SELECT * FROM employee WHERE salary<1000 OR salary>1500;
SELECT * FROM employee WHERE commission=300 OR commission=500 OR commission=1400;

--BETWEEN 연산자
SELECT * FROM employee WHERE salary BETWEEN 1000 AND 1500;
SELECT * FROM employee WHERE salary >= 1000 AND salary <=1500; --위랑 같은 값
SELECT * FROM employee WHERE salary NOT BETWEEN 1000 AND 1500;
SELECT * FROM employee WHERE salary <= 1000 AND salary >=1500;
SELECT * FROM employee WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/31';

--IN 연산자
SELECT * FROM employee WHERE commission IN(300,500,1400);
SELECT * FROM employee WHERE commission=300 OR commission=500 OR commission=1400;
SELECT * FROM employee WHERE commission<>300 OR commission<>500 OR commission<>1400;
SELECT * FROM employee WHERE commission NOT IN(300,500,1400);

--와일드카드(%)(_)
SELECT * FROM employee WHERE ename LIKE 'F%';
SELECT * FROM employee WHERE ename = 'F%'; --실패 (와일드카드와 LIKE를 같이 안썼음)
SELECT * FROM employee WHERE ename LIKE '%M%';
SELECT * FROM employee WHERE ename LIKE '%N';
SELECT * FROM employee WHERE ename LIKE '_A%';
SELECT * FROM employee WHERE ename LIKE '__A%'; -- __이거는 자릿수가 정해져서 검색
SELECT * FROM employee WHERE ename NOT LIKE '%A%';

--NULL을 위한 연산자(IS)
SELECT * FROM employee WHERE commission = NULL; --(x)
SELECT * FROM employee WHERE commission IS NULL; --(o)
SELECT * FROM employee WHERE commission IS NOT NULL; --(o) not 위치가 이거만 다름(be동사)

--정렬을 위한 ORDER BY절
SELECT * FROM employee ORDER BY salary ASC;
SELECT * FROM employee ORDER BY salary;
SELECT * FROM employee ORDER BY salary DESC;
SELECT * FROM employee ORDER BY ename;
SELECT * FROM employee ORDER BY hiredate DESC;
SELECT * FROM employee ORDER BY salary DESC, ename ASC;




--혼자해보기
--01
SELECT ename, salary, salary+300 FROM employee;

--02
SELECT ename, salary, salary*12+100 FROM employee
ORDER BY salary*12+100 DESC;  --order by로 정렬 desc

--03
SELECT ename, salary FROM employee WHERE salary > 2000 
ORDER BY salary DESC;

--04
SELECT ename, dno FROM employee WHERE eno=7788;

--05
SELECT ename, salary FROM employee WHERE salary NOT BETWEEN 2000 AND 3000;

SELECT * FROM employee;

--06
SELECT ename, JOB, hiredate FROM employee WHERE hiredate BETWEEN '1981/02/20' AND '1981/05/01';

--07
SELECT ename, dno FROM employee WHERE dno IN(20,30)
ORDER BY ename;

--08
SELECT ename, salary, dno
FROM employee
WHERE salary
BETWEEN 2000 AND 3000
AND dno IN(20,30)
ORDER BY ename;

--09
SELECT ename, hiredate FROM employee WHERE hiredate LIKE '81%';

--10
SELECT ename, JOB FROM employee WHERE MANAGER IS NULL;

--11
SELECT ename, salary, commission FROM employee WHERE commission IS NOT NULL ORDER BY salary, commission;

--12
SELECT ename FROM employee WHERE ename LIKE '__R%';

--13
SELECT ename FROM employee WHERE ename LIKE '%A%' AND ename LIKE '%E%';

--14
SELECT ename, job, salary FROM employee where job IN('CLERK','SALESMAN') and salary not in(1600,950,1300);

--15
SELECT ename, salary, commission FROM employee where commission >= 500;