
select * from users;

select * from blist order by bsequence desc;
update blist set bmemo ='hacking message' where bsequence=136;
select * from blist where thishash='b5b808acce1634b241dcda1c5ee7cbe7a6bdb6ad857edd41208ee5baff2520b0';
select * from blist order by bsequence desc;

select * from bank;
select Bsequence , prehash, thishash,rownum from blist order by bsequence desc;
select * from blist order by bsequence desc;


insert into Blist (Bid,Bdate,Brest,Binout,Buser,Bmemo,Bsequence,prehash,thishash) values('admin',sysdate
	,1000000,0,'admin','admin',Bseq.nextval,1,1)

update bank set brest=950000;
delete from BLIST where brest=850000;
delete from blist_per;

update blist set thishash='2' where brest=595643;

select * from users;
create table users (
Sid varchar2(20) primary key, 
Sname varchar2(20), 
Spw varchar2(100), 
Snum varchar2(20), 
Sgrade number(2),
Smajor varchar2(20),
Siscouncil number(2) default 0);
drop table users;
	select Spw from users where Sid='test';
select * from bank;
create table bank(Bid varchar2(30), Bname varchar2(20),Bpw varchar2(100),Brest number(20));
create table Blist(Bid varchar2(30),Bdate date,Brest number(20),Binout number(20),Buser varchar2(20));

create sequence Bseq_p
start with 1
increment by 1
nocache;--임시메모리 사용 안함@!
drop sequence Bseq;

alter table blist add prehash varchar2(100);
alter table blist add thishash varchar2(100);





select * from blist_per;

select * from users;
update bank set bpw='387a8233c96e1fc0ad5e284353276177af2186e7afa85296f106336e376669f7';
select * from bank;
delete from users where sid='staris';
update users set siscouncil=3 where sid='2015112120';

update blist_per set fname='';
select Bseq_p.nextval from dual;

create table Blist_per(Bid varchar2(30),Bdate date,Brest number(20),Binout number(20),Buser varchar2(20));
alter table Blist_per add (Bmemo varchar2(30), Bsequence number(4));

select * from blist_per;

alter table Blist_per add fname varchar2(20);
update Blist_per set fname='';

