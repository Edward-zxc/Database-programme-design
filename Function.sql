-- 注册和登录模块功能
-- 用户功能模块
-- 注册用户的存储过程
CREATE PROCEDURE register_user (
    IN p_userid INT,
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(15)
)
BEGIN
    INSERT INTO users (user_id, username, password, email, phone)
    VALUES (p_userid, p_username, p_password, p_email, p_phone);
END;

-- 登录验证的存储过程
CREATE PROCEDURE login_user (
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255)
)
BEGIN
    DECLARE hashed_password VARCHAR(255);

    SELECT password INTO hashed_password
    FROM users
    WHERE username = p_username;

    IF hashed_password = p_password THEN
        SELECT '恭喜你，登录成功！' AS result;
    ELSE
        SELECT '抱歉，登录失败，请再次尝试！' AS result;
    END IF;
END;

DELIMITER ;

-- 调用存储过程
-- 测试样例
-- 用户注册
CALL register_user(51, 'john_doe', 'hashed_password_value', 'john_doe@example.com', '1234567890'); -- 添加了 user_id 参数
-- 用户登录失败
CALL login_user('john_doe', 'input_password_value');
-- 用户登录成功
CALL login_user('john_doe', 'hashed_password_value');

-- 管理员注册登录
DELIMITER ;

DELIMITER //

CREATE PROCEDURE login_admin (
    IN p_userid INT,
    IN p_password VARCHAR(255)
)
BEGIN
    DECLARE hashed_password VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR NOT FOUND
    BEGIN
        SELECT '管理员ID不存在！' AS result;
    END;

    SELECT password INTO hashed_password
    FROM admins
    WHERE admin_id = p_userid;

    IF hashed_password = p_password THEN
        SELECT '管理员登录成功！' AS result;
    ELSE
        SELECT '管理员登录失败，请检查用户名和密码。' AS result;
    END IF;
END//

-- 注册管理员存储过程
CREATE PROCEDURE register_admin (
    IN p_userid INT,
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255)
)
BEGIN
    INSERT INTO admins (admin_id, username, password)
    VALUES (p_userid, p_username, p_password);
END//

DELIMITER ;

-- 测试样例
-- 注册管理员
CALL register_admin(52,'admin_user', 'admin_user');
-- 登录管理员
-- 失败
CALL login_admin(51,'admin_user');
-- 成功
CALL login_admin(52,'admin_user');

-- 车辆浏览和查询
DELIMITER //

CREATE PROCEDURE GetFilteredVehicles(
    IN p_type VARCHAR(50),
    IN p_status VARCHAR(50),
    IN p_max_price DECIMAL(10, 2)
)
BEGIN


    -- 初始化SQL查询语句，选择所有车辆信息
    SET @sql_query = 'SELECT vehicle_id, type, model, year, status, price_per_day
                      FROM vehicles
                      WHERE 1=1';

    -- 如果车辆类型参数不为空，则添加类型筛选条件
    IF p_type IS NOT NULL THEN
        SET @sql_query = CONCAT(@sql_query, ' AND type = "', p_type, '"');
    END IF;

    -- 如果车辆状态参数不为空，则添加状态筛选条件
    IF p_status IS NOT NULL THEN
        SET @sql_query = CONCAT(@sql_query, ' AND status = "', p_status, '"');
    END IF;

    -- 如果最大日租金参数不为空，则添加价格筛选条件
    IF p_max_price IS NOT NULL THEN
        SET @sql_query = CONCAT(@sql_query, ' AND price_per_day <= ', p_max_price);
    END IF;

    -- 准备并执行动态SQL查询语句
    PREPARE statement FROM @sql_query;
    EXECUTE statement;

    -- 释放准备的语句
    DEALLOCATE PREPARE statement;
END //

DELIMITER ;
-- 调用存储过程，传入具体参数
-- 可借
CALL GetFilteredVehicles('SUV', '可借',1000.00);
-- 不可借
CALL GetFilteredVehicles('Hatchback', '已借出',10000.00);
-- 维护中
CALL GetFilteredVehicles('Truck', '维护中',10000.00);

