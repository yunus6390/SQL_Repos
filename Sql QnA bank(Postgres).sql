CREATE table Worker
    ( Worker_id serial primary key ,
 	  First_name char(50),
 	  Last_name char(50),
	  Salary int,
	  Joining_Date date,
	  Depatment char(50)
 
);

select * from worker
insert into Worker 
			VALUES (001,'Monika','Arora',100000,'2014/02/20','HR'),
					(002,'Niharika','Verma',80000,'2014/06/11','Admin'),
					(003,'vishal','Singhal',300000,'2014/02/20','HR'),
					(004,'Amitabh','Singh',500000,'2014/02/20','Admin'),
					(005,'Vivek','Bhati',500000,'2014/06/11','Admin'),
					(006,'Vipul','Diwan',200000,'2014/06/11','Account'),
					(007,'Satish','Kumar',75000,'2014/01/20','Account'),
					(008,'Geetika','Chauhan',90000,'2014/04/11','Admin');
delete from worker
select * from Worker
create table Bonus
			(Worker_Ref_ID int,
			Bonus_Amount int,
			 Bonus_Date date,
			foreign key  (Worker_Ref_ID) references worker(Worker_ID)
			 on delete cascade
			);
INSERT INTO Bonus Values
						(001,5000,'2016/02/20'),
						(002,3000,'2016/06/11'),
						(003,4000,'2016/02/20'),
						(001,5000,'2016/02/20'),
						(002,5000,'2016/06/11');
						
delete from bonus;
select * from Bonus						
CREATE table Title (
					Worker_Ref_ID int,
					Worker_Title Char(25),
					Affected_From Date,
					foreign key (Worker_Ref_ID)
					references Worker(worker_id)
					On delete cascade
);
select * from worker

Insert into Title Values
		(001,'Manager','2016/02/20'),
		(008,'Executive','2016/06/11'),
		(005,'Executive','2016/06/11'),
		(004,'Asst.Manager','2016/06/11'),
		(007,'Executive','2016/06/11'),
		(006,'Lead','2016/06/11'),
		(003,'Lead','2016/06/11');

--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select First_name from worker as worker_name

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(First_name) from Worker as First_Name

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker;
alter table worker rename column depatment to department

--Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
select substring(First_Name,1,3) from worker;

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) 
--in the first name column ‘Amitabh’ from Worker table.
SELECT position('a'in 'amitabh') 

--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after
--removing white spaces from the right side.
Select RTRIM(FIRST_NAME) from Worker;

--Q-7. Write an SQL query to print the DEPARTMENT from Worker table
--after removing white spaces from the left side.

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT
--from Worker table and prints its length.

SELECT DISTINCT LEN(department) FROM WORKER;
select * from worker;

--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after
--replacing ‘a’ with ‘A’.
Select REPLACE(FIRST_NAME,'a','A') from Worker;

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from
--Worker table into a single column COMPLETE_NAME. A space char
--should separate them.

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME FROM WORKER

--Q-11. Write an SQL query to print all Worker details from the Worker table
--order by FIRST_NAME Ascending.
SELECT * FROM WORKER ORDER BY FIRST_NAME

--Q-12. Write an SQL query to print all Worker details from the Worker table
--order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC, DEPATMENT DESC;

--Q-13. Write an SQL query to print details for Workers with the first name
--as “Vipul” and “Satish” from Worker table.

SELECT * FROM WORKER 
WHERE FIRST_NAME IN ('Vipul','Satish')

