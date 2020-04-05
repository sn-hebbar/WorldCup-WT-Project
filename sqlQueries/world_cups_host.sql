create table  World_cups
  (
    Year        varchar(10),
    Winner      varchar(20),
    Runner      varchar(20),
    Player_of_series  varchar(20),
    Arranged_by varchar(20),
    primary key(Year),
    foreign key(Arranged_by) references int_board(name)
  );
  insert into World_cups
    values('1975','West Indies','Australia',null,'ICC');
  insert into World_cups
    values('1979','West Indies','England',null,'ICC');
  insert into World_cups
    values('1983','India','West Indies',null,'ICC');
  insert into World_cups
    values('1987','Australia','England',null,'ICC');
  insert into World_cups
    values('1992','Pakistan','England','Martin Crowe','ICC');
  insert into World_cups
    values('1996','Sri Lnaka','Australia','Sanath Jayasuriya','ICC');
  insert into World_cups
    values('1999','Australia','Pakistan','Lance Klusener','ICC');
  insert into World_cups
    values('2003','Australia','India','Sachin Tendulkar','ICC');
  insert into World_cups
    values('2007','Australia','Sri Lanka','Glenn McGrath','ICC');
  insert into World_cups
    values('2011','India','Sri Lanka','Yuvraj Singh','ICC');
  insert into World_cups
    values('2015','Australia','New Zealand','Mitchell Starc','ICC');

  create table Host
    (
      Year varchar(10),
      Host  varchar(20),
      primary key(Year,Host),
      foreign key(Year) references World_cups(Year)
    );
  insert into Host
  values('1975','England');
  insert into Host
  values('1979','England');
  insert into Host
  values('1983','England');
  insert into Host
  values('1987','India');
  insert into Host
  values('1987','Pakistan');
  insert into Host
  values('1992','Australia');
  insert into Host
  values('1992','New Zealand');
  insert into Host
  values('1996','India');
  insert into Host
  values('1996','Pakistan');
  insert into Host
  values('1996','Sri Lanka');
  insert into Host
  values('1999','England');
  insert into Host
  values('1999','Wales');
  insert into Host
  values('2003','South Africa');
  insert into Host
  values('2007','West Indies');
  insert into Host
  values('2011','India');
  insert into Host
  values('2011','Sri Lanka');
  insert into Host
  values('2011','Bangladesh');
  insert into Host
  values('2015','Australia');
  insert into Host
  values('2015','New Zealand');
