create database tuesday;
use tuesday;
create table products(
c_id int primary key,
c_name varchar(25),
c_details varchar(25));
insert into customers values(101,"electronics","abcdefgh",32);
insert into customers values(102,"furnitures","hihello",45);
rename table products to customers;
create table products(
p_id int primary key,
p_name varchar(25),
p_details varchar(35));
ALTER TABLE products
ADD COLUMN customer_id INT;

ALTER TABLE products
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(c_id) on delete cascade;

insert into products values(502,"samsung","8gb ram",101);
ALTER TABLE products
DROP FOREIGN KEY fk_customer;
ALTER TABLE products
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(c_id)
ON DELETE CASCADE;


delete from customers where c_id=101;
select *from products;
Alter table customers  add constraint unique_id Unique(c_details);
alter table customers add column age int;
alter table customers add check(age>=18);
insert into  customers values(108,"Adithya","abcdefghmghjklopertsv",70);
