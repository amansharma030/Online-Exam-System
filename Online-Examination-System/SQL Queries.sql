
----------------------------- Student Table ----------------------------- 

create table student(
id int not null primary key AUTO_INCREMENT,
name varchar(50) not null,
password varchar(50) not null,
email varchar(50) not null,
gender varchar(6) not null,
phone varchar(10) not null
);

----------------------------- Subject Table ----------------------------- 

create table subject(
Num int not null primary key,
Question varchar(1000),
Op1 varchar(500),
Op2 varchar(500),
Op3 varchar(500),
Op4 varchar(500),
Answer varchar(1),
Subject varchar(50)
);

----------------------------- Instructionset Table ----------------------------- 

create table instructionset
(
Num int not null primary key,
Instruction varchar(2000)
);

----------------------------- Result Table ----------------------------- 

create table result(
Id int not null primary key,
Name varchar(50),
Subject varchar(50),
Marks int
);
