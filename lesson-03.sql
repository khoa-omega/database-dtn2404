-- Mệnh đề SELECT
SELECT PI(), 1 + 1, CURRENT_DATE, NOW(), CURRENT_TIMESTAMP;

-- Mệnh đề FROM
-- *: Đại diện cho tất cả các cột
-- VD: Lấy ra tất cả phòng ban
SELECT *
FROM department;

-- Mệnh đề WHERE
-- Điều kiện cho từng bản ghi
-- Toán tử: >, >=, <, <=, =, !=
-- VD: Lấy ra phòng ban có id = 5
SELECT *
FROM department
WHERE department_id = 5;
-- Toán tử: AND, OR
-- VD: Lấy ra phòng ban có 3 <= id <= 7
SELECT *
FROM department
WHERE department_id >= 3 AND department_id <= 7;
-- Toán tử: BETWEEN ... AND ...
-- VD: Lấy ra phòng ban có 3 <= id <= 7
SELECT *
FROM department
WHERE department_id BETWEEN 3 AND 7;
-- Toán tử: IN
-- VD: Lấy ra phòng ban có id là số chẵn từ 2 đến 8
SELECT *
FROM department
WHERE department_id IN (2, 4, 6, 8);
-- Toán tử: LIKE
-- _: Đại diện cho 1 kí tự bất kỳ
-- %: Đại diện cho 0 hoặc nhiều kí tự bất kỳ
-- VD: Lấy ra phòng ban có tên chứa ký tự 'n'
SELECT *
FROM department
WHERE department_name LIKE '%n%';
-- Toán tử: IS NULL / IS NOT NULL
-- VD: Lấy ra phòng ban có tên
SELECT *
FROM department
WHERE department_name IS NOT NULL;

-- Mệnh đề ORDER BY
-- Hướng: ASC, DESC
-- Mặc định: ASC
-- VD: Lấy ra tất cả đề thi sắp xếp theo
-- thời gian thi giảm dần, ngày tạo giảm dần
SELECT *
FROM exam
ORDER BY duration DESC, created_date DESC;

-- Mệnh đề LIMIT
-- VD: Lấy ra 5 phòng ban
SELECT *
FROM department
LIMIT 5;

-- Các hàm tổng hợp: COUNT, SUM, MIN, MAX, AVG
-- COUNT(*): Đếm số dòng
-- COUNT(id): Đếm số dòng có id khác NULL
SELECT 
    COUNT(*),
    SUM(duration),
    MIN(duration),
    MAX(duration),
    AVG(duration)
FROM exam;

-- Mệnh đề GROUP BY
SELECT duration, COUNT(exam_id)
FROM exam
GROUP BY duration;

-- Mệnh đề HAVING
-- Điều kiện cho từng nhóm
SELECT duration, COUNT(exam_id)
FROM exam
GROUP BY duration
HAVING COUNT(exam_id) > 3;

-- ALIAS: Đặt bí danh tạm thời
SELECT COUNT(*) AS department_count
FROM department;







