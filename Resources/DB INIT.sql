-- 数据库创建以及填充数据据代码


-- auto-generated definition
create schema db collate utf8mb4_0900_ai_ci;
-- auto-generated definition
create table admins
(
    admin_id int         not null
        primary key,
    username varchar(50) null,
    password varchar(50) null
);
use db;
INSERT INTO Admins (admin_id, username, password) VALUES
(1, 'admin1', 'password1'),
(2, 'admin2', 'password2'),
(3, 'admin3', 'password3'),
(4, 'admin4', 'password4'),
(5, 'admin5', 'password5'),
(6, 'admin6', 'password6'),
(7, 'admin7', 'password7'),
(8, 'admin8', 'password8'),
(9, 'admin9', 'password9'),
(10, 'admin10', 'password10'),
(11, 'admin11', 'password11'),
(12, 'admin12', 'password12'),
(13, 'admin13', 'password13'),
(14, 'admin14', 'password14'),
(15, 'admin15', 'password15'),
(16, 'admin16', 'password16'),
(17, 'admin17', 'password17'),
(18, 'admin18', 'password18'),
(19, 'admin19', 'password19'),
(20, 'admin20', 'password20'),
(21, 'admin21', 'password21'),
(22, 'admin22', 'password22'),
(23, 'admin23', 'password23'),
(24, 'admin24', 'password24'),
(25, 'admin25', 'password25'),
(26, 'admin26', 'password26'),
(27, 'admin27', 'password27'),
(28, 'admin28', 'password28'),
(29, 'admin29', 'password29'),
(30, 'admin30', 'password30'),
(31, 'admin31', 'password31'),
(32, 'admin32', 'password32'),
(33, 'admin33', 'password33'),
(34, 'admin34', 'password34'),
(35, 'admin35', 'password35'),
(36, 'admin36', 'password36'),
(37, 'admin37', 'password37'),
(38, 'admin38', 'password38'),
(39, 'admin39', 'password39'),
(40, 'admin40', 'password40'),
(41, 'admin41', 'password41'),
(42, 'admin42', 'password42'),
(43, 'admin43', 'password43'),
(44, 'admin44', 'password44'),
(45, 'admin45', 'password45'),
(46, 'admin46', 'password46'),
(47, 'admin47', 'password47'),
(48, 'admin48', 'password48'),
(49, 'admin49', 'password49'),
(50, 'admin50', 'password50');
-- auto-generated definition
create table locations
(
    location_id int            not null
        primary key,
    vehicle_id  int            null,
    latitude    decimal(10, 6) null,
    longitude   decimal(10, 6) null,
    address     varchar(100)   null,
    constraint locations_ibfk_1
        foreign key (vehicle_id) references vehicles (vehicle_id)
);

create index vehicle_id
    on locations (vehicle_id);

