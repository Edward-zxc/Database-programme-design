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
