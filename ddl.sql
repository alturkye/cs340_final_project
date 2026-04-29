SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Trainers;
DROP TABLE IF EXISTS Equipment_Records;

CREATE TABLE Members(
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    membership_start_date DATE NOT NULL
    trainer_id INT NULL,
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id) ON DELETE SET NULL
);

CREATE TABLE Trainers(
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NULL,
    hourly_rate DECIMAL(19,2) NOT NULL
);

CREATE TABLE Classes(
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    max_capacity INT NOT NULL,
    trainer_id INT NOT NULL,
    room_location VARCHAR(50) NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id) ON DELETE CASCADE
);

CREATE TABLE Equipment_Records(
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    maintenance_status VARCHAR(50) NOT NULL,
    purchase_date DATE NULL,
    location VARCHAR(50) NOT NULL
);