create database edyoda_assingment;
use edyoda_assingment;

create table SalesPerson(
snum int ,
primary key (snum),
sname varchar(255) unique key,
city varchar(45),
comm int
);

insert into SalesPerson(snum,sname,city,comm)values (1001,'Peel','london',12);
insert into SalesPerson(snum,sname,city,comm)values (1002,'Serres','sanjose',13);
insert into SalesPerson(snum,sname,city,comm)values (1004,'Sotika','london',11);
insert into SalesPerson(snum,sname,city,comm)values (1007,'Rifkin','barcelona',15);
insert into SalesPerson(snum,sname,city,comm)values (1003,'Axelrod','newyork',10);

select * from SalesPerson;

create table customers(
cnum int ,
primary key (cnum),
cname varchar(45),
city varchar(45) not null,
snum int,
foreign key (snum) references SalesPerson(snum)
);

insert into customers(cnum,cname,city,snum)values (2001,'Hoffman', 'London',1001);
insert into customers(cnum,cname,city,snum)values (2002,'Giovani', 'Rome',1003);
insert into customers(cnum,cname,city,snum)values (2003,'Liu', 'Sanjose',1002);
insert into customers(cnum,cname,city,snum)values (2004,'Grass', 'Berlin',1002);
insert into customers(cnum,cname,city,snum)values (2006,'Clemens', 'London',1001);
insert into customers(cnum,cname,city,snum)values (2008,'Cisneros', 'Sanjose',1007);
insert into customers(cnum,cname,city,snum)values (2007,'Pereira', 'Rome',1004);

select * from customers;

create table orders(
onum int ,
primary key(onum),
amt float,
odate date,
cnum int,
snum int,
foreign key (cnum) references customers(cnum),
foreign key (snum) references SalesPerson(snum)
);

insert into orders(onum,amt,odate,cnum,snum) values(3001,18.69,'1990-10-3',2008,1007);
insert into orders(onum,amt,odate,cnum,snum)values (3003,767.19,'1990-10-3',2001,1001);
insert into orders(onum,amt,odate,cnum,snum)values (3002,1900.10,'1990-10-3',2007,1004);
insert into orders(onum,amt,odate,cnum,snum)values (3005,5160.45,'1990-10-3',2003,1002);
insert into orders(onum,amt,odate,cnum,snum)values (3006,1098.16,'1990-10-3',2008,1007);
insert into orders(onum,amt,odate,cnum,snum)values (3009,1713.23,'1990-10-4',2002,1003);
insert into orders(onum,amt,odate,cnum,snum)values (3007,75.754,'1990-10-4',2004,1002);
insert into orders(onum,amt,odate,cnum,snum)values (3008,4273.00,'1990-10-5',2006,1001);
insert into orders(onum,amt,odate,cnum,snum)values (3010,1309.95,'1990-10-6',2004,1002);
insert into orders(onum,amt,odate,cnum,snum)values (3011,9891.88,'1990-10-6',2006,1001);

select * from orders;

#QUES-->>1- count the number of salesperson whose name begin with "a"/"A"
  
select  count(sname) as no_of_salesperson from SalesPerson where sname like '%A';


#QUES-->>2 display al the salesperson whose all orser worth more than rs.2000
select sp.sname,o.amt from SalesPerson as sp
inner join orders as o on sp.snum = o.snum
where o.amt >2000;


#QUS-->>3 count number of salesperson belonging to newyork
select  count(sname) as city_name from SalesPerson where city ='newyork';

#QUS-->>4 display the number of sales person belonging to london anf beonging to paris
select  * from SalesPerson where city in('london','paris');

#QUS-->>5 display the number of orders taen by each salesperson and their date of orders

select SalesPerson.sname, count(orders.onum) as 'numbers of orders', orders.odate
from SalesPerson
inner join orders on SalesPerson.snum = orders.snum
group by SalesPerson.sname,orders.odate;