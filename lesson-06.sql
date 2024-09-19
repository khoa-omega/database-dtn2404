-- STORED PROCEDURE: Thủ tục lưu trữ
-- Từ khóa: IN, OUT, INOUT
-- VD: Tạo thủ tục lấy ra phòng ban theo id
DELIMITER $$
CREATE PROCEDURE sp_01(IN in_department_id INT)
BEGIN
    SELECT *
    FROM department
    WHERE department_id = in_department_id;
END $$
DELIMITER ;

-- Gọi thủ tục
CALL sp_01(5);

-- Xóa thủ tục
DROP PROCEDURE sp_01;











