use vit;
SELECT department, SUM(salary) AS total_salary
FROM worker
GROUP BY department
ORDER BY total_salary ASC
LIMIT 1;
select department,count(department) from worker group by department having count(department)>3;
SELECT department, SUM(salary)
FROM worker
GROUP BY department
ORDER BY SUM(salary) DESC
LIMIT 1 OFFSET 2;
select *from worker where salary=(Select max(salary) from worker);
#recent employee
select * from worker where joining_date=(select min(joining_date) from worker);
SELECT first_name, salary
FROM worker
WHERE department = 'HR'
  AND salary = (SELECT MAX(salary) FROM worker WHERE department = 'HR');
  
create table student(
s_id int,
s_name varchar(25)
);
insert into student values (101,'jayanth'),(102,'karthik'),(103,'Praveen'),(105,'mahesh'),(106,'Arun');
create table address(
s_id int,
s_address varchar(25));
insert into address values (101,'coimbatore'),(104,'chennai'),(105,'pune');
select * from student cross join address;
select * from student inner join address where student.s_id=address.s_id;
select * from student natural join address;
select * from student left outer join address on(student.s_id=address.s_id);
select *
from worker w1
where 5 = (
    select count(distinct salary)
    from worker w2
    where w2.salary >= w1.salary
);


