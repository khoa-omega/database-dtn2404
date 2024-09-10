-- Xóa database nếu tồn tại
DROP DATABASE IF EXISTS lesson_01;

-- Tạo database
CREATE DATABASE lesson_01;

-- Chọn database
USE lesson_01;

-- Kiểu dữ liệu
-- Kiểu số nguyên: TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
-- Kiểu số thực: FLOAT, DOUBLE
-- Kiểu chuỗi: CHAR, VARCHAR
-- Kiểu logic: BOOLEAN
-- Kiểu thời gian: DATE, TIME, DATETIME
-- Kiểu enum: ENUM('Male', 'Female', 'Unknown')

-- Xóa bảng nếu tồn tại
DROP TABLE IF EXISTS department;

-- Tạo bảng
CREATE TABLE department(
    id BIGINT UNSIGNED,
    name VARCHAR(50),
    created_at DATETIME
);

-- Thêm dữ liệu
INSERT INTO department(id, name      , created_at           )
VALUES                (1 , 'Giám đốc', CURRENT_TIMESTAMP    ),
                      (2 , 'Bảo vệ'  , '2023-04-30 10:22:49');

-- Hiển thị dữ liệu
TABLE department;

-- Ràng buộc dữ liệu
-- PRIMARY KEY: Khóa chính
-- 1. Một bảng có tối đa 1 khóa chính
-- 2. Giá trị phải duy nhất và khác NULL
-- Từ khóa: AUTO_INCREMENT
-- VD: Khóa chính 1 cột
CREATE TABLE customer(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
INSERT INTO customer(name             )
VALUES              ('Nguyễn Văn Khoa'),
                    ('Vũ Đức Long'    );
-- VD: Khóa chính 2 cột
CREATE TABLE group_account(
    group_id INT,
    account_id INT,
    joined_at DATETIME,
    PRIMARY KEY (group_id, account_id)
);

-- UNIQUE KEY: Duy nhất
CREATE TABLE account(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) UNIQUE
);
INSERT INTO account(email              )
VALUES             ('khoa.nv@gmail.com'),
                   ('khoa.nv@gmail.com');

-- NOT NULL
CREATE TABLE product(
    id INT PRIMARY KEY AUTO_INCREMENT,
    price BIGINT NOT NULL
);
INSERT INTO product(price)
VALUES             (NULL );

-- DEFAULT: Giá trị mặc định
CREATE TABLE post(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT NOW()
);
INSERT INTO post(title  )
VALUES          ('MySQL');

-- CHECK: Kiểm tra
CREATE TABLE user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    age INT CHECK (age >= 18) NOT NULL
);
INSERT INTO user(age)
VALUES          (16 );

-- FOREIGN KEY: Khóa ngoại
CREATE TABLE student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    FOREIGN KEY (post_id) REFERENCES post(id)
);
INSERT INTO student(post_id)
VALUES             (3      );
