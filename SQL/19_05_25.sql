use vit;
show tables;
#drop table tablename
create table vellore(
name varchar(30),
regno varchar(30) Primary key);
show tables;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
use vit;
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
delete from worker where Department="Admin";
truncate table worker;
select *from worker;
use vit;
create table cse(
id int,
name varchar(30));
start transaction;
insert into cse values(1001,"adithya");
savepoint a11;
insert into cse values(1002,"ashwin");
savepoint a12;
delete from cse where id=1002;
commit;
select *from cse;
rollback to a12;
select *from cse;
select first_name as employee_name from worker;
select first_name,department from worker where salary>=300000;
select first_name from worker where department="HR";
select  first_name from worker where joining_date>2015;
select first_name from worker where salary>=200000 AND department="HR";
select first_name,department from worker where salary<=200000 AND (department="HR" OR department="Admin");
select * from worker where (salary>100000 AND salary<300000)  AND(department="Admin" or department="Account");
select *from worker where department in ("HR","Admin");
select*from worker where (worker_id % 2=0) AND (department in ("HR","Admin")) AND (salary =(Select MAX(salary) from worker));
