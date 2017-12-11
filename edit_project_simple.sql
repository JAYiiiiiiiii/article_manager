create database edit_project;
use edit_project;
create table main_forum(
	id int not null primary key auto_increment,
	title varchar(30) not null,
	info varchar(60) 
)charset=utf8;

create table sub_forum(
	id int not null primary key auto_increment,
	main_forum int not null, 
	title varchar(30) not null,
	info varchar(60),
	FOREIGN key(main_forum) references main_forum(id) on delete cascade on update cascade
)charset=utf8;

create table sub_sub_forum(
	id int not null primary key auto_increment,
	sub_forum int not null, 
	title varchar(30) not null,
	info varchar(60),
	FOREIGN key(sub_forum) references sub_forum(id) on delete cascade on update cascade
)charset=utf8;

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

create table admin(
	id int not null primary key auto_increment,
	user_name varchar(20) not null,
	password varchar(20) not null,
    photo_url tinytext,
	email varchar(30) not null,
	type int not null,
    sex varchar(10)
)charset=utf8;

INSERT INTO 
`admin` VALUES ('1','admin','admin','/upload/default/head_icon.jpg','admin1@qq.com',0,'男');


create table post(
	id int not null primary key auto_increment,
	forum int not null, 
	user_id int not null,
	title varchar(40) not null, 
	card_content varchar(8000)not null,
	send_date datetime not null,  
    post_type int, 
    reply_num int,
    view_num int,
	FOREIGN key(forum) references sub_sub_forum(id) on delete cascade on update cascade,
	FOREIGN key(user_id) references user(id) on delete cascade on update cascade
)charset=utf8;

create table private_post(
	id int not null primary key auto_increment,
	forum int not null, 
	user_id int not null,
	title varchar(40) not null, 
	card_content varchar(8000)not null,
	send_date datetime not null,  
    post_type int, 
    reply_num int,
    view_num int,
	FOREIGN key(forum) references sub_sub_forum(id) on delete cascade on update cascade,
	FOREIGN key(user_id) references user(id) on delete cascade on update cascade
)charset=utf8;

create table followcard(
	id int not null primary key auto_increment,
	send_id int not null,
	user_id int not null,
	follow_content varchar(2000),
	follow_date datetime not null,
	FOREIGN key(send_id) references post(id) on delete cascade on update cascade,
	FOREIGN key(user_id) references user(id) on delete cascade on update cascade
)charset=utf8;
 
 
create table notice(
	id int not null primary key auto_increment,
	admin_id int not null,
	content varchar(2000),
	notice_date datetime not null,
    title varchar(45),
	FOREIGN key(admin_id) references admin(id) on delete cascade on update cascade
)charset=utf8;

#精华帖申请列表
CREATE TABLE best_post(
	 id int not null primary key auto_increment,
     post_id int not null,
     user_id int not null,
     apply_date timestamp,
     state int,
     FOREIGN key(post_id) references post(id) on delete cascade on update cascade,
     FOREIGN key(user_id) references user(id) on delete cascade on update cascade
) charset=utf8;

CREATE TABLE black_list(
	id int not null primary key auto_increment,
    user_id int not null,
    level int,
    FOREIGN key(user_id) references user(id) on delete cascade on update cascade
)charset=utf8;










 