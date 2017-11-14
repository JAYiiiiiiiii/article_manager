-- 表的结构 `user`
--

--CREATE TABLE IF NOT EXISTS `user` (
  --`username` varchar(32) CHARACTER SET utf8 NOT NULL,
  --`password` varchar(32) CHARACTER SET utf8 NOT NULL,
  --PRIMARY KEY (`username`)
--) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(32) CHARACTER SET utf8 NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 NOT NULL,
 `sex` varchar(12) CHARACTER SET utf8 NOT NULL, 
 `birthday` varchar(12) CHARACTER SET utf8 NOT NULL, 
 `email` varchar(20) CHARACTER SET utf8 NOT NULL, 
 PRIMARY KEY (`username`)
) DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--


insert into user(username,password,sex,birthday,email)values('heminyi','heminyi','male','19890303','he@qq.com');
insert into user(username,password,sex,birthday,email)values('李四','123','男','19900921','lisi@126.com');
insert into user(username,password,sex,birthday,email)values('王五','123','男','19921126','wowu@163.com');

select * from user;
drop table user;
-- --------------------------------------------------------


CREATE TABLE IF NOT EXISTS `article` (
  `category` varchar(15) CHARACTER SET utf8 NOT NULL,
  `title` varchar(30) CHARACTER SET utf8 NOT NULL,
  `author` varchar(30) CHARACTER SET utf8 NOT NULL,
  `filepath` varchar(60) CHARACTER SET utf8 NOT NULL,
  `uploadtime` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`title`)
) DEFAULT CHARSET=utf8;

select * from article;
drop table article;