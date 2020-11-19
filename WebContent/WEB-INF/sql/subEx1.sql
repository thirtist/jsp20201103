SELECT manager FROM employee WHERE eno = 7499;

SELECT ename FROM employee WHERE eno = 7698;

SELECT ename FROM employee WHERE eno = (SELECT manager FROM employee WHERE eno = 7499);

-- 다중 행 서브 쿼리
/*
IN          값이 하나라도 있으면
ANY(SOME)   하나 이상이 만족하면
ALL         모두 만족하면
*/

SELECT ename, dno FROM employee WHERE dno IN (SELECT dno FROM department WHERE dno <= 20);