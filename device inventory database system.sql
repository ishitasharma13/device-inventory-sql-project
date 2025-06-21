CREATE DATABASE DeviceInventoryDB;
USE DeviceInventoryDB;
CREATE TABLE Devices (
    device_id INT PRIMARY KEY AUTO_INCREMENT,
    device_name VARCHAR(100),
    device_type VARCHAR(50),
    purchase_date DATE
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE DeviceIssues (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    device_id INT,
    user_id INT,
    issue_date DATE,
    return_date DATE,
    is_returned BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (device_id) REFERENCES Devices(device_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Devices (device_name, device_type, purchase_date) VALUES
('Dell Laptop', 'Laptop', '2024-01-15'),
('HP Printer', 'Printer', '2023-09-10');

INSERT INTO Users (user_name, department) VALUES
('Ankit Verma', 'IT'),
('Riya Singh', 'HR');

INSERT INTO DeviceIssues (device_id, user_id, issue_date, return_date, is_returned) VALUES
(1, 1, '2025-06-01', NULL, FALSE),
(2, 2, '2025-06-05', '2025-06-15', TRUE);
SELECT Devices.device_name, Users.user_name, DeviceIssues.issue_date
FROM DeviceIssues
JOIN Devices ON DeviceIssues.device_id = Devices.device_id
JOIN Users ON DeviceIssues.user_id = Users.user_id;
SELECT Devices.device_name, Users.user_name
FROM DeviceIssues
JOIN Devices ON DeviceIssues.device_id = Devices.device_id
JOIN Users ON DeviceIssues.user_id = Users.user_id
WHERE DeviceIssues.is_returned = FALSE;
SELECT Users.department, COUNT(*) AS total_issued
FROM DeviceIssues
JOIN Users ON DeviceIssues.user_id = Users.user_id
GROUP BY Users.department;
