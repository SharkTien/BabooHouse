-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2025 at 02:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Database: `baboohouse`
--
-- --------------------------------------------------------
--
-- Table structure for table `bookings`
--
CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_name` varchar(255) DEFAULT NULL,
  `identification_card` varchar(50) DEFAULT NULL,
  `rental_price` decimal(10,2) DEFAULT NULL,
  `lease_term` varchar(255) DEFAULT NULL,
  `payment_term` varchar(255) DEFAULT NULL,
  `lease_start_date` date DEFAULT NULL,
  `lease_end_date` date DEFAULT NULL,
  `photo_urls` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Table structure for table `buildings`
--
CREATE TABLE `buildings` (
  `building_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `rental_price` decimal(10,2) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_phone` varchar(50) DEFAULT NULL,
  `building_type` varchar(50) DEFAULT NULL,
  `electricity_price` decimal(10,2) DEFAULT NULL,
  `water_price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `photo_urls` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Table structure for table `management_income`
--
CREATE TABLE `management_income` (
  `management_income_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `received_commission` decimal(10,2) DEFAULT NULL,
  `actual_income` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Table structure for table `rooms`
--
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `building_id` int(11) DEFAULT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  `rental_price` decimal(10,2) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `room_status` varchar(50) DEFAULT NULL,
  `photo_urls` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Table structure for table `sale_income`
--
CREATE TABLE `sale_income` (
  `sale_income_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `received_commission` decimal(10,2) DEFAULT NULL,
  `actual_income` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `hometown` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `photo_urls` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Indexes for dumped tables
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `building_id` (`building_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `buildings`
  ADD PRIMARY KEY (`building_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `management_income`
  ADD PRIMARY KEY (`management_income_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `booking_id` (`booking_id`);

ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `building_id` (`building_id`);

ALTER TABLE `sale_income`
  ADD PRIMARY KEY (`sale_income_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `booking_id` (`booking_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

-- --------------------------------------------------------
-- AUTO_INCREMENT for dumped tables
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `buildings`
  MODIFY `building_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `management_income`
  MODIFY `management_income_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sale_income`
  MODIFY `sale_income_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- --------------------------------------------------------
-- Constraints for dumped tables
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`building_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

ALTER TABLE `buildings`
  ADD CONSTRAINT `buildings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

ALTER TABLE `management_income`
  ADD CONSTRAINT `management_income_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `management_income_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;

ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`building_id`) ON DELETE CASCADE;

ALTER TABLE `sale_income`
  ADD CONSTRAINT `sale_income_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_income_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;

COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Sample data for `users`
INSERT INTO `users` (`user_id`, `name`, `address`, `hometown`, `birthdate`, `phone`, `email`, `username`, `password`, `role`, `last_access`, `photo_urls`) VALUES
(1, 'Admin User', NULL, NULL, NULL, NULL, 'admin@example.com', 'admin', '123456', 'admin', NOW(), NULL),
(2, 'John Doe', '123 Elm St', 'Springfield', '1990-05-15', '555-0123', 'john@example.com', 'john', 'password123', 'user', NOW(), NULL),
(3, 'Jane Smith', '456 Oak St', 'Springfield', '1988-03-22', '555-0456', 'jane@example.com', 'jane', 'password456', 'user', NOW(), NULL),
(4, 'Emily Johnson', '789 Maple St', 'Springfield', '1985-07-30', '555-0789', 'emily@example.com', 'emily', 'password789', 'user', NOW(), NULL),
(5, 'Michael Brown', '321 Pine St', 'Springfield', '1992-01-14', '555-1234', 'michael@example.com', 'michael', 'password101', 'user', NOW(), NULL),
(6, 'Sarah Davis', '654 Cedar St', 'Springfield', '1995-03-25', '555-5678', 'sarah@example.com', 'sarah', 'password202', 'user', NOW(), NULL),
(7, 'David Wilson', '987 Birch St', 'Springfield', '1987-11-05', '555-8765', 'david@example.com', 'david', 'password303', 'user', NOW(), NULL),
(8, 'Laura Garcia', '159 Walnut St', 'Springfield', '1993-09-17', '555-3456', 'laura@example.com', 'laura', 'password404', 'user', NOW(), NULL),
(9, 'Daniel Martinez', '753 Spruce St', 'Springfield', '1991-04-21', '555-6543', 'daniel@example.com', 'daniel', 'password505', 'user', NOW(), NULL),
(10, 'Sophia Rodriguez', '852 Fir St', 'Springfield', '1989-12-12', '555-2345', 'sophia@example.com', 'sophia', 'password606', 'user', NOW(), NULL),
(11, 'James Lewis', '246 Willow St', 'Springfield', '1994-06-18', '555-9876', 'james@example.com', 'james', 'password707', 'user', NOW(), NULL);

-- Sample data for `buildings`
INSERT INTO `buildings` (`building_id`, `user_id`, `name`, `address`, `rental_price`, `owner_name`, `owner_phone`, `building_type`, `electricity_price`, `water_price`, `description`, `last_modified`, `photo_urls`) VALUES
(1, 2, 'Sunset Apartments', '789 Pine St', 1200.00, 'Alice Johnson', '555-0789', 'Apartment', 0.15, 0.05, 'A cozy apartment complex.', NOW(), NULL),
(2, 3, 'Maple Residences', '321 Maple St', 1500.00, 'Bob Brown', '555-1234', 'Condo', 0.20, 0.07, 'Luxury condos in a great location.', NOW(), NULL),
(3, 4, 'Lakeview Towers', '456 Lake St', 1800.00, 'Charlie White', '555-3456', 'Apartment', 0.18, 0.06, 'Towering views of the lake.', NOW(), NULL),
(4, 5, 'Greenfield Homes', '321 Green St', 900.00, 'Diana Black', '555-6543', 'House', 0.12, 0.04, 'Spacious homes with gardens.', NOW(), NULL),
(5, 6, 'Oakwood Villas', '654 Oak St', 2000.00, 'Ethan Harris', '555-9876', 'Villa', 0.25, 0.08, 'Exclusive villas with amenities.', NOW(), NULL),
(6, 7, 'Rose Garden Apartments', '159 Rose St', 1100.00, 'Fiona Clark', '555-6789', 'Apartment', 0.14, 0.05, 'Beautiful gardens and relaxation.', NOW(), NULL),
(7, 8, 'Cedar Heights', '753 Cedar St', 1600.00, 'George King', '555-5432', 'Condo', 0.22, 0.07, 'Heights living at its best.', NOW(), NULL),
(8, 9, 'Birchwood Estate', '852 Birch St', 2200.00, 'Hannah Wright', '555-4321', 'Estate', 0.30, 0.09, 'Luxurious estate with large grounds.', NOW(), NULL),
(9, 10, 'Palm Oasis', '963 Palm St', 1400.00, 'Ian Scott', '555-3210', 'Apartment', 0.16, 0.06, 'Tropical living in the city.', NOW(), NULL),
(10, 11, 'Willow Creek Apartments', '741 Willow St', 1300.00, 'Judy Young', '555-2109', 'Apartment', 0.15, 0.05, 'Comfortable apartments with a creek view.', NOW(), NULL);

-- Sample data for `rooms`
INSERT INTO `rooms` (`room_id`, `building_id`, `room_name`, `area`, `rental_price`, `room_type`, `room_status`, `photo_urls`) VALUES
(1, 1, 'Room 101', 500.00, 600.00, 'Single', 'Available', NULL),
(2, 1, 'Room 102', 750.00, 800.00, 'Double', 'Occupied', NULL),
(3, 2, 'Room 201', 600.00, 700.00, 'Suite', 'Available', NULL),
(4, 2, 'Room 202', 800.00, 900.00, 'Double', 'Occupied', NULL),
(5, 3, 'Room 301', 700.00, 750.00, 'Single', 'Available', NULL),
(6, 3, 'Room 302', 900.00, 950.00, 'Suite', 'Available', NULL),
(7, 4, 'Room 401', 650.00, 650.00, 'Single', 'Occupied', NULL),
(8, 4, 'Room 402', 850.00, 800.00, 'Double', 'Available', NULL),
(9, 5, 'Room 501', 750.00, 850.00, 'Double', 'Occupied', NULL),
(10, 5, 'Room 502', 900.00, 950.00, 'Suite', 'Available', NULL);

-- Sample data for `bookings`
INSERT INTO `bookings` (`booking_id`, `room_id`, `building_id`, `user_id`, `guest_name`, `identification_card`, `rental_price`, `lease_term`, `payment_term`, `lease_start_date`, `lease_end_date`, `photo_urls`) VALUES
(1, 1, 1, 2, 'Alice Smith', 'ID123456789', 600.00, '1 Month', 'Monthly', '2025-01-01', '2025-01-31', NULL),
(2, 2, 1, 3, 'Bob Johnson', 'ID987654321', 800.00, '6 Months', 'Monthly', '2025-01-05', '2025-07-05', NULL),
(3, 3, 2, 4, 'Charlie Brown', 'ID135792468', 700.00, '1 Month', 'Monthly', '2025-01-10', '2025-01-31', NULL),
(4, 4, 2, 5, 'Diana Prince', 'ID246813579', 900.00, '2 Months', 'Monthly', '2025-01-15', '2025-03-15', NULL),
(5, 5, 3, 6, 'Emily Davis', 'ID111222333', 750.00, '3 Months', 'Monthly', '2025-01-20', '2025-04-20', NULL),
(6, 6, 3, 7, 'Frank Miller', 'ID444555666', 950.00, '1 Month', 'Monthly', '2025-01-25', '2025-01-31', NULL),
(7, 7, 4, 8, 'Grace Lee', 'ID777888999', 650.00, '1 Month', 'Weekly', '2025-01-30', '2025-02-28', NULL),
(8, 8, 4, 9, 'Henry Kim', 'ID101112131', 800.00, '3 Months', 'Monthly', '2025-02-01', '2025-05-01', NULL),
(9, 9, 5, 10, 'Isabella Wang', 'ID141516171', 850.00, '2 Months', 'Monthly', '2025-02-05', '2025-04-05', NULL),
(10, 10, 5, 11, 'Jack Thompson', 'ID181920202', 950.00, '1 Month', 'Weekly', '2025-02-10', '2025-02-17', NULL);

-- Sample data for `management_income`
INSERT INTO `management_income` (`management_income_id`, `user_id`, `booking_id`, `commission`, `received_commission`, `actual_income`, `amount`) VALUES
(1, 2, 1, 60.00, 60.00, 540.00, 600.00),
(2, 3, 2, 80.00, 80.00, 720.00, 800.00),
(3, 4, 3, 70.00, 70.00, 630.00, 700.00),
(4, 5, 4, 90.00, 90.00, 810.00, 900.00),
(5, 6, 5, 75.00, 75.00, 675.00, 750.00),
(6, 7, 6, 95.00, 95.00, 855.00, 950.00),
(7, 8, 7, 65.00, 65.00, 585.00, 650.00),
(8, 9, 8, 85.00, 85.00, 765.00, 850.00),
(9, 10, 9, 90.00, 90.00, 810.00, 900.00),
(10, 11, 10, 100.00, 100.00, 850.00, 950.00);

-- Sample data for `sale_income`
INSERT INTO `sale_income` (`sale_income_id`, `user_id`, `booking_id`, `commission`, `received_commission`, `actual_income`, `amount`) VALUES
(1, 2, 1, 30.00, 30.00, 570.00, 600.00),
(2, 3, 2, 40.00, 40.00, 760.00, 800.00),
(3, 4, 3, 35.00, 35.00, 665.00, 700.00),
(4, 5, 4, 45.00, 45.00, 855.00, 900.00),
(5, 6, 5, 37.50, 37.50, 712.50, 750.00),
(6, 7, 6, 47.50, 47.50, 902.50, 950.00),
(7, 8, 7, 32.50, 32.50, 552.50, 650.00),
(8, 9, 8, 42.50, 42.50, 807.50, 850.00),
(9, 10, 9, 45.00, 45.00, 855.00, 900.00),
(10, 11, 10, 50.00, 50.00, 900.00, 950.00);