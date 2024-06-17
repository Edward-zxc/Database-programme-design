# 数据库设计

## 1.需求分析

#### 管理员功能需求
- 添加、删除、修改、查询车辆信息
- 添加、删除、修改、查询用户信息
- 添加、删除、修改、查询租赁信息
- 审核用户借车请求，进行出车和回车操作

#### 用户功能需求
- 查询车辆信息
- 查看租赁信息
- 查询自己的用户信息
- 选择可借用车辆并发出借车请求

##  2.数据库表设计（主要表结构）

1. **Admins 表**：存储管理员信息
    - `admin_id` (主键)
    - `username`
    - `password`
    - `name`

2. **Users 表**：存储用户信息
    - `user_id` (主键)
    - `username`
    - `password`
    - `name`
    - `email`
    - `phone`

3. **UserRequests 表**：存储用户的借车请求信息
    - `request_id` (主键)
    - `user_id` (外键，关联到 Users 表)
    - `vehicle_id` (外键，关联到 Vehicles 表)
    - `request_date`
    - `status` (状态 - 待审核, 已审核, 已拒绝)

4. **Vehicles 表**：存储车辆信息
    - `vehicle_id` (主键)
    - `make`
    - `model`
    - `year`
    - `status` (状态 - 可借, 已借出, 维护中等)
    - `price_per_day`

5. **Rentals 表**：存储租赁信息
    - `rental_id` (主键)
    - `user_id` (外键，关联到 Users 表)
    - `vehicle_id` (外键，关联到 Vehicles 表)
    - `rental_date`
    - `return_date`
    - `status` (状态 - 请求中, 已审核, 已借出, 已归还)

6. **VehicleMaintenance 表**：存储车辆维护信息
    - `maintenance_id` (主键)
    - `vehicle_id` (外键，关联到 Vehicles 表)
    - `maintenance_date`
    - `description`

7. **Payments 表**：存储支付信息
    - `payment_id` (主键)
    - `rental_id` (外键，关联到 Rentals 表)
    - `payment_date`
    - `amount`

8. **Reviews 表**：存储用户对车辆的评价信息
    - `review_id` (主键)
    - `user_id` (外键，关联到 Users 表)
    - `vehicle_id` (外键，关联到 Vehicles 表)
    - `rating`
    - `comment`

9. **Locations 表**：存储车辆位置信息
    - `location_id` (主键)
    - `vehicle_id` (外键，关联到 Vehicles 表)
    - `latitude`
    - `longitude`
    - `address`

10. **Messages 表**：存储用户和管理员之间的消息通信记录
    - `message_id` (主键)
    - `sender_id` (外键，关联到 Users 表或 Admins 表)
    - `receiver_id` (外键，关联到 Users 表或 Admins 表)
    - `message_content`
    - `timestamp`

## 业务流程车辆租赁系统业务流程

1. **用户注册和登录**
   - 用户可以通过注册账号来成为系统的用户，并使用用户名和密码进行登录。

2. **车辆浏览和查询**
   - 用户可以浏览系统中所有可租赁的车辆，并根据自己的需求查询特定类型或特定条件的车辆。

3. **车辆预订**
   - 用户可以选择心仪的车辆，然后提出借车请求，包括预计的借车时间和归还时间。

4. **管理员审核**
   - 管理员收到用户的借车请求后，对请求进行审核，确认车辆是否可借出，并进行相应的处理。

5. **租赁支付**
   - 用户可以在系统中完成租赁费用的支付，包括租金和押金等。

6. **车辆取用和归还**
   - 用户在借车时间到达时取用车辆，并在归还时间前将车辆归还至指定地点。

7. **车辆维护**
   - 系统会记录车辆的维护情况，包括维护时间和维护描述，以保证车辆的正常运行状态。

8. **用户评价**
   - 用户可以对租赁的车辆进行评价，包括评分和评论，以供其他用户参考。

9. **系统消息通知**
   - 用户和管理员之间可以进行消息通信，包括借车请求的确认、支付信息的提醒等。

这些业务流程涵盖了用户、管理员以及车辆在租赁系统中的主要操作和交互过程，能够满足用户租车、管理员管理、车辆运营等方面的需求。

# 3.实体关系图（ERD）

