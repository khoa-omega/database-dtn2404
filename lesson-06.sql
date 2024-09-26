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

-- FUNCION: Hàm
-- Trả về duy nhất 1 giá trị
SET GLOBAL log_bin_trust_function_creators = 1;
-- VD: Tạo function trả về tên phòng ban từ id
DELIMITER $$
CREATE FUNCTION fn_01 (in_department_id INT) RETURNS VARCHAR(50)
BEGIN
    DECLARE v_department_name VARCHAR(50);
    
    SELECT department_name INTO v_department_name
    FROM department
    WHERE department_id = in_department_id;
    
    RETURN v_department_name;
END $$
DELIMITER ;

-- Sử dụng function
SELECT *
FROM department
WHERE department_id = fn_01(1);

-- Xóa function
DROP FUNCTION fn_01;





