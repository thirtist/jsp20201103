1. 사원번호가 7788인 사원과
담당 업무가 같은 사원을 표시 (사원이름과 담당 업무)하시오.
SELECT ename,job FROM employee WHERE job = (SELECT job FROM employee WHERE eno = 7788);

2. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시 (사원이름과 담당업무)하시오.
SELECT * FROM employee;

3.최소급여를 받는 사원의 이름, 담당 업무및 급여를
표시하시오(그룹함수 사용).

4.평균 급여가 가장 적은 사원의 담당 업무를 찾아 
직급과 평균 급여를 표시하시오

5.각 부서의 최소 급여를 받는 사원의
이름, 급여, 부서번호를 표시하시오

6. 담당업무가 분석가(analyst)인 사원보다
급여가 적으면서 업무가
분석가(analyst)가 아닌 사원들을
표시(사원번호, 이름, 업무, 급여)하시오

7. 부하직원이 없는 사원이 이름을 표시하시오.

8.부하직원이 있는 사원의 이름을 표시하시오

9. BLAKE와 동일한 부서에 속한 사원의 이름과
입사일을 표시하는 질의를 작성하시오
(단 BLAKE는 제외)

10. 급여가 평균 급여 보다 많은 사원들의 사원번호와
이름을 표시하되 결과를 급여에 대해서 오름차수능로
정렬하시오.

11. 이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의
사원번호와 이름을 표시하는 질의를 작성하시오

12.부서 위치가 DALLAS인 사원의 이름과
부서번호 및 담당업무를 표시하시오.

13. KING에게 보고하는 사원의
이름과 급여를 표시하시오.

14. RESEARCH 부서의 사원에 대한 부서번호,
사원이름 및 업무를 표시하시오.

15. 평균 급여보다 많은 급여를 받고 이름에 M이 포함된
사원과 같은 부서에서 근무하는 사원의 사원번호, 이름,
급여를 표시하시오.

16.평균 급여가 가장 적은 업무를 찾으시오

17. 담당업무가 MANAGER인 사원이 소속된 부서와 동일한 
부서의 사원을 표시하시오.