-- 实现借车请求

DELIMITER //

CREATE PROCEDURE SubmitLoanRequest(
    IN p_request_id INT,
    IN p_user_id INT,
    IN p_vehicle_id INT,
    IN p_request_date DATE,
    IN p_status VARCHAR(100)
)
BEGIN
    DECLARE v_request_id INT;

    -- 检查输入参数是否有效
    IF p_request_id <= 0 OR p_user_id <= 0 OR p_vehicle_id <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = '请求 ID、用户 ID 和车辆 ID 必须大于 0';
    ELSE
        -- 插入借车请求
        INSERT INTO UserRequests (request_id, user_id, vehicle_id, request_date, status)
        VALUES (p_request_id, p_user_id, p_vehicle_id, p_request_date, p_status);

        -- 获取新插入的请求的 request_id
        SET v_request_id = LAST_INSERT_ID();

        -- 返回请求的 request_id
        SELECT v_request_id AS request_id;

        -- 提示插入成功
        SET @message = CONCAT('借车请求成功插入，请求 ID 为: ', CAST(v_request_id AS CHAR));
        SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = @message;
    END IF;

END //

DELIMITER ;
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

-- 管理员审核
DELIMITER //

CREATE PROCEDURE ProcessRentalRequest(
    IN p_rental_id INT
)
BEGIN
    DECLARE v_vehicle_available BOOLEAN;

    -- 检查车辆是否可用
    SELECT (COUNT(*) = 0) INTO v_vehicle_available
    FROM Rentals
    WHERE vehicle_id = (SELECT vehicle_id FROM Rentals WHERE rental_id = p_rental_id)
      AND status IN ('已借出', '请求中');

    IF v_vehicle_available THEN
        -- 更新借车请求状态为已审核
        UPDATE Rentals
        SET status = '已审核'
        WHERE rental_id = p_rental_id;

        -- 输出审核成功的消息
        SELECT '借车请求审核成功，车辆可借出' AS message;
    ELSE
        -- 输出车辆不可用的消息
        SELECT '车辆当前不可借出' AS message;
    END IF;
END //

DELIMITER ;
-- 测试样例
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

-- 租聘支付
DELIMITER //

CREATE PROCEDURE MakePayment(
    IN p_payment_id INT,
    IN p_rental_id INT,
    IN p_payment_date DATE,
    IN p_amount DECIMAL(10, 2)
)
BEGIN
    DECLARE available_balance DECIMAL(10, 2);

    -- 获取用户可用余额
    SELECT user_balance INTO available_balance
    FROM payments
    WHERE rental_id = (SELECT user_id FROM Rentals WHERE rental_id = p_rental_id);

    IF available_balance >= p_amount THEN
        -- 余额足够，进行支付
        INSERT INTO db.payments (payment_id, rental_id, payment_date, amount)
        VALUES (p_payment_id, p_rental_id, p_payment_date, p_amount);

        -- 更新用户余额
        UPDATE payments
        SET user_balance = user_balance - p_amount
        WHERE rental_id = (SELECT user_id FROM Rentals WHERE rental_id = p_rental_id);

        -- 输出支付成功的消息
        SELECT '租赁支付成功' AS message;
    ELSE
        -- 余额不足，支付失败
        SELECT '余额不足，支付失败' AS message;
    END IF;
END //

DELIMITER ;


-- 测试 1：余额足够，支付成功
-- 假设用户余额为 1000.00，支付金额为 500.00
CALL MakePayment(51, 1, '2023-09-18', 500.00);

-- 测试 2：余额不足，支付失败
-- 假设用户余额为 300.00，支付金额为 500.00
CALL MakePayment(2, 2, '2023-09-18', 500.00);

-- 测试 3：租赁 ID 不存在
CALL MakePayment(3, 999, '2023-09-18', 500.00);

