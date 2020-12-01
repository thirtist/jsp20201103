SELECT* FROM employee, department where employee.dno = department.dno;

SELECT eno, ename, dname from employee, department where employee.dno = department.dno and eno=7788;

SELECT * FROM employee, department;
SELECT eno, ename, dname, dno from employee, department where employee.dno = department.dno and eno=7788; -- 오류
SELECT eno, ename, dname, dno from employee, department; --이거도 안됨
SELECT employee.eno, employee.ename, department.dname, employee.dno from employee, department; -- 자세하게 지정해주는게 좋음
SELECT employee.eno, employee.ename, department.dname, employee.dno from employee, department where employee.dno = department.dno and employee.eno=7788;
SELECT eno, ename, dname, employee.dno from employee, department where employee.dno = department.dno and eno=7788;--중복되지 않은 칼럼명이라면 명시하지 않아도 됨

--테이블에 별칭 사용하기(뒤에 별칭으로 where절 이용할 수 있음)
SELECT e.eno, e.ename, d.dname, e.dno from employee e, department d where e.dno = d.dno and e.eno = 7788;

--2.4 NATURAL JOIN (컬럼 이름과 형식이 모두 같을 때)
SELECT e.eno, e.ename, d.dname, e.dno from employee e natural join department d where e.eno = 7788; --오류발생(동일한이름과 형식의 칼럼 없음 = SELECT에서 e.dno 로 따로지정함)
SELECT e.eno, e.ename, d.dname, dno from employee e natural join department d where e.eno = 7788; -- 이렇게 dno를 e.으로 개별SELECT안해야됨

--2.5 JOIN USING (컬럼 이름만 같다면 ok 형식은 달라도 됨)
SELECT e.eno, e.ename, d.dname, dno from employee e join department d using(dno) where e.eno= 7788;

--2.6 JOIN ON
SELECT e.eno, e.ename, d.dname, e.dno FROM employee e join department d ON e.dno = e.dno where e.eno=7788;

--03 NON-EQUI JOIN (조건을 테이블의 컬럼으로 걸고 행을 남기기)
SELECT * FROM SALGRADE;
SELECT ename, salary, grade from employee, salgrade where salary between losal and hisal;
--3개의 테이블 조인하기
SELECT e.ename, d.dname, e.salary, s.grade FROM employee e, department d, salgrade s WHERE e.dno = d.dno and salary between losal and hisal;

--04 SELF JOIN
--WHERE 절을 사용한 SELF JOIN
SELECT employees.ename as "사원이름", manager.ename as "직속상관이름" FROM employee employees, employee manager
WHERE employees.manager = manager.eno;

SELECT employees.ename ||'의 직속 상관은'|| manager.ename
FROM employee employees join employee manager on employees.manager = manager.eno;


--05 OUTER JOIN
--(+)기호를 사용한 OUTER JOIN
SELECT employees.ename ||'의 직속 상관은'|| manager.ename from employee employees join employee manager
on employees.manager = manager.eno(+);

SELECT employees.ename ||'의 직속 상관은'|| manager.ename from employee employees left outer join employee manager
on employees.manager = manager.eno;



--혼자해보기
--01 EQUI 조인을 사용하여 SCOT 사원의 부서번호와 부서이름을 출력하시오.
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

SELECT ENAME, e.DNO, DNAME FROM employee e, department d WHERE e.dno = d.dno and ENAME = 'SCOTT';

--02 INNER JOIN 과 ON 연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하시오.
SELECT ename, dname, loc FROM employee e join department d on e.dno = d.dno order by dname;

--03 INNER JOIN 과 USING 연산자를 사용하여 10번 부서에 속하는 모든 담당 업무의 고유목록 (한번씩만 표시)을 부서의 지역명을 포함하여 출력하시오.
SELECT dno, job, loc from employee join department using(dno) WHERE dno=10;

--04 NATURAL JOIN을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력하시오.
SELECT ename, dname, loc FROM employee NATURAL JOIN department where commission>0;

--05 EQUI 조인과 WILDCARD를 사용하여 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하시오.
SELECT ename, dname FROM employee e, department d WHERE e.dno = d.dno and ename like '%A%';

