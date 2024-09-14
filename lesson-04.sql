-- Mệnh đề JOIN

-- INNER JOIN
-- ON: Điều kiện kết hợp
-- VD: Lấy ra tất cả thông tin nhân viên
SELECT *
FROM account
INNER JOIN department USING(department_id)
INNER JOIN position USING(position_id);

-- LEFT / RIGHT JOIN
-- VD: Thống kê số lượng nhân viên trong mỗi phòng ban
SELECT department.*, COUNT(account_id)
FROM account
RIGHT JOIN department USING (department_id)
GROUP BY department_id;

-- LEFT / RIGHT EXCLUDING JOIN
-- VD: Lấy ra phòng ban không có nhân viên
SELECT department.*
FROM department
LEFT JOIN account USING (department_id)
WHERE account_id IS NULL;

-- CROSS JOIN
SELECT full_name, position_name
FROM account
CROSS JOIN position;








