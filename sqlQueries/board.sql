
create table board(
name varchar(50),
president varchar(50),
secretary varchar(50),
world_cups_won int,
country varchar(50),
managed_by varchar(10),
primary key(name),
unique (president, secretary),
foreign key (country) references country (name),
foreign key (managed_by) references int_board (name));

insert into board (name,president,secretary,world_cups_won,country,managed_by)values
('NZC','debbic hockley','john buchanan', 0,'New Zealand','ICC');
		
insert into board (name,president,secretary,world_cups_won,country,managed_by)values
('WICB','whycliffe dave cameron','JOHNY CRAVE', 2,'Windies','ICC');

insert into board (name ,president,secretary,world_cups_won,country,managed_by)values
('BCB','Nazmul Hassan Papon','A J M Nasir Uddin', 0,'Bangladesh','ICC');

insert into board (name ,president,secretary,world_cups_won,country,managed_by)values
('SLC','MAITHRIPALA SIRISENA','MOHAN DE SILVA', 1,'Sri Lanka','ICC');

insert into board (name ,president,secretary,world_cups_won,country,managed_by)values
('CA','COOPER ROWE','KEVIN ROBERTS', 5,'Australia','ICC');

insert into board (name,president,secretary,world_cups_won,country,managed_by)values
('PCB','EHSEN MANI','SUBHAN AHMED', 1,'Pakistan','ICC');

insert into board (name,president,secretary,world_cups_won,country,managed_by)values
('ECB','COLIN GRAVESS','TOM HARRISON', 0,'England','ICC');

insert into board (name,president,secretary,world_cups_won,country,managed_by)values
('CSA','LINDIWE','NBAZIBA', 0,'South Africa','ICC');

insert into board (name,president,secretary,world_cups_won,country,managed_by)values
('BCCI','C K KHANNA','AMITABH CHAUDHARY', 2,'India','ICC');

insert into board (name,president,secretary,world_cups_won,country,managed_by)values
('ACB','Ashraf Ghani ','Ghani', 0,'Afghanistan','ICC');