--06 NATURAL JOIN을 사용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오
SELECT ENAME, JOB, DNO, DNAME FROM employee NATURAL JOIN department WHERE LOC = 'NEW YORK';

--07 SELF JOIN을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력하시오, 단 각 열의 별칭은 결과 화면과 같도록 하시오.
SELECT * FROM employee;
SELECT e1.ename Employee, e1.manager EMP#, m1.eno, m1.ename Mgr# FROM employee e1, employee m1 WHERE e1.manager = m1.eno order by e1.manager;

--08  OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오
SELECT * FROM employee;
SELECT e1.ename Employee, e1.manager Emp#, m1.eno Manager, m1.ename Mgr# FROM employee e1, employee m1 WHERE e1.manager = m1.eno(+) order by e1.eno desc;

--09 SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. 단, 각 열의 별칭은 이름, 부서번호, 동료로 하시오.
SELECT * FROM employee;
SELECT e1.ename 이름, e1.dno 부서번호, e2.ename 동료 FROM employee e1, employee e2 WHERE e1.dno = e2.dno AND e1.ename = 'SCOTT' AND e2.ename != 'SCOTT';

--10 SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
SELECT * FROM employee;
SELECT e2.ename ENAME, e2.hiredate HIREDATE FROM employee e1, employee e2 WHERE e2.hiredate > e1.hiredate AND e1.ename='WARD' ORDER BY HIREDATE;

--11 SELF JOIN을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오. 단 각열의 별칭은 결과 화면과 같도록 하시오.
SELECT * FROM employee;
SELECT al.ename ENAME, al.hiredate HIREDATE, manager.ename ENAME, manager.hiredate FROM employee al, employee manager WHERE al.manager = manager.eno AND manager.hiredate >= al.hiredate;


--혼자해보기 다시해보기
--01 SCOTT 사원의 부서번호와 부서이름을 출력하기
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, dno, dname FROM employee natural join department WHERE ename = 'SCOTT';

--02 INNER JOIN과 ON연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하시오.
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, dname, loc FROM employee e join department d on e.dno = d.dno order by dname;

--03 INNER JOIN과 USING 연산자를 사용하여 10번 부서에 속하는 모든 담당업무의 고유목록(한 번씩만 표시)을 부서의 지역명을 포함하여 출력하시오.
SELECT * FROM employee;
SELECT * FROM department;

SELECT dno, job, loc FROM employee e join department d using(dno) WHERE dno = 10;

--04 NATURAL JOIN을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력하시오.
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, dname, loc FROM employee e NATURAL JOIN department WHERE e.commission > 0;

--05 EQUI 조인과 WildCard를 사용하여 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하시오
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, dname FROM employee e, department d WHERE e.dno = d.dno AND e.ename LIKE '%A%';

--06 NATURAL JOIN을 사용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, job, dno, dname FROM employee e NATURAL JOIN department d WHERE d.loc = 'NEW YORK';

--07 SELF JOIN을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력하시오. 단, 각 열의 별칭으 ㄴ결과 화면과 같도록 하시오.
SELECT * FROM employee;
SELECT * FROM department;

SELECT e1.ename, e1.eno, m1.ename, m1.eno FROM employee e1, employee m1 WHERE e1.manager = m1.eno;

--08 OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
SELECT e1.ename, e1.eno, m1.ename, m1.eno FROM employee e1, employee m1 WHERE e1.manager = m1.eno(+) ORDER BY e1.eno DESC;

SELECT * FROM employee;
--09 SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. 단 각열의 별칭은 이름 부서번호 동료로 하시오
SELECT e1.ename, e1.dno, e2.ename FROM employee e1, employee e2 WHERE e1.dno=e2.dno AND e1.ename = 'SCOTT' AND e2.ename != 'SCOTT';

--10 SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
SELECT other.ename, other.hiredate FROM employee ward, employee other WHERE ward.hiredate < other.hiredate AND ward.ename = 'WARD' order by other.hiredate;

--11 SELF JOIN을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오. 단, 각 열의 별칭은 결과 화면과 같도록 하시오.
SELECT e1.ename, e1.hiredate, m1.ename, m1.hiredate FROM employee e1, employee m1 WHERE e1.manager = m1.eno AND e1.hiredate <= m1.hiredate;