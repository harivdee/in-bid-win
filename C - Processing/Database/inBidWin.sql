CREATE SCHEMA inbidwin
DEFAULT CHARACTER SET utf8mb4;
-- DROP SCHEMA inbidwin;

USE inbidwin;

CREATE TABLE user (
userid int unsigned PRIMARY KEY auto_increment,
username varchar(100) UNIQUE NOT NULL,
fname varchar(100) NOT NULL,
lname varchar(100) NOT NULL,
password varchar(100) NOT NULL,
email varchar(100) UNIQUE NOT NULL,
credit decimal(14,3) unsigned default 0
);
-- DROP TABLE user;

create table role(
roleid int UNSIGNED PRIMARY KEY auto_increment,
rolename varchar(30) UNIQUE
);
-- DROP TABLE role;

create table user_role(
userid int UNSIGNED NOT NULL,
roleid int UNSIGNED NOT NULL,
PRIMARY KEY(userid, roleid),
CONSTRAINT userrolefk1 FOREIGN KEY (userid) 
REFERENCES user(userid),
CONSTRAINT userrolefk2 FOREIGN KEY (roleid) 
REFERENCES role(roleid)
);
-- DROP TABLE user_role;

CREATE TABLE house(
hid int unsigned PRIMARY KEY auto_increment,
hlocation varchar(100) NOT NULL,
hfloor int unsigned default 0,
hsize int unsigned default 0,
hroom int unsigned default 0,
hbathroom int unsigned default 0,
hheating varchar(100),
hphoto LONGBLOB NOT NULL,
hfurnished varchar(3),
hdescr varchar(200)
);
-- DROP TABLE house;

CREATE TABLE item (
itemid int unsigned PRIMARY KEY auto_increment,
ititle varchar(100) NOT NULL,
iprice decimal(14,3) unsigned default 0,
istatus varchar(10) NOT NULL,
user int unsigned NOT NULL,
house int unsigned NOT NULL,
CONSTRAINT fk_house FOREIGN KEY (house)
REFERENCES house(hid),
CONSTRAINT fk_user FOREIGN KEY (user)
REFERENCES user(userid)
);
-- DROP TABLE item;

CREATE TABLE image(
iid int unsigned PRIMARY KEY auto_increment,
iphoto LONGBLOB,
house int unsigned NOT NULL,
CONSTRAINT fk_house2 FOREIGN KEY (house)
REFERENCES house(hid)
);
-- DROP TABLE image;

CREATE TABLE auction(
auctionid int unsigned PRIMARY KEY auto_increment,
aincrement int unsigned default 0,
areserve int unsigned,
stime DATETIME,
etime DATETIME,
item int unsigned NOT NULL,
CONSTRAINT fk_item2 FOREIGN KEY (item)
REFERENCES item(itemid)
);
-- DROP TABLE auction;

CREATE TABLE bid(
bidid int unsigned PRIMARY KEY auto_increment,
bprice decimal(14,3) unsigned default 0,
btime DATETIME,
auction int unsigned NOT NULL,
user int unsigned NOT NULL,
CONSTRAINT fk_auction FOREIGN KEY (auction)
REFERENCES auction(auctionid),
CONSTRAINT fk_user2 FOREIGN KEY (user)
REFERENCES user(userid)
);
-- DROP TABLE bid;

CREATE TABLE transaction(
tid int unsigned PRIMARY KEY auto_increment,
tprice decimal(14,3) unsigned default 0,
auction int unsigned NOT NULL,
CONSTRAINT fk_auction2 FOREIGN KEY (auction)
REFERENCES auction(auctionid)
);
-- DROP TABLE transaction;



-- ********* SYNTHETIC DATA ************* --

INSERT INTO user (fname, lname, username, password, email, credit)
VALUES ('George', 'Pasparakis', 'georgepasp', '1234', 'gpasparakis@gmail.com', 652),
('Tasos', 'Lelakis', 'emergon', '1234', 'tlelakis@gmail.com', 1245.35);

INSERT INTO role(rolename) 
VALUES ('ROLE_ADMIN'),
('ROLE_USER'),
('ROLE_GUEST');

INSERT INTO user_role(userid, roleid)
VALUES (1,1),
(2,2);

INSERT INTO house (hlocation, hfloor, hsize, hroom, hbathroom, hheating, hphoto, hfurnished, hdescr)
VALUES ('Navarinou 8', 1, 70, 2, 1, 'fusiko aerio', 'c\:images\house.png', 'No', 'Newly renovated, very cosy'),
('Kifisias 65',  2, 50, 1, 2, 'Central with oil', 'c\:images\house2.png', 'Yes', 'Old apartment, very close to transportation');

INSERT INTO item (ititle, iprice, istatus, house , user)
VALUES ('Renovated home', 500, 'OPEN', 1, 2),
('Central Athens', 300, 'CLOSED', 2 , 1);

INSERT INTO image (iphoto, house)
VALUES ('c\:images\house.png', 1),
('c\:images\house2.png',2);

INSERT INTO auction (aincrement, areserve, stime, etime, item)
VALUES (10, 120, '2019-12-14 12:30:15','2020-01-14 12:30:15', 1),
(10, 90, '2019-11-30 13:15:20', '2020-01-30 13:15:20', 2);

INSERT INTO bid (bprice, btime, auction, user)
VALUES (140, '2019-12-14 14:30:15', 1, 2),
(120, '2019-12-14 14:30:15', 2, 1);

INSERT INTO transaction(tprice, auction)
VALUES (600, 1),
(400, 2);


