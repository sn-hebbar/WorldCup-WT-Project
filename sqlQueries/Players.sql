create table Players(
  Cap_no                int             not null,
  Fname                 varchar(20),
  Lname                 varchar(20),
  Specification         varchar(20),
  Match                 int,
  Innings               int,
  Total_score          int,
  Highest_score         int,
  Average               float,
  Total_wicket          int,
  Best_bowling_figure   varchar(10),
  Captain_cap_no       int     not null,
  Board                 varchar(20)     not null,
  primary key(Cap_no,Board),
  foreign key(Board) references Board(name),
  foreign key(Captain_cap_no,Board) references Players(Cap_no,Board)
);
insert into Players

values (175,'Virat','Kohli','Bat',227,219,10843,183,59.57,4,'1/15',175,'BCCI');



insert into Players
values (168,'Rohit','Sharma','Bat',206,200,8010,264,47.39,8,'2/27',175,'BCCI');
insert into Players
values (157,'Mahendra','Singh Dhoni','Keeper',338,286,10326,183,50.37,1,'1/14',175,'BCCI');
insert into Players
values (213,'KL','Rahul','Bat',14,13,343,100,34.3,null ,null ,175,'BCCI');
insert into Players
values (205,'Kedar','Jadhav','All Rounder',59,40,	1174,	120,	43.48,	27,	'3/23',175,'BCCI');
insert into Players
values (188,'Shikhar','Dhawan','Bat',	128,	127,	5355,	143,	44.62,null ,null ,175,'BCCI'

);
insert into Players
values (215,	'Hardik' ,'Pandya','All Rounder', 	45,	29,	731,	83,	29.24,	44,	'3/31',175,'BCCI'
);
insert into Players
values (226,	'Vijay', 'Shankar','All Rounder', 	9,	5,	165,	46,	33,	2,	'2/15',175,'BCCI'
);
insert into Players
values (194,	'Bhuvneshwar', 'Kumar','Bowler',105,	49,	523,	53, 	15.38,	118,	'3/42',175,'BCCI'
);
insert into Players
values (195,	'Mohammed', 'Shami','Bowler', 	63,	29,	131,	25,	8.73,	113,	'4/35',175,'BCCI'
);
insert into Players
values (210,	'Jasprit','Bumrah','Bowler', 	49,	10,	18	,10, 	3.6,	85,	'5/27',175,'BCCI'
);
insert into Players
values (211	,'Yuzvendra', 'Chahal','Bowler', 	41,	7,	34,	18, 	8.5,	72	,'6/42',175,'BCCI'
);
insert into Players
values (217,	'Kuldeep', 'Yadav', 'Bowler',	44,	18,	100,	19,	12.5,	87,	'6/25',175,'BCCI'
);
insert into Players
values (156,	'Dinesh', 'Karthik','Keeper',	91,	77,	1738,	79,	31.03,null,null,175,'BCCI'

);
insert into Players
values (224,'Rishabh','Pant','Keeper', 	5,	4,	93,	36,	23.25,null,null,175,'BCCI'
);
insert into Players
values (197,	'Aaron', 'Finch','Bat',	104,	100,	3601,	148,	36.37,	2,	'01/2',	197,'CA'
);
insert into Players
values (170,	'David' ,'Warner'	,'Bat',106,	104,	4343,	179,	43.71,	0,	null,	197,'CA'
);
insert into Players
values (199,	'Usman', 'Khawaja','Bat',	26,	25,	966,	104,	42,	0,	null,	197,'CA'
);
insert into Players
values (182,	'Steve','Smith','Bat',	108,	94,	3431,	164,	41.84,	27,'3/16',	197,'CA'
);
insert into Players
values (165,	'Shaun', 'Marsh','Bat',	66,	65,	2565,	151,	40.71,	0,	null	,	197,'CA'
);
insert into Players
values (219	,'Peter', 'Handscomb','Bat',	16,	15,	536,	117,	35.73,	0,	null	,	197,'CA'
);
insert into Players
values (196	,'Glenn' ,'Maxwell','Allrounder',	95,	86,	2442	,102,	31.71,	47,'4/46',	197,'CA'
);
insert into Players
values (209,	'Marcus', 'Stoinis','Allrounder',	28,	28,	947,	146,	43.04,	24,	'3/16',	197,'CA'
);
insert into Players
values (223,	'Alex','Carey','Keeper',	14,	14,	349,	47,	29.08,	0,null	,		197,'CA'
);
insert into Players
values (185,	'Mitchell' ,'Starc','Bowler',	75,	38,	280,	52,	12.72	,145,	'1/28',	197,'CA'
);
insert into Players
values (224	,'Jhye', 'Richardson','Bowler',	10,	7,	68,	29,	13.6,	21,	'4/26',		197,'CA'
);
insert into Players
values (212	,'Adam', 'Zampa','Bowler',	39,	18,	99,	22,	7.07,	53,	'3/16',		197,'CA'
);
insert into Players
values (189	,'Pat', 'Cummins','Bowler',	47,	26,	181,	36,	11.31,	79	,'5/70',	197,'CA'
);
insert into Players
values (204,'Nathan','Coulter-Nile','Bowler',	24,	17,	152,	34,	12.66,	41,	'4/48',		197,'CA'
);
insert into Players
values (201,'Kane','Richardson','Bowler',18,	8,	45,	19,	9	,27,	'5/68',		197,'CA'
);
insert into Players
values(101,	'Faf', 'du Plessis','Bat',	133,	127,	5096,	185,	46.75,	2,	'1/8',101,'CSA'
);
insert into Players
values(105,	'Quinton', 'de Kock','Keeper',	105,	105,	4596,	178	,45.96	,null,	null	,101,'CSA'
);
insert into Players
values(127,	'Reeza', 'Hendricks','Bat',	18,	18,	455,	102,	26.76,	1,	'1/13',101,'CSA'
);
insert into Players
values(131,	'Rassie', 'van der Dussen','Bat',	8,	7	,325,	93,	81.25,	null,	null,101,'CSA'
);
insert into Players
values(98	,'David', 'Miller','Bat',	120	,106,	2922,	139,	38.96,	null,	null	,101,'CSA'
);
insert into Players
values(118,	'Andile', 'Phehlukwayo','Bowler',	42,	25,	416,	69	,32,	53,	'4/22',101,'CSA'
);
insert into Players
values(114,	'Kagiso', 'Rabada','Bowler',	65,	24,	201,	26,	14.35,	103	,'6/16',101,'CSA'
);
insert into Players
values(126,	'Lungi', 'Ngidi','Bowler',	17,	7,	40,	19,	20,	33,	'4/51',101,'CSA'
);
insert into Players
values(102,	'Imran', 'Tahir','Bowler',	97,	32,	146,	29,	8.11,	160	,'7/45',101,'CSA'
);
insert into Players
values(116,	'Tabraiz', 'Shamsi','Bowler',	15,	3,	0,	0,	0,	19,	'4/33',101,'CSA'
);
insert into Players
values(82,	'Dale' ,'Steyn','Bowler',	123,	49,	361,	60,	9.75,	194	,'6/39',101,'CSA'
);
insert into Players
values(119,	'Dwaine', 'Pretorius','Bowler',	18,	8,	132	,50,	18.85,	24,	'03/5',101,'CSA'
);
insert into Players
values(122	,'Aiden' ,'Markram','Bat',	17,	17,	436,	66,	25.64,	2	,'2/18',101,'CSA'
);
insert into Players
values(77,	'JP' ,'Duminy','Allrounder',	193,	175,	5047,	150,	37.38,	68,	'4/16',101,'CSA'
);
insert into Players
values(90,	'Hashim', 'Amla','Bat',	174,	171,	7910,	159,	49.74,	null,	null,101,'CSA'
);
insert into Players
values(161,	'Kane', 'Williamson','Bat',	139,	133,	5554,	145,	45.9,	35,	'4/22',161,'NZC'
);
insert into Players
values(152,	'Martin', 'Guptill','Bat',	169,	166,	6440,	237,	43.51,	4,	'02/6',161,'NZC'
);
insert into Players
values(178,	'Colin', 'Munro','Bat',	51,	47,	1146,	87,	24.91,	7,	'02/10',161,'NZC'
);
insert into Players
values(144,	'Ross' ,'Taylor'	,'Bat',218	,203,	8026,	181,	48.34,	0,null,161,'NZC'
);
insert into Players
values(177,	'James', 'Neesham','Allrounder',	49,	42,	1015,	74,	30.75,	44,	'4/42'	,161,'NZC'
);
insert into Players
values(173,	'Colin', 'de Grandhomme','Allrounder',	28,	21,	443,	74,	29.53,	18,	'3/26',161,'NZC'
);
insert into Players
values(170,	'Tom' ,'Latham','Keeper',	85,	79,	2395,	137,	33.73,	null	,null	,161,'NZC'
);
insert into Players
values(189,	'Henry' ,'Nicholls','Bat',	41,	39,	1029	,124	,35.48	,null,	null	,161,'NZC'
);
insert into Players
values(187,	'Ish', 'Sodhi','Bowler',	30,	12,	62,	24,	6.2,	39,	'4/58',161,'NZC'
);
insert into Players
values(190,	'Lockie' ,'Ferguson','Bowler',	27,	13,	58,	19,	8.28,	46,	'5/45',161,'NZC'
);
insert into Players
values(149,	'Tim' ,'Southee','Bowler',	139,	84,	669	,55,	12.62,	185	,'7/33',161,'NZC'
);
insert into Players
values(174,	'Trent' ,'Boult','Bowler',	79,	35	,144,	21,	9.6	,147,	'7/34',161,'NZC'
);
insert into Players
values(165,	'Doug', 'Bracewell','Bowler',	19,	12,	158,	57,	15.8,	23,	'4/55'	,161,'NZC'
);
insert into Players
values(184,	'Mitchell', 'Santner','Allrounder',59,	46,		826	,67,	27.53,63,	'5/50',161,'NZC'
);
insert into Players
values(162,	'BJ' ,'Watling','Keeper',28,	25,	573,	96,	24.91,null,null,161,'NZC'
 );
 insert into Players
 values(123,	'Lasith' ,'Malinga','Bowler',	217,	112,	550,	56,	7.05	,321,	'6/38',123,'SLC'
 );
 insert into Players
 values(175,	'Avishka', 'Fernando','Bat',	4,	4,	62,	29,	15.5,	null,	null	,123,'SLC'
 );
 insert into Players
 values(125,	'Upul', 'Tharanga','Bat',	233,	221,	6939,	174,	34.01,	null	,null	,123,'SLC'
 );
 insert into Players
 values(189,	'Oshada', 'Fernando','Bat',	4,	4,	105,	49,	26.25,	0,	null	,123,'SLC'
 );
 insert into Players
 values(170,	'Kusal', 'Mendis','Keeper',	61,	59,	1570,	102,	27.54	,0,	null	,123,'SLC'
 );
 insert into Players
 values(169,	'Dhananjaya', 'de Silva','Allrounder',	31,	29,	669,	84,	26.76,	15,	'3/41',123,'SLC'
 );
 insert into Players
 values(141,	'Thisara', 'Perera','Allrounder',	152,	119,	2145,	140,	20.82,	168,	'6/44',123,'SLC'
 );
 insert into Players
 values(152,	'Isuru', 'Udana','Allrounder',	4	,2	,0	,78,	78,	2,	'2/50',123,'SLC'
 );

 insert into Players
 values(188,	'Kasun', 'Rajitha','Bowler',	6,	2,	0,	0,	0,	5,	'1/21',123,'SLC'
 );
 insert into Players
 values(161,	'Niroshan',' Dickwella','Keeper',	52,	49,	1571,	116,	32.72,	null,	null	,123,'SLC'
 );
 insert into Players
 values(190,	'Kamindu', 'Mendis','Allrounder',	2,	2,	17,	9,	17,	1,	'1/45',123,'SLC'
 );
 insert into Players
 values(154,	'Akila', 'Dananjaya','Allrounder',	33,	25,	280,	50,	14,	48,	'6/29',123,'SLC'
 );
 insert into Players
 values(174,	'Lakshan' ,'Sandakan','Bowler',	20,	11,	31,	6,	4.42,	17,	'4/52',123,'SLC'
 );
 insert into Players
 values(156,	'Angelo', 'Perera','Allrounder',4,2,	8,	7,	4.00,0,null, 123,'SLC'
 );
 insert into Players
 values(182,	'Vishwa', 'Fernando','Bowler',8,	8,30,	7,	15.00,5,1/35, 123,'SLC'
 );
