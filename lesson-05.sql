-- Subquery: Truy vấn con
-- VD: Lấy ra tất cả developer
SELECT *
FROM account
WHERE position_id =
    (SELECT position_id
    FROM position
    WHERE position_name = "Dev");

-- Toán tử: ALL, ANY, EXISTS
-- VD: Lấy ra nhân viên có chức vụ khác developer
SELECT *
FROM account
WHERE position_id = ANY
    (SELECT position_id
    FROM position
    WHERE position_name != "Dev");

-- VIEW: Bảng ảo
-- VD: Tạo view chứa tất cả phòng ban
CREATE OR REPLACE VIEW view_01 AS
SELECT *
FROM department;
-- Truy vấn dữ liệu từ view
SELECT *
FROM view_01;
-- Xóa view
DROP VIEW view_01;



