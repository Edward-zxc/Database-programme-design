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