insert into Players
values (299,'jason','holder','All-Bowler',88,88,1471,99,26.27,119,5/27,299,'WICB');

insert into Players
values (232,'Chris','Gayle','Batsman',288,283,10151,215,38.03,165,5/46,299,'WICB');

insert into Players
values (302,'Shai','Hope','Keeper',47,45,1777,146,44.42,null,null,299,'WICB');

insert into Players
values (256,'Darren','Bravo','Batsman',101,98,2784,124,31.28,null,null,299,'WICB');

insert into Players
values (310,'Shimron','Hetmyer','Batsman',24,24,899,127,40.86,null,null,299,'WICB');

insert into Players
values (317,'john','campbell','All-Batsman',4,4,69,30,17.25,0,0/13,299,'WICB');

insert into Players
values (315,'keemo','paul','All-Bowler',11,11,115,36,16.43,11,2/29,299,'WICB');

insert into Players
values (306,'Carlos','Brathwaite','All-Bowler',32,31,389,50,14.41,31,5/27,299,'WICB');

insert into Players
values (289,'Devendra','Bishoo','Bowler',41,40,164,29,10.93,38,3/30,299,'WICB');

insert into Players
values (297,'Sheldon','Cottrel','Bowler',9,9,14,8,7.0,15,5/46,299,'WICB');

