create database Company;
use Company;

create table Employee(
SSN int primary key,
Fname varchar(20),
Lname varchar(20),
Gender varchar(10),
DOB date
);
create table Department(
Dnumber int primary key,
Dname varchar(20)
);
create table location(
Dnum int,
loc varchar(20),
primary key (Dnum,loc),
FOREIGN KEY (Dnum) REFERENCES Department(Dnumber)
);
create table Project(
Pnum int primary key,
Pname varchar(20),
city varchar(20),
loca varchar(20),
DeptNum int,
FOREIGN KEY (DeptNum) REFERENCES Department(Dnumber)
);

create table WorkOn(
EmpId int,
projectId int,
primary key (EmpId,projectId),
FOREIGN KEY (EmpId) REFERENCES Employee(SSN),
FOREIGN KEY (projectId) REFERENCES Project(Pnum)
);

create table Dependent(
Dname varchar(20),
Gender varchar(10),
DoB date,
EmployeeId int,
primary key(Dname,EmployeeId),
FOREIGN KEY (EmployeeId) REFERENCES Employee(SSN)
);

alter table Employee
ADD DepartmentId int, 
SupervisourId int,
FOREIGN KEY (SupervisourId) REFERENCES Employee(SSN),
FOREIGN KEY (DepartmentId) REFERENCES Department(Dnumber);


alter table Department
add ManegerId int,
hiringDate date,
FOREIGN KEY (ManegerId) REFERENCES Employee(SSN);


insert into Employee(SSN, Fname, Lname, Gender, DOB)values
(1001, 'Ahmed', 'Ali', 'Male', '1990-05-14'),
(1002, 'Sara', 'Khalid', 'Female', '1995-08-22'),
(1003, 'Mohammed', 'Hassan', 'Male', '1988-12-03'),
(1004, 'Fatma', 'Salim', 'Female', '1992-07-11'),
(1005, 'Omar', 'Nasser', 'Male', '1985-01-29');


INSERT INTO Department (Dnumber, Dname, ManegerId, hiringDate) VALUES
(1, 'HR', 1001, '2020-01-15'),
(2, 'Finance', 1002, '2019-03-20'),
(3, 'IT', 1003, '2021-06-10'),
(4, 'Marketing', 1004, '2018-09-05'),
(5, 'Sales', 1005, '2022-02-28');

INSERT INTO Employee 
(SSN, Fname, Lname, Gender, DOB, DepartmentId, SupervisourId) 
VALUES
(1007, 'Ali', 'Rahman', 'Male', '1993-02-10', 1, NULL),
(1008, 'Maha', 'Ahmed', 'Female', '1996-09-14', 2, 1007),
(1009, 'Khalid', 'Sultan', 'Male', '1987-06-30', 3, 1007),
(1010, 'Aisha', 'Hamad', 'Female', '1994-12-05', 4, 1008),
(1011, 'Salim', 'Jabir', 'Male', '1983-04-21', 5, 1009),
(1012, 'Huda', 'Yasin', 'Female', '1999-01-17', 1, 1007),
(1013, 'Majed', 'Faris', 'Male', '1990-08-09', 2, 1008);

INSERT INTO Project (Pnum, Pname, city, loca, DeptNum) VALUES
(2001, 'WebsiteSystem', 'Muscat', 'Building A', 1),
(2002, 'FinanceApplication', 'Salalah', 'Building B', 2),
(2003, 'NetworkSetup', 'Sohar', 'Building C', 3),
(2004, 'MarketStudy', 'Nizwa', 'Building D', 4),
(2005, 'SalesPortal', 'Sur', 'Building E', 5);

select* from Employee;

select* from Department;

Select * from Project;

create table Employees(
EmployeeID int,
Name varchar(20),
DepartmentID int,
Salary int,
FOREIGN KEY (DepartmentID) REFERENCES Department(Dnumber)
);

INSERT INTO Employees
(EmployeeID, Name, DepartmentID, Salary)
VALUES
(6001, 'Ahmed Ali', 1, 1200),
(6002, 'Sara Khalid', 2, 1500),
(6003, 'Mohammed Hassan', 3, 1800),
(6004, 'Fatma Salim', 4, 1400),
(6005, 'Omar Nasser', 5, 1600),
(6006, 'Huda Saeed', 1, 1300),
(6007, 'Yousef Mahmood', 2, 1700);

delete from Employees 
where EmployeeID = 6001;

select* from Employees;

delete from Project 
where Pname = 'WebsiteSystem';

select* from Project;

delete from Department
where Dnumber = 1;

delete from Employees 
where Salary< 1500;

select* from Employees;

drop table WorkOn;

update Employees
set Salary+=10
where DepartmentID = 2;

