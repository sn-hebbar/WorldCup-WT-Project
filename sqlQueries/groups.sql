create table groups
(
name varchar(10),
int_board varchar(40),
primary key(name),
foreign key (int_board) references int_board(name));
insert into groups
values('A','ICC');
insert into groups
values('B','ICC');
