create table country(
name varchar(50),
sponsors  varchar(60),
jersey_color varchar(20),
ranking int,
group_name varchar(10),
primary key (name),
unique (ranking),
foreign key(group_name) references groups(name));
insert into country (name,sponsors,jersey_color,ranking,group_name)values
('India','oppo','Blue', '2','A');


insert into country (name,sponsors, jersey_color,ranking,group_name)values
('Australia','kfc','Yellow', '5','A');


insert into country (name,sponsors, jersey_color,ranking,group_name)values
('South Africa','castle','green', '4','A');

			
insert into country (name,sponsors, jersey_color,ranking,group_name)values
('Windies','digicel','brown', '9','A');					  
								  
			
insert into country (name,sponsors, jersey_color,ranking,group_name)values
('England','bbc sport','red and black', '1','A');


insert into country (name,sponsors, jersey_color,ranking,group_name)values
('Sri Lanka','huawei','dark blue', '8','B');


insert into country (name,sponsors, jersey_color,ranking,group_name)values
('Pakistan','pepsi','green','6','B');					  


insert into country (name,sponsors, jersey_color,ranking,group_name)values
('Afghanistan','agc','blue','10','B');


insert into country (name,sponsors, jersey_color,ranking,group_name)values
('Bangladesh','qatar airways','green', '7','B');

insert into country (name,sponsors, jersey_color,ranking,group_name)values
('New Zealand','anz','black', '3','B');
