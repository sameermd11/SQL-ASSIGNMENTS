CREATE DATABASE EmployeeDB

CREATE TABLE DEPT
(
	DeptNo int primary key,
	DName varchar(30),
	Dloc varchar(30)
)

CREATE TABLE EMP
(
	EmpNo int primary key,
	EName varchar(30),
	Job varchar(30),
	MgrId int,
	HireDate date,
	Salary float,
	Comm float,
	DeptNo int references DEPT(DeptNo)
)

INSERT INTO DEPT VALUES(10, 'ACCOUNTING', 'NEW YORK'), (20, 'RESEARCH', 'DALLAS'),(30, 'SALES', 'CHICAGO'), (40, 'OPERATIONS', 'BOSTON')

SELECT * FROM EMP

INSERT INTO EMP(EmpNo, EName, Job, MgrId, HireDate, Salary, DeptNo) VALUES(7369, 'SMITH','CLERK', 7902, '1980-12-17', 800, 20)

INSERT INTO EMP VALUES(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30), 
					  (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
					  (7566, 'JONES', 'MANAGER', 7838, '1981-04-02', 2975, NULL, 20),
					  (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
					  (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
					  (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
					  (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, NULL, 20),
					  (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
					  (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
					  (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, NULL, 20),
					  (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
					  (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
					  (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10)

SELECT * FROM EMP

--QUERY-1
---------

SELECT * FROM EMP WHERE EName LIKE 'A%';


--QUERY-2
---------

SELECT * FROM EMP WHERE MgrId IS NULL;

--QUERY-3
---------

SELECT EmpNo, EName, Salary FROM EMP WHERE Salary BETWEEN 1200 AND 1400;

--QUERY-4
---------

SELECT  EmpNo, Ename, Salary as Old_Salary, Salary+Salary*0.1 as Updated_Salary FROM EMP, DEPT WHERE EMP.DeptNo=DEPT.DeptNo AND DEPT.DName='RESEARCH';

--QUERY-5
---------

SELECT COUNT(*) AS NUMBER_OF_CLERKS_EMPLOYED FROM EMP WHERE Job='CLERK';

--QUERY-6
---------

SELECT Job AS JOB_CATEGORY, AVG(Salary) AS AVERAGE_SALARY, COUNT(*) AS NUMBER_OF_EMPLOYEES FROM EMP GROUP BY Job;

--QUERY-7
---------

SELECT * FROM EMP WHERE Salary IN((SELECT MAX(Salary) FROM EMP) UNION (SELECT MIN(Salary) FROM EMP));

--QUERY-8
---------

SELECT * FROM DEPT WHERE DeptNo NOT IN(SELECT DeptNo from EMP);

--QUERY-9
---------

SELECT EName, Salary FROM EMP WHERE Job='Analyst' AND Salary>1200 AND DeptNo=20 ORDER BY EName ASC;

--QUERY-10
----------

SELECT DEPT.DeptNo, DEPT.DName, SUM(SALARY) AS TOTAL_SALARY FROM EMP, DEPT WHERE EMP.DeptNo=DEPT.DeptNo GROUP BY DEPT.DeptNo, DEPT.DName;

--QUERY-11
----------

SELECT EName, Salary FROM EMP WHERE EName='MILLER' UNION (SELECT Ename, Salary FROM EMP WHERE EName='SMITH');

--QUERY-12
----------

SELECT EName FROM EMP WHERE EName LIKE '[AM]%';

--QUERY-13
----------

SELECT EName, Salary*12 AS SALARY_PER_ANNUM FROM EMP WHERE EName='SMITH';

--QUERY-14
----------

SELECT EName, Salary FROM EMP WHERE Salary NOT BETWEEN 1500 AND 2850;
