use vit;
select*from worker where (worker_id % 2=0) AND (department in ("HR","Admin")) AND (salary =(Select MAX(salary) from worker));
select *from worker where (salary between 200000 and 300000) and department Not in ("HR","Account"); 
select * from worker where salary not between 200000 and 300000;
#Aggregrate functions 
SELECT MIN(Salary) FROM worker;
select max(Salary) from worker;
select avg(salary) as average from worker;
desc worker;
select count(first_name) as totalworkers from worker;
create table worker1(
worker_id INT PRIMARY KEY auto_increment,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE datetime,
DEPARTMENT CHAR(25));
INSERT INTO Worker1 (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
select distinct(department) from worker;
#union
select department from worker union
select department from worker1;
#union all
select department from worker union all select department from worker1;
select first_name from worker union select first_name from worker1 where department="HR";

Select first_name ,salary,
CASE
    When salary>300000 THEN "Rich people"
    When salary <=300000 && salary>=100000 THEN "MIDDLE CLASS"
    When salary <=100000  && Salary >=0 then "POOR CLASS"
    ELSE "Data not found"
END
as Status_checksalary
from worker;
SELECT *
FROM worker
ORDER BY salary DESC;
select *from worker order by first_name asc, last_name desc;
select *from worker where first_name like '%a_a';
select * from worker where first_name like "_i%" and last_name like "s%";
select * from worker where first_name like"___%";
SELECT *
FROM worker
WHERE (LEFT(first_name, 1)) IN ("M","N");
create or replace view admin_team as select * from worker where department="Admin";
create view hr_team as select * from worker where department="HR";
select * from admin_team;
select*from hr_team;


    


