SELECT * FROM emplyee;
SELECT * FROM employee WHERE ename = 'WARD';
SELECT * FROM employee WHERE ename LIKE 'W%';
SELECT * FROM employee WHERE ename LIKE '%D';
SELECT * FROM employee WHERE ename LIKE '%D%';
SELECT * FROM employee WHERE ename LIKE '_A__';

SELECT * FROM employee WHERE commission IS NULL;
SELECT * FROM employee WHERE commission IS NOT NULL;

SELECT * FROM employee ORDER BY eno;
SELECT * FROM employee WHERE salary > 2000 ORDER BY eno;
SELECT * FROM employee ORDER BY eno DESC;
SELECT dno, ename FROM employee ORDER BY dno, ename;
SELECT dno, ename FROM employee ORDER BY dno DESC, ename;