insert into Players
values (288,'Andre','Russel','All-Bowler',52,51,998,92,28.51,65,4/35,299,'WICB');

insert into Players
values (298,'Oshane','Thomas','Bowler',8,8,null,null,null,15,5/21,299,'WICB');
insert into Players
values (128,'Shoaib','Malik','All-Batting',279,250,7379,143,35.14,156,4/19,128,'PCB');

insert into Players
values (144,'Mohammad','Hafeez','All-Batting',208,206,6302,140,32.99,137,4/41,128,'PCB');

insert into Players
values (215,'Imam-','-ul-Haq','Batsman',21,21,1090,128,57.37,null,null,128,'PCB');

insert into Players
values (212,'Fakhar','Zaman','Batsman',31,31,1442,210,53.41,1,1/19,128,'PCB');

insert into Players
values (203,'Babar','Azam','Batsman',59,57,2462,125,51.29,null,null,128,'PCB');

insert into Players
values (200,'Mohammad','Rizwan','WK-Batsman',27,24,474,75,27.88,null,null,128,'PCB');

insert into Players
values (204,'Imad','Wasim','All-Bowling',36,24,570,63,43.85,30,5/14,128,'PCB');

insert into Players
values (211,'Shadab','Khan','All-Bowling',34,33,294,54,29.4,47,4/28,128,'PCB');

