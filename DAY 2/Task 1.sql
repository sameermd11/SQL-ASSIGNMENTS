--HANDS-ON
----------
SELECT e2.EName, e1.Salary, e1.Ename AS MANAGER_NAME FROM EMP e1 JOIN EMP e2 ON e1.EmpNo=e2.MgrId;

SELECT MgrId, COUNT(EmpNo) AS NUMBER_OF_EMPLOYEES FROM EMP WHERE MgrId IS NOT NULL GROUP BY MgrId ORDER BY NUMBER_OF_EMPLOYEES DESC;

--QUERY-1
---------

SELECT DISTINCT(e1.EmpNo), e1.EName FROM EMP e1 JOIN EMP e2 ON e1.EmpNo=e2.MgrId;

--QUERY-2
---------

SELECT EName, Salary AS SALARY_PER_MONTH FROM EMP WHERE SALARY>1000;

--QUERY-3
---------

SELECT EName, Salary FROM EMP WHERE EName!='JAMES';

--QUERY-4
---------

SELECT * FROM EMP WHERE EName LIKE 'S%';

--QUERY-5
---------

SELECT EName FROM EMP WHERE EName LIKE '%A%';

--QUERY-6
---------

SELECT EName FROM EMP WHERE EName LIKE '__L%';

--QUERY-7
---------

SELECT EName, Salary/30 AS SALARY_PER_DAY FROM EMP WHERE EName='JONES';

--QUERY-8
---------

SELECT SUM(SALARY) AS TOTAL_MONTHLY_SALARY FROM EMP;

--QUERY-9
---------

SELECT AVG(SALARY*12) AS AVERAGE_SALARY_PER_ANNUM FROM EMP;

--QUERY-10
----------

SELECT EName, Job, Salary, DeptNo FROM EMP WHERE Job!='SALESMAN' AND DeptNo!=20;

--QUERY-11
----------

SELECT DISTINCT(e1.DeptNo), d1.DName FROM EMP e1 JOIN DEPT d1 ON e1.DeptNo=d1.DeptNo;

--QUERY-12
----------

SELECT EName AS Employee, Salary AS Monthly_Salary FROM EMP WHERE Salary>1500 AND (DeptNo=10 OR DeptNo=30); 

--QUERY-13
----------

SELECT EName, Job, Salary FROM EMP WHERE (JOB='MANAGER' OR JOB='ANALYST') AND Salary!=1000 AND Salary!=3000 AND Salary!=5000;

--QUERY-14
----------

SELECT EName, Salary, Comm, (Salary+Salary*0.1) AS SALARY_INCREASED_BY_10_PERCENT FROM EMP WHERE Comm> (Salary+Salary*0.1);

--QUERY-15
----------

SELECT EName, DeptNo, MgrId FROM EMP WHERE EName LIKE '%L%L%' AND (DeptNo=30 OR MgrId=7782);

--QUERY-16
----------

SELECT EName FROM EMP WHERE (DATEDIFF(YEAR, HireDate, GETDATE())>10 AND DATEDIFF(YEAR, HireDate, GETDATE())<20);

--QUERY-17
--------

SELECT DEPT.DName, EMP.EName FROM EMP, DEPT WHERE EMP.DeptNo=DEPT.DeptNo ORDER BY DName ASC, EName DESC;

--QUERY-18
----------

SELECT EName, DATEDIFF(YEAR, HireDate, GETDATE()) AS EXPERIENCE_YEARS FROM EMP WHERE EName='MILLER';