use db;
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (1, 1, 31.2304, 121.4737, '上海市黄浦区南京东路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (2, 2, 39.9042, 116.4074, '北京市东城区天安门');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (3, 3, 23.1291, 113.2644, '广州市越秀区珠江新城');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (4, 4, 30.5728, 104.0668, '成都市青羊区春熙路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (5, 5, 22.5431, 114.0579, '深圳市福田区会展中心');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (6, 6, 31.9686, 118.7781, '南京市玄武区夫子庙');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (7, 7, 39.0842, 117.2009, '天津市和平区解放北路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (8, 8, 36.0611, 103.8343, '兰州市城关区中山路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (9, 9, 34.3416, 108.9398, '西安市雁塔区大雁塔');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (10, 10, 32.0603, 118.7969, '南京市江宁区秣周东路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (11, 11, 30.2741, 120.1551, '杭州市西湖区延安路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (12, 12, 31.5497, 120.3388, '苏州市姑苏区观前街');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (13, 13, 23.1200, 113.3077, '广州市荔湾区沙面街');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (14, 14, 24.4798, 118.0894, '厦门市思明区中山路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (15, 15, 22.8167, 108.3167, '南宁市青秀区明秀路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (16, 16, 30.6634, 104.0726, '成都市锦江区春熙路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (17, 17, 30.5931, 114.3054, '武汉市江汉区解放大道');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (18, 18, 29.5630, 106.5516, '重庆市渝中区解放碑');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (19, 19, 23.1748, 113.3203, '广州市天河区天河路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (20, 20, 38.0488, 114.5149, '石家庄市长安区裕华路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (21, 21, 34.2904, 108.9480, '西安市雁塔区小寨路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (22, 22, 22.5382, 113.9810, '深圳市南山区科技园');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (23, 23, 36.6764, 117.0094, '济南市历下区泉城路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (24, 24, 31.8174, 117.2344, '合肥市蜀山区望江西路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (25, 25, 34.7466, 113.6254, '郑州市金水区农业路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (26, 26, 31.3041, 120.5954, '苏州市姑苏区虎丘区');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (27, 27, 36.0621, 103.8398, '兰州市城关区酒泉路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (28, 28, 29.5574, 106.5770, '重庆市渝中区大坪街');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (29, 29, 39.9049, 116.4074, '北京市东城区故宫');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (30, 30, 22.8170, 108.3665, '南宁市青秀区民族大道');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (31, 31, 31.2336, 121.5050, '上海市浦东新区陆家嘴');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (32, 32, 30.6108, 114.3438, '武汉市武昌区东湖路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (33, 33, 24.8797, 102.8332, '昆明市五华区昆明市政府');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (34, 34, 34.3416, 108.9398, '西安市雁塔区曲江南路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (35, 35, 30.6560, 104.0657, '成都市锦江区天府广场');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (36, 36, 38.0428, 114.5149, '石家庄市长安区石家庄火车站');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (37, 37, 22.5431, 114.0579, '深圳市福田区华强北');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (38, 38, 39.0851, 117.1994, '天津市和平区海河');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (39, 39, 31.9686, 118.7588, '南京市建邺区南京长江大桥');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (40, 40, 34.2741, 108.9470, '西安市雁塔区唐长安街');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (41,41, 23.1291, 113.2644, '广州市海珠区广州塔');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (42, 42, 31.2304, 121.4737, '上海市徐汇区复兴中路');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (43, 43, 39.9042, 116.4074, '北京市东城区王府井');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (44, 44, 23.1291, 113.2644, '广州市越秀区广州火车站');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (45, 45, 30.5728, 104.0668, '成都市青羊区成都火车站');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (46, 46, 22.5431, 114.0579, '深圳市福田区深圳火车站');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (47, 47, 31.9686, 118.7781, '南京市玄武区南京火车站');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (48, 48, 39.0842, 117.2009, '天津市和平区天津火车站');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (49, 49, 36.0611, 103.8343, '兰州市城关区兰州火车站');
INSERT INTO Locations (location_id, vehicle_id, latitude, longitude, address)
VALUES (50, 50, 34.3416, 108.9398, '西安市雁塔区西安火车站');


create table messages
(
    message_id      int          not null
        primary key,
    sender_id       int          null,
    receiver_id     int          null,
    message_content varchar(200) null,
    timestamp       timestamp    null,
    constraint messages_ibfk_1
        foreign key (sender_id) references users (user_id)
            on delete cascade,
    constraint messages_ibfk_2
        foreign key (receiver_id) references users (user_id)
            on delete cascade
);

create index receiver_id
    on messages (receiver_id);

create index sender_id
    on messages (sender_id);

create table payments
(
    payment_id   int           not null
        primary key,
    rental_id    int           null,
    payment_date date          null,
    amount       decimal(8, 2) null,
    constraint payments_ibfk_1
        foreign key (rental_id) references rentals (rental_id)
);

create index rental_id
    on payments (rental_id);

use db;
INSERT INTO Payments (payment_id, rental_id, payment_date, amount) VALUES
(1, 1, '2024-06-01', 100),
(2, 2, '2024-06-02', 150),
(3, 3, '2024-06-03', 120),
(4, 4, '2024-06-04', 200),
(5, 5, '2024-06-05', 180),
(6, 6, '2024-06-06', 130),
(7, 7, '2024-06-07', 110),
(8, 8, '2024-06-08', 190),
(9, 9, '2024-06-09', 170),
(10, 10, '2024-06-10', 140),
(11, 11, '2024-06-11', 160),
(12, 12, '2024-06-12', 125),
(13, 13, '2024-06-13', 115),
(14, 14, '2024-06-14', 205),
(15, 15, '2024-06-15', 195),
(16, 16, '2024-06-16', 145),
(17, 17, '2024-06-17', 155),
(18, 18, '2024-06-18', 135),
(19, 19, '2024-06-19', 225),
(20, 20, '2024-06-20', 165),
(21, 21, '2024-06-21', 185),
(22, 22, '2024-06-22', 175),
(23, 23, '2024-06-23', 210),
(24, 24, '2024-06-24', 230),
(25, 25, '2024-06-25', 220),
(26, 26, '2024-06-26', 240),
(27, 27, '2024-06-27', 270),
(28, 28, '2024-06-28', 250),
(29, 29, '2024-06-29', 260),
(30, 30, '2024-06-30', 280),
(31, 31, '2024-07-01', 290),
(32, 32, '2024-07-02', 300),
(33, 33, '2024-07-03', 310),
(34, 34, '2024-07-04', 320),
(35, 35, '2024-07-05', 330),
(36, 36, '2024-07-06', 340),
(37, 37, '2024-07-07', 350),
(38, 38, '2024-07-08', 360),
(39, 39, '2024-07-09', 370),
(40, 40, '2024-07-10', 380),
(41, 41, '2024-07-11', 390),
(42, 42, '2024-07-12', 400),
(43, 43, '2024-07-13', 410),
(44, 44, '2024-07-14', 420),
(45, 45, '2024-07-15', 430),
(46, 46, '2024-07-16', 440),
(47, 47, '2024-07-17', 450),
(48, 48, '2024-07-18', 460),
(49, 49, '2024-07-19', 470),
(50, 50, '2024-07-20', 480);
-- auto-generated definition
create table rentals
(
    rental_id   int         not null
        primary key,
    user_id     int         null,
    vehicle_id  int         null,
    rental_date date        null,
    return_date date        null,
    status      varchar(20) null,
    constraint rentals_ibfk_1
        foreign key (user_id) references users (user_id),
    constraint rentals_ibfk_2
        foreign key (vehicle_id) references vehicles (vehicle_id)
);

create index user_id
    on rentals (user_id);

create index vehicle_id
    on rentals (vehicle_id);

use db;
INSERT INTO Rentals (rental_id, user_id, vehicle_id, rental_date, return_date, status) VALUES
(1, 1, 1, '2024-06-01', '2024-06-10', '请求中'),
(2, 2, 2, '2024-06-02', '2024-06-12', '已审核'),
(3, 3, 3, '2024-06-03', '2024-06-13', '已借出'),
(4, 4, 4, '2024-06-04', '2024-06-14', '已归还'),
(5, 5, 5, '2024-06-05', '2024-06-15', '请求中'),
(6, 6, 6, '2024-06-06', '2024-06-16', '已审核'),
(7, 7, 7, '2024-06-07', '2024-06-17', '已借出'),
(8, 8, 8, '2024-06-08', '2024-06-18', '已归还'),
(9, 9, 9, '2024-06-09', '2024-06-19', '请求中'),
(10, 10, 10, '2024-06-10', '2024-06-20', '已审核'),
(11, 11, 11, '2024-06-11', '2024-06-21', '已借出'),
(12, 12, 12, '2024-06-12', '2024-06-22', '已归还'),
(13, 13, 13, '2024-06-13', '2024-06-23', '请求中'),
(14, 14, 14, '2024-06-14', '2024-06-24', '已审核'),
(15, 15, 15, '2024-06-15', '2024-06-25', '已借出'),
(16, 16, 16, '2024-06-16', '2024-06-26', '已归还'),
(17, 17, 17, '2024-06-17', '2024-06-27', '请求中'),
(18, 18, 18, '2024-06-18', '2024-06-28', '已审核'),
(19, 19, 19, '2024-06-19', '2024-06-29', '已借出'),
(20, 20, 20, '2024-06-20', '2024-06-30', '已归还'),
(21, 21, 21, '2024-06-21', '2024-07-01', '请求中'),
(22, 22, 22, '2024-06-22', '2024-07-02', '已审核'),
(23, 23, 23, '2024-06-23', '2024-07-03', '已借出'),
(24, 24, 24, '2024-06-24', '2024-07-04', '已归还'),
(25, 25, 25, '2024-06-25', '2024-07-05', '请求中'),
(26, 26, 26, '2024-06-26', '2024-07-06', '已审核'),
(27, 27, 27, '2024-06-27', '2024-07-07', '已借出'),
(28, 28, 28, '2024-06-28', '2024-07-08', '已归还'),
(29, 29, 29, '2024-06-29', '2024-07-09', '请求中'),
(30, 30, 30, '2024-06-30', '2024-07-10', '已审核'),
(31, 31, 31, '2024-07-01', '2024-07-11', '已借出'),
(32, 32, 32, '2024-07-02', '2024-07-12', '已归还'),
(33, 33, 33, '2024-07-03', '2024-07-13', '请求中'),
(34, 34, 34, '2024-07-04', '2024-07-14', '已审核'),
(35, 35, 35, '2024-07-05', '2024-07-15', '已借出'),
(36, 36, 36, '2024-07-06', '2024-07-16', '已归还'),
(37, 37, 37, '2024-07-07', '2024-07-17', '请求中'),
(38, 38, 38, '2024-07-08', '2024-07-18', '已审核'),
(39, 39, 39, '2024-07-09', '2024-07-19', '已借出'),
(40, 40, 40, '2024-07-10', '2024-07-20', '已归还'),
(41, 41, 41, '2024-07-11', '2024-07-21', '请求中'),
(42, 42, 42, '2024-07-12', '2024-07-22', '已审核'),
(43, 43, 43, '2024-07-13', '2024-07-23', '已借出'),
(44, 44, 44, '2024-07-14', '2024-07-24', '已归还'),
(45, 45, 45, '2024-07-15', '2024-07-25', '请求中'),
(46, 46, 46, '2024-07-16', '2024-07-26', '已审核'),
(47, 47, 47, '2024-07-17', '2024-07-27', '已借出'),
(48, 48, 48, '2024-07-18', '2024-07-28', '已归还'),
(49, 49, 49, '2024-07-19', '2024-07-29', '请求中'),
(50, 50, 50, '2024-07-20', '2024-07-30', '已审核');
-- auto-generated definition
create table reviews
(
    review_id  int          not null
        primary key,
    user_id    int          null,
    vehicle_id int          null,
    rating     int          null,
    comment    varchar(200) null,
    constraint reviews_ibfk_1
        foreign key (user_id) references users (user_id),
    constraint reviews_ibfk_2
        foreign key (vehicle_id) references vehicles (vehicle_id)
);

create index user_id
    on reviews (user_id);

create index vehicle_id
    on reviews (vehicle_id);

use db ;
INSERT INTO Reviews (review_id, user_id, vehicle_id, rating, comment) VALUES
(1, 1, 1, 5, '服务非常好，车辆也很棒。'),
(2, 2, 2, 4, '体验不错，但车子可以更干净一些。'),
(3, 3, 3, 3, '一般般，车子有点问题。'),
(4, 4, 4, 5, '非常喜欢！车况很好。'),
(5, 5, 5, 2, '很失望，车在半路抛锚了。'),
(6, 6, 6, 4, '车子不错，开起来很顺。'),
(7, 7, 7, 3, '车还行，但服务有点慢。'),
(8, 8, 8, 5, '太棒了！强烈推荐。'),
(9, 9, 9, 4, '性价比高。'),
(10, 10, 10, 3, '车不是很干净。'),
(11, 11, 11, 2, '不满意，以前有更好的体验。'),
(12, 12, 12, 4, '整体不错。'),
(13, 13, 13, 5, '超赞的体验，下次还会租。'),
(14, 14, 14, 3, '还行，没有特别之处。'),
(15, 15, 15, 4, '不错的选择，服务好。'),
(16, 16, 16, 5, '服务和车况都非常好。'),
(17, 17, 17, 2, '不推荐。'),
(18, 18, 18, 4, '总体不错，就是有点贵。'),
(19, 19, 19, 3, '一般的服务，普通的车。'),
(20, 20, 20, 5, '很喜欢这辆车！非常干净可靠。'),
(21, 21, 21, 4, '体验不错，车有些小问题。'),
(22, 22, 22, 3, '还行，车比预期的旧。'),
(23, 23, 23, 5, '完美！一切都很顺利。'),
(24, 24, 24, 4, '车不错，服务也很友好。'),
(25, 25, 25, 3, '车有些机械问题。'),
(26, 26, 26, 4, '租车体验不错，会考虑再来。'),
(27, 27, 27, 5, '车子很棒，非常满意。'),
(28, 28, 28, 2, '体验不好，车子有很多问题。'),
(29, 29, 29, 4, '不错的体验，车还可以。'),
(30, 30, 30, 3, '车还行，但有些磨损。'),
(31, 31, 31, 5, '超棒的车和服务！'),
(32, 32, 32, 4, '总体不错，有些小问题。'),
(33, 33, 33, 3, '一般的体验，没什么特别的。'),
(34, 34, 34, 5, '车子很好，很满意！'),
(35, 35, 35, 2, '对车况感到失望。'),
(36, 36, 36, 4, '车不错，服务挺好。'),
(37, 37, 37, 5, '绝佳的体验，强烈推荐。'),
(38, 38, 38, 3, '还行，但可以更好。'),
(39, 39, 39, 4, '对租车体验很满意。'),
(40, 40, 40, 3, '车一般，没有什么特别的。'),
(41, 41, 41, 5, '非常棒！一定会再租。'),
(42, 42, 42, 4, '整体体验不错。'),
(43, 43, 43, 2, '不满意，车有问题。'),
(44, 44, 44, 5, '车和服务都很棒！'),
(45, 45, 45, 4, '车不错，服务满意。'),
(46, 46, 46, 3, '车还行，不过有点旧。'),
(47, 47, 47, 5, '非常喜欢这辆车，开起来很顺畅。'),
(48, 48, 48, 4, '性价比高，车不错。'),
(49, 49, 49, 3, '体验还行，车可以更好。'),
(50, 50, 50, 4, '对车和服务都满意。');
-- auto-generated definition
create table users
(
    user_id  int         not null
        primary key,
    username varchar(50) null,
    password varchar(50) null,
    email    varchar(50) null,
    phone    varchar(20) null,
    name     varchar(20) null
);

use db;
INSERT INTO Admins (admin_id, username, password) VALUES
(1, 'admin1', 'password1'),
(2, 'admin2', 'password2'),
(3, 'admin3', 'password3'),
(4, 'admin4', 'password4'),
(5, 'admin5', 'password5'),
(6, 'admin6', 'password6'),
(7, 'admin7', 'password7'),
(8, 'admin8', 'password8'),
(9, 'admin9', 'password9'),
(10, 'admin10', 'password10'),
(11, 'admin11', 'password11'),
(12, 'admin12', 'password12'),
(13, 'admin13', 'password13'),
(14, 'admin14', 'password14'),
(15, 'admin15', 'password15'),
(16, 'admin16', 'password16'),
(17, 'admin17', 'password17'),
(18, 'admin18', 'password18'),
(19, 'admin19', 'password19'),
(20, 'admin20', 'password20'),
(21, 'admin21', 'password21'),
(22, 'admin22', 'password22'),
(23, 'admin23', 'password23'),
(24, 'admin24', 'password24'),
(25, 'admin25', 'password25'),
(26, 'admin26', 'password26'),
(27, 'admin27', 'password27'),
(28, 'admin28', 'password28'),
(29, 'admin29', 'password29'),
(30, 'admin30', 'password30'),
(31, 'admin31', 'password31'),
(32, 'admin32', 'password32'),
(33, 'admin33', 'password33'),
(34, 'admin34', 'password34'),
(35, 'admin35', 'password35'),
(36, 'admin36', 'password36'),
(37, 'admin37', 'password37'),
(38, 'admin38', 'password38'),
(39, 'admin39', 'password39'),
(40, 'admin40', 'password40'),
(41, 'admin41', 'password41'),
(42, 'admin42', 'password42'),
(43, 'admin43', 'password43'),
(44, 'admin44', 'password44'),
(45, 'admin45', 'password45'),
(46, 'admin46', 'password46'),
(47, 'admin47', 'password47'),
(48, 'admin48', 'password48'),
(49, 'admin49', 'password49'),
(50, 'admin50', 'password50');
-- auto-generated definition
create table vehicles
(
    vehicle_id    int           not null
        primary key,
    type          varchar(50)   null,
    model         varchar(50)   null,
    year          int           null,
    status        varchar(20)   null,
    price_per_day decimal(8, 2) null
);

use db;
INSERT INTO Vehicles (vehicle_id, type, model, year, status, price_per_day) VALUES
(1, 'Sedan', 'Toyota Camry', 2019, 'Available', 50.00),
(2, 'SUV', 'Jeep Grand Cherokee', 2018, 'Rented', 70.00),
(3, 'Hatchback', 'Honda Fit', 2020, 'Available', 45.00),
(4, 'Truck', 'Ford F-150', 2017, 'Maintenance', 60.00),
(5, 'Convertible', 'Chevrolet Camaro', 2019, 'Available', 80.00),
(6, 'Sedan', 'Nissan Altima', 2018, 'Available', 55.00),
(7, 'SUV', 'Subaru Outback', 2021, 'Available', 65.00),
(8, 'Hatchback', 'Volkswagen Golf', 2019, 'Rented', 48.00),
(9, 'Truck', 'GMC Sierra 1500', 2016, 'Available', 70.00),
(10, 'Sedan', 'Hyundai Elantra', 2020, 'Available', 52.00),
(11, 'SUV', 'Ford Explorer', 2018, 'Maintenance', 75.00),
(12, 'Hatchback', 'Toyota Prius', 2019, 'Available', 47.00),
(13, 'Truck', 'Ram 1500', 2020, 'Rented', 68.00),
(14, 'Sedan', 'Kia Optima', 2017, 'Available', 51.00),
(15, 'SUV', 'Mazda CX-5', 2018, 'Available', 67.00),
(16, 'Hatchback', 'Ford Fiesta', 2020, 'Rented', 46.00),
(17, 'Truck', 'Chevrolet Silverado 1500', 2019, 'Available', 72.00),
(18, 'Sedan', 'Honda Accord', 2018, 'Available', 53.00),
(19, 'SUV', 'Toyota RAV4', 2017, 'Available', 69.00),
(20, 'Hatchback', 'Nissan Versa', 2020, 'Rented', 49.00),
(21, 'Truck', 'Toyota Tundra', 2019, 'Available', 73.00),
(22, 'Sedan', 'Subaru Legacy', 2018, 'Rented', 54.00),
(23, 'SUV', 'Jeep Wrangler', 2020, 'Available', 72.00),
(24, 'Hatchback', 'Hyundai Accent', 2019, 'Available', 50.00),
(25, 'Truck', 'Ford Ranger', 2017, 'Maintenance', 65.00),
(26, 'Sedan', 'Chevrolet Malibu', 2020, 'Available', 56.00),
(27, 'SUV', 'Kia Sorento', 2018, 'Available', 70.00),
(28, 'Hatchback', 'Honda Civic', 2019, 'Rented', 48.00),
(29, 'Truck', 'GMC Canyon', 2020, 'Available', 71.00),
(30, 'Sedan', 'Volkswagen Jetta', 2018, 'Available', 52.00),
(31, 'SUV', 'Ford Escape', 2017, 'Available', 68.00),
(32, 'Hatchback', 'Toyota Yaris', 2020, 'Rented', 45.00),
(33, 'Truck', 'Ram 2500', 2019, 'Available', 75.00),
(34, 'Sedan', 'Mazda6', 2018, 'Available', 53.00),
(35, 'SUV', 'Subaru Forester', 2017, 'Available', 69.00),
(36, 'Hatchback', 'Chevrolet Spark', 2020, 'Rented', 47.00),
(37, 'Truck', 'Nissan Titan', 2019, 'Available', 72.00),
(38, 'Sedan', 'Kia Forte', 2018, 'Rented', 54.00),
(39, 'SUV', 'Hyundai Santa Fe', 2020, 'Available', 73.00),
(40, 'Hatchback', 'Honda Fit', 2019, 'Available', 50.00),
(41, 'Truck', 'Ford F-150', 2017, 'Maintenance', 65.00),
(42, 'Sedan', 'Chevrolet Impala', 2020, 'Available', 56.00),
(43, 'SUV', 'Toyota Highlander', 2018, 'Available', 70.00),
(44, 'Hatchback', 'Nissan Leaf', 2019, 'Rented', 48.00),
(45, 'Truck', 'GMC Sierra 1500', 2020, 'Available', 71.00),
(46, 'Sedan', 'Subaru Impreza', 2018, 'Available', 52.00),
(47, 'SUV', 'Jeep Grand Cherokee', 2017, 'Rented', 68.00),
(48, 'Hatchback', 'Ford Fiesta', 2020, 'Available', 45.00),
(49, 'Truck', 'Chevrolet Silverado 1500', 2019, 'Available', 72.00),
(50, 'Sedan', 'Honda Accord', 2018, 'Available', 53.00);