insert into Players
values (173,'Mohammad','Amir','Bowler',49,49,352,73,19.56,60,4/28,128,'PCB');

insert into Players
values (216,'Usman','Shinwari','Bowler',12,12,0,0,0.0,23,5/34,128,'PCB');

insert into Players
values (218,'Shaheen','Afridi','Bowler',10,10,15,14,15,19,4/38,128,'PCB');

insert into Players
values (209,'Hasan','Ali','Bowler',44,43,203,59,12.69,77,5/34,128,'PCB');
insert into Players
values (655,'Joe','Root','Batsman',125,119,5090,133,50.9,20,3/52,655,'ECB');
insert into Players
values (652,'jonny','bairstow','Keeper',58,54,2118,141,46.04,null,null,655,'ECB');

insert into Players
values (669,'Alex','Hales','Batsman',69,67,2419,171,37.8,null,null,655,'ECB');



insert into Players
values (649,'Eoin','Morgan','Batsman',216,203,6813,124,38.93,null,null,655,'ECB');

insert into Players
values (665,'Jos','Buttler','keeper',126,105,3387,150,40.81,null,null,655,'ECB');

insert into Players
values (658,'Ben','Stokes','All-Bowler',79,68,2088,102,36.63,63,5/61,655,'ECB');

insert into Players
values (662,'Moeen','Ali','All-Bowler',91,86,1645,128,26.11,78,4/46,655,'ECB');

