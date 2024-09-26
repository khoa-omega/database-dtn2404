-- LOCAL VARIABLE: Biến cục bộ
-- Phạm vi: Trong khối BEGIN END
-- Từ khóa: DECLARE
-- VD: DECLARE v_count INT;

-- SESSION VARIABLE: Biến session
-- Phạm vi: Trong một session
-- Từ khóa: SET
-- VD: Tạo biến session age có giá trị khởi tạo = 18
SET @age = 18;
SELECT @age;

-- VD: Tạo thủ tục lấy ra tên phòng ban theo id
DROP PROCEDURE IF EXISTS sp_1;
DELIMITER $$
CREATE PROCEDURE sp_1(
    IN in_department_id INT,
    OUT out_department_name VARCHAR(50)
)
BEGIN
    SELECT department_name INTO out_department_name
    FROM department
    WHERE department_id = in_department_id;
END $$
DELIMITER ;

SET @department_name = '';
SELECT @department_name;
CALL sp_1(1, @department_name);
SELECT @department_name;

-- GLOBAL VARIABLE: Biến toàn cục
-- Phạm vi: Toàn bộ mysql
-- Từ khóa: SET GLOBAL
-- VD: Thay đổi connect_timeout thành 3 giây
SET GLOBAL connect_timeout = 3;

SHOW VARIABLES;

-- TRIGGER
-- Thời điểm: BEFORE, AFTER
-- Sự kiện: INSERT, UPDATE, DELETE
-- Tham chiếu: NEW, OLD
-- VD: Tạo trigger xử lý joined_date bảng group_account
DELIMITER $$
CREATE TRIGGER trigger_01
BEFORE INSERT ON group_account
FOR EACH ROW
BEGIN
    IF NEW.joined_date > CURRENT_DATE THEN
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'Thời gian không hợp lệ';
    END IF;
END $$
DELIMITER ;

INSERT INTO group_account   (group_id, account_id, joined_date )
VALUES                      (1       , 8         , "2099-03-05");

-- Xóa trigger
DROP TRIGGER trigger_01;
