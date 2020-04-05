create table matches(
match_no SERIAL PRIMARY KEY,
team_a varchar(30),
team_b varchar(30),
date date,
time time ,
stadium varchar(100),
city varchar(50),
country varchar(50),
arranged_by varchar(50),
FOREIGN KEY (team_a) REFERENCES country (name),
FOREIGN KEY (team_b) REFERENCES country (name),
FOREIGN KEY (arranged_by) REFERENCES int_board (name));
insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('England' , 'South Africa' , '2019-05-30', '03:03:00', 'Kennington Oval', 'London', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Windies','Pakistan' , '2019-05-31', '03:03:00', 'Trent Bridge','Nottingham', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('New Zealand','Sri Lanka' , '2019-06-1', '03:03:00', 'Sophia Gardens','Cardiff', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Afghanistan','Australia' , '2019-06-01', '03:03:00', 'County Ground','Bristol', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('South Africa','Bangladesh' , '2019-06-02', '03:03:00', 'Kennington Oval','London', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('England','Pakistan' , '2019-06-03', '03:03:00', 'Trent Bridge','Nottingham', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Afghanistan','Sri Lanka' , '2019-06-4', '03:03:00', 'Sophia Gardens','Cardiff', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('South Africa','India' , '2019-06-05', '03:03:00', 'The Rose Bowl','Southampton', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Bangladesh','New Zealand' , '2019-06-05', '03:03:00', 'Kennington Oval', 'London', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Australia','Windies' , '2019-06-06', '03:03:00', 'Trent Bridge','Nottingham', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Pakistan','Sri Lanka' , '2019-06-07', '03:03:00', 'County Ground','Bristol', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('England','Bangladesh' , '2019-06-08', '03:03:00', 'Sophia Gardens','Cardiff', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Afghanistan','New Zealand' , '2019-06-08', '03:03:00', 'The Cooper Associates County Ground','Taunton', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('India','Australia' , '2019-06-09', '03:03:00', 'Kennington Oval', 'London', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('South Africa','Windies' , '2019-06-10','03:03:00', 'The Rose Bowl','Southampton', 'england','ICC');

 insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Bangladesh','Sri Lanka' , '2019-06-11', '03:03:00', 'County Ground','Bristol', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Australia','Pakistan' , '2019-06-12', '03:03:00', 'The Cooper Associates County Ground','Taunton','england','ICC');

 insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('India','New Zealand' , '2019-06-13', '03:03:00', 'Trent Bridge','Nottingham', 'england','ICC');
 
insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('England','Windies' , '2019-06-14', '03:03:00', 'The Rose Bowl','Southampton', 'england','ICC');
 
insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Sri Lanka','Australia' , '2019-06-15', '03:03:00', 'Kennington Oval', 'London', 'england','ICC');


insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('South Africa','Afghanistan' , '2019-06-15', '03:03:00', 'sophia gardens','cardiff', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('India', 'Pakistan' , '2019-06-16', '03:03:00', 'old trafford','manchester', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Windies','Bangladesh' , '2019-06-17', '03:03:00', 'The Cooper Associates County Ground','Taunton', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('England','Afghanistan' , '2019-06-18', '03:03:00', 'Old Trafford','Manchester', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('New Zealand','South Africa' , '2019-06-19', '03:03:00', 'Edgbaston','Birmingham', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Australia','Bangladesh' , '2019-06-20', '03:03:00', 'Trent Bridge','Nottingham', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('England','Sri Lanka' , '2019-06-21', '03:03:00', 'Headingley','Leeds', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('India','Afghanistan' , '2019-06-22', '03:03:00', 'The Rose Bowl','Southampton', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Windies','New Zealand' , '2019-06-22', '03:03:00', 'Old Trafford','Manchester', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Pakistan','South Africa' , '2019-06-23', '03:03:00', 'Kennington Oval', 'London', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Bangladesh','Afghanistan' , '2019-06-24', '03:03:00', 'The Rose Bowl','Southampton', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('England','Australia' , '2019-06-25', '03:03:00', 'Kennington Oval', 'London', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('New Zealand','Pakistan' , '2019-06-26', '03:03:00', 'Edgbaston','Birmingham', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Windies','India' , '2019-06-27', '03:03:00', 'Old Trafford','Manchester', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Sri Lanka','South Africa' , '2019-06-28', '03:03:00', 'Riverside Ground','Chester-le-Street', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Pakistan','Afghanistan' , '2019-06-29', '03:03:00', 'Headingley','Leeds', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('New Zealand','Australia' , '2019-06-29', '03:03:00', 'wankhade','mumbai', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('England','India' , '2019-07-30', '03:03:00', 'Edgbaston','Birmingham', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Sri Lanka','Windies' , '2019-07-01', '03:03:00', 'Riverside Ground','Chester-le-Street', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Bangladesh','India' , '2019-07-02', '03:03:00', 'Edgbaston','Birmingham', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('England','New Zealand' , '2019-07-03', '03:03:00', 'Riverside Ground','Chester-le-Street', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Afghanistan','Windies' , '2019-07-04', '03:03:00', 'Headingley','Leeds', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Pakistan','Bangladesh' , '2019-07-05', '03:03:00', 'Lords','London', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Sri Lanka','India' , '2019-07-06', '03:03:00', 'Headingley','Leeds', 'england','ICC');

insert into matches(team_a,team_b,date,time,stadium,city,country,arranged_by)values
('Australia','South Africa' , '2019-06-06', '03:03:00', 'Old Trafford','Manchester', 'england','ICC');