create table Coach
(
    fname       varchar(20)  not null,
    lname       varchar(20),
    Board       varchar(20)  not null,
    Country     varchar(20),
    primary key(Board,fname),
    foreign key(Board) references Board(name)
);

insert into Coach
values('Ravi','Shastri','BCCI','India');

insert into Coach
values('Justin','Langer','ACB','Australia');

insert into Coach
values('Ottis','Gibson','CSA','West Indies');

insert into Coach
values('Chamelika','Hathurusingha','SLC','Srilanka');

insert into Coach
values('Steve','Rhodes','BCB','England');

insert into Coach
values('Trevor','Bayliss','ECB','England');

insert into Coach
values('Gary','Stead','NZC','Newzeland');

insert into Coach
values('Phil','Simmons','ACB','West Indies');

insert into Coach
values('Richard','Pybus','WICB','England');

insert into Coach
values('Mickey','Arthur','PCB','South Africa');