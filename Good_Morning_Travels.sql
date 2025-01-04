-- CREATE MODULES --

-- Bus -- 
create table if not exists bus(
serviceno int primary key,
busno int not null,
source varchar(40) not null,
destination varchar(40) not null,
dpttime varchar(10) not null);

-- Passenger -- 
create table passenger(id int,name varchar(10),dob date,city varchar(10),emailid varchar(20),primary key(id));

-- Bill -- 
create table bill(billno int,billdate date,passid int,serviceno int,tikid int,carid int,fare int,primary key(billno),foreign key(serviceno) references bus(serviceno),foreign key(passid) references passenger(id),foreign key(tikid) references ticket(tikid),foreign key(carid) references cargo(carid));

-- Ticket -- 
create table ticket(tikid int,serviceno int,total int,available int,fare int,primary key(tikid),foreign key(serviceno) references bus(serviceno));

-- Cargo -- 
create table cargo(carid int,serviceno int,fare int,primary key(carid),foreign key(seviceno) references bus(serviceno));

-- Driver -- 
create table driver(did int,dname varchar(20),dob date,salary int,serviceno int,primary key(did),foreign key(serviceno) references bus(serviceno));


-- Worker -- 
create table worker(wid int,w_name varchar(20),dob date,salary int,serviceno int,primary key(wid),foreign key(serviceno) references bus(serviceno));

-- Bookingdetails -- 
create table bookingdetails(sno int,billid int,date date,category varchar(10),fare int,primary key(sno),foreign key(billid) references bill(billno));


-- INSERTION MODULES -- 

-- Bus -- 
insert into bus values(101,1201,'vijayawada','hyderabad','18:00');
insert into bus values(102,1202,'guntur','bangalore','19:45');
insert into bus values(103,1302,'vijayawada','chennai','16:30');
insert into bus values(104,1401,'vijayawada','bangalore','19:00');
insert into bus values(105,1503,'vijayawada','vizag','20:30');
insert into bus values(106,1601,'guntur','hyderabad','18:30');

-- Passenger -- 
insert into passenger values(1,'maheedhar','1998-10-12','tenali','t.mahee16@gmail.com');
insert into passenger values(2,'aditya','1997-11-05','vijayawada','aditya5@gmail.com');
insert into passenger values(3,'nitesh','1998-08-02','tenali','niteshsaip@gmail.com');
insert into passenger values(4,'naveen','1998-08-03','vizag','naveen38@gmail.com');
insert into passenger values(5,'prafulla','1997-11-29','hyderabad','vskpc@gmail.com');
insert into passenger values(6,'yashpaul','1997-10-29','vijayawada','yashpaul@gmail.com');

-- Ticket -- 
insert into ticket values(01,101,55,30,500);
insert into ticket values(02,102,40,10,900);
insert into ticket values(03,103,45,30,600);
insert into ticket values(04,104,50,20,950);
insert into ticket values(05,105,60,40,500);
insert into ticket values(06,106,45,40,500);

-- Cargo -- 
insert into cargo values(011,101,1000);
insert into cargo values(012,102,1200);
insert into cargo values(013,103,900);
insert into cargo values(014,104,1500);
insert into cargo values(015,105,800);
insert into cargo values(016,106,800);

-- Driver -- 
insert into driver values(011,'ravi','1980-12-10',10000,101);
insert into driver values(012,'vamsi','1975-05-01',15000,102);
insert into driver values(013,'srinivas','1972-06-11',12000,103);
insert into driver values(014,'raghu','1972-11-08',12000,104);
insert into driver values(015,'venkat','1975-12-22',13000,105);
insert into driver values(016,'suresh','1973-08-15',14000,106);

-- Worker --
insert into worker values(101,'tarun','1978-11-10',5000,101);
insert into worker values(102,'ram','1975-10-21',4500,102);
insert into worker values(103,'krishna','1982-06-19',6000,103);
insert into worker values(104,'prabhu','1979-04-18',7000,104);
insert into worker values(105,'kishore','1985-02-28',5500,105);
insert into worker values(106,'charan','1980-12-02',5000,106);

-- Bill --
insert into bill(billno,billdate,passid,serviceno,tikid,fare) values(1101,'1985-02-28',3,101,01,1000);
insert into bill(billno,billdate,passid,serviceno,carid,fare) values(1102,'2017-04-07',2,102,012,2400);
insert into bill(billno,billdate,passid,serviceno,tikid,fare) values(1103,'2017-01-04',1,103,03,1200);
insert into bill(billno,billdate,passid,serviceno,tikid,fare) values(1104,'2015-05-15',6,104,04,950);
insert into bill(billno,billdate,passid,serviceno,carid,fare) values(1105,'2016-10-20',4,105,015,800);
insert into bill(billno,billdate,passid,serviceno,tikid,fare) values(1106,'2016-12-18',5,106,06,1000);

-- Booking Details --
insert into bookingdetails values(1,1103,'2017-01-04','ticket',1200);
insert into bookingdetails values(2,1101,'1985-02-28','ticket',1000);
insert into bookingdetails values(3,1102,'2017-04-07','cargo',2400);
insert into bookingdetails values(4,1104,'2015-05-15','ticket',950);
insert into bookingdetails values(5,1105,'2016-10-20','cargo',800);
insert into bookingdetails values(6,1106,'2016-12-18','ticket',1000);


-- SQL QUERIES RELATED TO REPORT GENERATION -- 

-- <Q1> List of worker details and serviceno whose salary is greater than 5000. -- 
select w.wid,w.w_name,b.serviceno from worker w inner join bus b on w.serviceno=b.serviceno where w.salary>5000;

-- <Q2> Details of the drivers and workers who work in bus whose destination is hyderabad. -- 
select w.wid,w.w_name,w.salary as worker_salary,d.did,d.dname,d.salary as driver_salary from worker w inner join driver d inner join bus b on w.serviceno=b.serviceno and d.serviceno=b.serviceno where b.destination='hyderabad';

-- <Q3> Details of buses whose source is guntur. -- 
select b.serviceno,b.busno,b.destination,b.dpttime from bus b where b.source='guntur'; 

-- <Q4> Details of bills that are done after 2015-12-31. --
select b.billno,b.billdate,b.passid,s.source,s.destination,b.fare from bill b inner join bus s on b.serviceno=s.serviceno where b.billdate>'2015-12-31';

-- <Q5> Details of passengers and bill who reserved for buses of service no 101 and 102. --
select p.id,p.name,b.billno,b.fare,s.serviceno from bill b inner join passenger p inner join bus s on b.passid=p.id and b.serviceno=s.serviceno where s.serviceno in(101,102);

-- <Q6> List of workers whose name starts with the letter 'k'. --
select wid,w_name from worker where w_name like 'k%';

-- <Q7> Total number of workers woking in the company. --
select count(did) as total_drivers from driver;

-- <Q8> Total salary given to workers who work in buses that start from vijayawada. --
select sum(salary) as salary from worker w inner join bus b on w.serviceno=b.serviceno where b.source='vijayawada';

-- <Q9> Details of drivers and workers where drivers salary is maximum salary among others. --
select * from driver d inner join worker w on d.serviceno=w.serviceno where d.salary=(select max(d.salary) from driver d);

-- <Q10> Details of total workers, drivers and sum of their salaries from every different source. --
select b.source,count(d.did) as total_drivers,sum(d.salary) as total_drivers_salary,count(w.wid) as total_workers,sum(w.salary) as total_workers_salary from driver d inner join worker w inner join bus b on d.serviceno=w.serviceno and d.serviceno=b.serviceno 
group by(b.source);