insert into Players
values (667,'Mark','Wood','Bowler',39,39,15,13,9,41,4/33,655,'ECB');

insert into Players
values (668,'Adil','Rashid','Bowler',82,77,529,69,19.59,128,5/27,655,'ECB');

insert into Players
values (628,'Liam','Plunkett','Bowler',77,76,584,56,19.47,116,5/52,655,'ECB');

insert into Players
values (657,'Chris','Woakes','All-Bowler',83,80,1039,95,26.64,116,6/45,655,'ECB');

insert into Players
values (613,'James','Anderson','Bowler',194,191,273,28,7.58,269,5/23,655,'ECB');

insert into Players
values (638,'Stuart','Broad','Bowler',121,121,529,45,12.3,178,5/23,655,'ECB');
insert into Players
values (54,'Mashrafe','Mortaza','All-Bowling',205,505,1752,51,14.02,259,6/26,54,'BCB');
insert into Players
values (84,'Tamim','Iqbal','Batsman',189,187,6460,154,36.09,null,null,54,'BCB');

insert into Players
values (117,'Liton','Das','WK-Batsman',27,27,508,121,19.54,null,null,54,'BCB');

insert into Players
values (115,'Soumya','Sarkar','Batsman',41,40,1274,127,34.43,1,1/19,54,'BCB');

insert into Players
values (81,'Mushfiqur','Rahim','WK-Batsman',201,187,5392,144,34.34,null,null,54,'BCB');

insert into Players
values (111,'Mohammad','Mithun','WK-Batsman',15,13,360,63,32.73,null,null,54,'BCB');

insert into Players
values (85,'Mohmudullah',null,'All-Batsman',171,148,3673,128,33.39,76,3/4,54,'BCB');

insert into Players
values (113,'Sabbir','Rahman','Batsman',57,51,1212,102,26.35,3,1/12,54,'BCB');

insert into Players
values (123,'Mehidy','Hasan','All-Bowling',25,24,291,51,20.79,26,4/29,54,'BCB');

insert into Players
values (125,'Mohammad','Saifuddin','All-Batting',10,7,175,50,29.17,7,3/45,54,'BCB');

insert into Players
values (95,'Rubel','Hossain','Bowler',96,94,123,17,4.73,122,6/26,54,'BCB');

insert into Players
values (82,'Shakib','Al Hasan','All-Bowling',195,192,5577,134,35.08,247,5/47,54,'BCB');
insert into Players
values (5,'Mohammad', 'Nabi','All-Rounder',111,100,2579,116,28.66,118,4/30,5,'ACB');

insert into Players
values (1,'Afsar', 'Zazai','Keeper',1,2,264,60,17.6,null,null,5,'ACB');

insert into Players
values (2,'Asghar','Afghan','Batsman',99,94,2056,101,23.63,3,1/1,5,'ACB');

insert into Players
values (3	,'Hashmatullah','Shahidi','Batsman',29,29,748,97,32.52,NULL,0/8,5,'ACB');

insert into Players
values (4,	'Javed','Ahmadi','Keeper',40,39,971,81,24.9,8,4/37,5,'ACB');

insert into Players
values (6,'Mohammad','Shahzad','Keeper',80,80,2598,131,33.74,null,null,5,'ACB');

insert into Players
values (7,'Mujeeb' ,'Ur Rahman','Bowler',28,27,41,15,6.83,51,5/50,5,'ACB');

insert into Players
values (8,'Rahmat', 'Shah','All-Rounder',57,54,1822,114,35.04,12,5/32,5,'ACB');

insert into Players
values (9,'Rashid','Khan','Bowler',56,54,782,60,23.7,123,7/18,5,'ACB');

insert into Players
values (11,'Yamin','Ahmadzai','Bowler',3,3,3,3,3.0,2,1/23,5,'ACB');

insert into Players
values (12,'Ihsanullah','Janat','Batsman',16,16,307,57,21.93,null,null,5,'ACB');