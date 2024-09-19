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

-- CTE (Common Table Expression): Bảng tạm
-- VD: Lấy ra phòng ban có nhiều nhân viên nhất
WITH c1 AS (
    SELECT department.*, COUNT(account_id) AS account_count
    FROM department
    LEFT JOIN account USING (department_id)
    GROUP BY department_id
)
SELECT *
FROM c1
WHERE account_count =
    (SELECT MAX(account_count)
    FROM c1);

-- VD: Lấy ra question có nhiều câu trả lời nhất
WITH c1 AS (
    SELECT question.*, COUNT(answer_id) AS answer_count
    FROM question
    LEFT JOIN answer USING (question_id)
    GROUP BY question_id
)
SELECT *
FROM c1
WHERE answer_count =
    (SELECT MAX(answer_count)
    FROM c1);

-- VD: Tìm chức vụ có ít người nhất
WITH c1 AS (
    SELECT position.*, COUNT(account_id) AS account_count
    FROM position
    LEFT JOIN account USING (position_id)
    GROUP BY position_id
)
SELECT *
FROM c1
WHERE account_count =
    (SELECT MIN(account_count)
    FROM c1);

-- VD: Thống kê số lượng nhân viên theo từng tháng
WITH RECURSIVE c1 (month) AS (
    SELECT 1
    UNION
    SELECT month + 1 FROM c1 WHERE month < 12
), c2 AS (
    SELECT account_id, MONTH(created_date) AS month
    FROM account
)
SELECT month, COUNT(account_id)
FROM c1
LEFT JOIN c2 USING (month)
GROUP BY month;
