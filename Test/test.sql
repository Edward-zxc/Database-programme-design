-- 测试样例
/*用户注册登录模块*/
-- 用户注册
CALL register_user(52, 'john_doe', 'hashed_password_value', 'john_doe@example.com', '1234567890'); -- 添加了 user_id 参数
-- 用户登录失败
CALL login_user('john_doe', 'input_password_value');
-- 用户登录成功
CALL login_user('john_doe', 'hashed_password_value');
-- 更新用户测试
CALL update_user(1, 'JaneDoe', '654321', 'janedoe@example.com', '0987654321');

/*管理员注册登录模块*/
-- 注册管理员
CALL register_admin(52,'admin_user', 'admin_user');
-- 登录管理员
-- 失败
CALL login_admin(51,'admin_user');
-- 成功
CALL login_admin(52,'admin_user');

/*用户借车请求*/
-- 调用存储过程，传入具体参数
-- 可借
CALL GetFilteredVehicles('SUV', '可借',1000.00);
-- 不可借
CALL GetFilteredVehicles('Hatchback', '已借出',10000.00);
-- 维护中
CALL GetFilteredVehicles('Truck', '维护中',10000.00);


-- 测试 1：输入有效的参数
CALL SubmitLoanRequest(60, 1, 1, '2024-06-01', '待审核');

-- 测试 2：输入请求 ID 为 0
CALL SubmitLoanRequest(52, 2, 3, '2023-09-01', 'Pending');

-- 测试 3：输入用户 ID 为 0
CALL SubmitLoanRequest(53, 0, 3, '2023-09-01', 'Pending');

-- 测试 4：输入车辆 ID 为 0
CALL SubmitLoanRequest(54, 2, 0, '2023-09-01', 'Pending');

-- 测试 5：输入全部有效的不同参数
CALL SubmitLoanRequest(55, 6, 7, '2023-09-02', 'Approved');

-- 假设要提交一个请求，请求 ID 为 101，用户 ID 为 201，车辆 ID 为 301，请求日期为 '2024-07-15'，状态为 '待审核'
CALL SubmitLoanRequest(56, 50, 50, '2024-07-15', '待审核');

-- 或者另一个请求，请求 ID 为 102，用户 ID 为 202，车辆 ID 为 302，请求日期为 '2024-07-16'，状态为 '已批准'
CALL SubmitLoanRequest(102, 202, 302, '2024-07-16', '已批准');


-- 测试 1：车辆可用，请求审核成功
CALL ProcessRentalRequest(1);  -- 假设 rental_id 为 1 的车辆可用

-- 测试 2：车辆不可用
CALL ProcessRentalRequest(2);  -- 假设 rental_id 为 2 的车辆不可用

-- 测试 3：不存在的 rental_id
CALL ProcessRentalRequest(999);  -- 假设 999 不存在于 Rentals 表中

-- 测试 4：车辆已处于已审核状态
UPDATE Rentals SET status = '已审核' WHERE rental_id = 3;
CALL ProcessRentalRequest(3);  -- 检查对已审核的请求的处理

-- 测试 5：车辆已处于已借出状态
UPDATE Rentals SET status = '已借出' WHERE rental_id = 4;
CALL ProcessRentalRequest(4);  -- 检查对已借出车辆的请求处理

-- 测试 1：余额足够，支付成功
-- 假设用户余额为 1000.00，支付金额为 500.00
CALL MakePayment(51, 1, '2023-09-18', 500.00);

-- 测试 2：余额不足，支付失败
-- 假设用户余额为 300.00，支付金额为 500.00
CALL MakePayment(2, 2, '2023-09-18', 500.00);

-- 测试 3：租赁 ID 不存在
CALL MakePayment(3, 999, '2023-09-18', 500.00);


-- 插入测试
CALL InsertVehicleMaintenance(51, 50, '2023-09-20', '更换机油和滤清器');

-- 更新测试
CALL UpdateVehicleMaintenance(1, 50, '2023-09-21', '更换机油、滤清器和刹车片');

-- 删除测试
CALL DeleteVehicleMaintenance(1);

-- 根据 ID 获取维护记录测试
CALL GetVehicleMaintenanceById(1);  -- 期望结果：无记录，因为已删除

-- 获取所有维护记录测试
CALL GetAllVehicleMaintenance();


-- 插入测试
CALL InsertVehicle(1, '轿车', '丰田卡罗拉', 2020, '可借', 100.00);

-- 更新测试
CALL UpdateVehicle(1, '轿车', '丰田凯美瑞', 2021, '已借出', 150.00);

-- 删除测试
CALL DeleteVehicle(1);

-- 根据 ID 获取车辆信息测试
CALL GetVehicleById(33);  -- 期望结果：无记录，因为已删除

-- 获取所有车辆信息测试
CALL GetAllVehicles();