create database edit_project;
use edit_project;

create table user(
	id int not null primary key auto_increment,
	username varchar(20) not null,
	password varchar(20) not null,
    sex varchar(5),
    photo_url tinytext,
	email varchar(30) not null,
	type int not null,
	register_date datetime not null, 
    signature varchar(50), 
	level int not null default 0 , 
    active_code varchar(32),
    hasActive int
)charset=utf8;
 