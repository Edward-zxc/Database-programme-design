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
    -- 声明变量用于存储动态SQL查询语句
    DECLARE sql_query VARCHAR(1000);

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