--Q-14. Write an SQL query to print details of workers excluding first
--names, “Vipul” and “Satish” from Worker table.		
SELECT * FROM WORKER 
WHERE FIRST_NAME NOT IN ('Vipul','Satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT
--name as “Admin”.
SELECT * FROM WORKER WHERE DEPATMENT LIKE 'ADMIN'

--Q-16. Write an SQL query to print details of the Workers whose
--FIRST_NAME contains ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE'%A%';

--Q-17. Write an SQL query to print details of the Workers whose
--FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE'%A';

--Q-18. Write an SQL query to print details of the Workers whose
--FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____H';

--Q-19. Write an SQL query to print details of the Workers whose SALARY
--lies between 100000 and 500000
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;

--Q-20. Write an SQL query to print details of the Workers who have joined
--in Feb’2014.
SELECT * FROM WORKER WHERE YEAR(joining_date) = 2014 AND MONTH(JOINING_DATE) = 2; 

--Q-21. Write an SQL query to fetch the count of employees working in the
--department ‘Admin’.
SELECT COUNT(*) FROM WORKER WHERE DEPARTMENT = 'ADMIN'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000
--and <= 100000.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS NAMES, SALARY FROM WORKER
WHERE WORKER_ID IN
(SELECT WORKER_ID FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000);

--Q-23. Write an SQL query to fetch the no. of workers for each department
--in the descending order.
SELECT Department, COUNT(WORKER_ID) NO_OF_WORKER 
FROM WORKER GROUP BY DEPARTMENT
ORDER BY  NO_OF_WORKER DESC;
SELECT * FROM WORKER

--Q-24. Write an SQL query to print details of the Workers who are also
--Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

--Q-25. Write an SQL query to fetch duplicate records having matching data
--in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;
select * from Title

--Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;

--Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;

--Q-28. Write an SQL query to clone a new table from another table.
SELECT * INTO WorkerClone FROM Worker;
select * from workerClone



--Q-30. Write an SQL query to show records from one table that another (not working in postgres)
--table does not have.
SELECT * FROM Worker
MINUS
SELECT * FROM Title;

--Q-31. Write an SQL query to show the current date and time.
SELECT CURDATE(); --x
SELECT NOW();  	  --y
SELECT getdate(); --x
SELECT SYSDATE    --x

--Q-32. Write an SQL query to show the top n (say 5) records of a table.
select * from worker
order by salary desc limit 5;


SELECT * FROM Worker ORDER BY Salary DESC LIMIT 5;
SELECT TOP 10 FROM Worker ORDER BY Salary DESC; 					--x
SELECT * FROM (SELECT * FROM Worker ORDER BY Salary DESC)
WHERE ROWNUM <= 10;   												--x

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary
--from a table.
SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT 5-1,1;  		--x
SELECT TOP 1 Salary													--x
FROM (
SELECT DISTINCT TOP n Salary
FROM Worker
ORDER BY Salary DESC
)
ORDER BY Salary ASC;

select distinct top salary from worker 								--x
order by salary desc

select * from worker

select * from worker w1
where (0)= (select count(distinct(w2.salary))
from worker w2
where w2.salary > w1.salary)

--Q-34. Write an SQL query to determine the 5th highest salary without
--using TOP or limit method.

SELECT Salary
FROM Worker W1
WHERE 4 = (
SELECT COUNT( DISTINCT ( W2.Salary ) )
FROM Worker W2
WHERE W2.Salary >= W1.Salary
);

--Q-35. Write an SQL query to fetch the list of employees with the same salary.
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary
from Worker W, Worker W1
where W.Salary = W1.Salary
and W.WORKER_ID != W1.WORKER_ID;

--Q-36. Write an SQL query to show the second highest salary from a table.
Select max(Salary) from Worker
where Salary not in (Select max(Salary) from Worker);

--Q-37. Write an SQL query to show one row twice in results from a table.
select FIRST_NAME, DEPARTMENT from worker W where
W.DEPARTMENT='HR'
union all
select FIRST_NAME, DEPARTMENT from Worker W1 where
W1.DEPARTMENT='HR';

--Q-38. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);

--Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT *
FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

--Q-40. Write an SQL query to fetch the departments that have less than
--five people in it.
SELECT DEPARTMENT, COUNT(WORKER_ID) as Number_of_Workers FROM
Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 3;

--Q-41. Write an SQL query to show all departments along with the number
--of people in there.
SELECT DEPARTMENT, COUNT(DEPARTMENT) as Number_of_Workers
FROM Worker GROUP BY DEPARTMENT;

--Q-42. Write an SQL query to show the last record from a table.
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID)
from Worker);

--Q-43. Write an SQL query to fetch the first row of a table.
Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID)
from Worker);

--Q-44. Write an SQL query to fetch the last five records from a table.
SELECT * FROM Worker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID
DESC) AS W1 WHERE W1.WORKER_ID <=5;

--Q-45. Write an SQL query to print the name of employees having the
--highest salary in each department.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT
max(Salary) as TotalSalary,DEPARTMENT from Worker group by
DEPARTMENT) as TempNew
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT
and TempNew.TotalSalary=t.Salary;

--Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT
count(distinct Salary) from worker b WHERE a.Salary <=
b.Salary) order by a.Salary desc;

--Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT
count(distinct Salary) from worker b WHERE a.Salary >=
b.Salary) order by a.Salary desc;

--Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT distinct Salary from worker a WHERE (1) >= (SELECT
count(distinct Salary) from worker b WHERE a.Salary <=
b.Salary) order by a.Salary desc;

--Q-49. Write an SQL query to fetch departments along with the total
--salaries paid for each of them.
SELECT DEPARTMENT, sum(Salary) from worker group by
DEPARTMENT;

--Q-50. Write an SQL query to fetch the names of workers who earn the
--highest salary.
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT
max(SALARY) from Worker);