--  车辆维护信息
DELIMITER //

CREATE PROCEDURE InsertVehicleMaintenance(
    IN p_maintenance_id INT,
    IN p_vehicle_id INT,
    IN p_maintenance_date DATE,
    IN p_description VARCHAR(255)
)
BEGIN
    INSERT INTO VehicleMaintenance (maintenance_id, vehicle_id, maintenance_date, description)
    VALUES (p_maintenance_id, p_vehicle_id, p_maintenance_date, p_description);
END //

CREATE PROCEDURE UpdateVehicleMaintenance(
    IN p_maintenance_id INT,
    IN p_vehicle_id INT,
    IN p_maintenance_date DATE,
    IN p_description VARCHAR(255)
)
BEGIN
    UPDATE VehicleMaintenance
    SET vehicle_id = p_vehicle_id, maintenance_date = p_maintenance_date, description = p_description
    WHERE maintenance_id = p_maintenance_id;
END //

CREATE PROCEDURE DeleteVehicleMaintenance(
    IN p_maintenance_id INT
)
BEGIN
    DELETE FROM VehicleMaintenance WHERE maintenance_id = p_maintenance_id;
END //

CREATE PROCEDURE GetVehicleMaintenanceById(
    IN p_maintenance_id INT
)
BEGIN
    SELECT * FROM VehicleMaintenance WHERE maintenance_id = p_maintenance_id;
END //

CREATE PROCEDURE GetAllVehicleMaintenance()
BEGIN
    SELECT * FROM VehicleMaintenance;
END //

DELIMITER ;

-- 测试样例
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

-- 车辆信息（管理员从操作）CRUD
DELIMITER //

-- 创建插入车辆信息的存储过程
CREATE PROCEDURE InsertVehicle(
    IN p_vehicle_id INT,
    IN p_type VARCHAR(50),
    IN p_model VARCHAR(50),
    IN p_year INT,
    IN p_status VARCHAR(20),
    IN p_price_per_day DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Vehicles (vehicle_id, type, model, year, status, price_per_day)
    VALUES (p_vehicle_id, p_type, p_model, p_year, p_status, p_price_per_day);
END //

-- 创建更新车辆信息的存储过程
CREATE PROCEDURE UpdateVehicle(
    IN p_vehicle_id INT,
    IN p_type VARCHAR(50),
    IN p_model VARCHAR(50),
    IN p_year INT,
    IN p_status VARCHAR(20),
    IN p_price_per_day DECIMAL(10, 2)
)
BEGIN
    UPDATE Vehicles
    SET type = p_type, model = p_model, year = p_year, status = p_status, price_per_day = p_price_per_day
    WHERE vehicle_id = p_vehicle_id;
END //

-- 创建删除车辆信息的存储过程
CREATE PROCEDURE DeleteVehicle(
    IN p_vehicle_id INT
)
BEGIN
    DELETE FROM Vehicles WHERE vehicle_id = p_vehicle_id;
END //

-- 创建根据 ID 获取车辆信息的存储过程
CREATE PROCEDURE GetVehicleById(
    IN p_vehicle_id INT
)
BEGIN
    SELECT * FROM Vehicles WHERE vehicle_id = p_vehicle_id;
END //

-- 创建获取所有车辆信息的存储过程
CREATE PROCEDURE GetAllVehicles()
BEGIN
    SELECT * FROM Vehicles;
END //

DELIMITER ;

-- 插入测试
CALL InsertVehicle(1, '轿车', '丰田卡罗拉', 2020, '可借', 100.00);

-- 更新测试
CALL UpdateVehicle(1, '轿车', '丰田凯美瑞', 2021, '已借出', 150.00);

-- 删除测试
CALL DeleteVehicle(1);

-- 根据 ID 获取车辆信息测试
CALL GetVehicleById(1);  -- 期望结果：无记录，因为已删除

-- 获取所有车辆信息测试
CALL GetAllVehicles();