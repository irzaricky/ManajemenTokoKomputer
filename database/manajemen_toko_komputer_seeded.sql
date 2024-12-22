-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 22, 2024 at 02:31 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manajemen_toko_komputer`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` text,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `price`, `stock`, `category_id`, `type_id`) VALUES
(1, 'Laptop Acer Aspire 5', 'Laptop Acer Aspire 5 dengan spesifikasi tinggi', 7500000.00, 10, 1, 2),
(2, 'Laptop Lenovo IdeaPad', 'Laptop Lenovo IdeaPad dengan performa bagus', 6500000.00, 15, 1, 2),
(3, 'Desktop HP Pavilion', 'Desktop HP Pavilion dengan spesifikasi menengah', 5500000.00, 20, 2, 2),
(4, 'Monitor Samsung 24 inch', 'Monitor Samsung 24 inch dengan resolusi full HD', 2500000.00, 30, 3, 3),
(5, 'Printer Epson L3150', 'Printer Epson L3150 dengan kualitas cetakan bagus', 1500000.00, 25, 4, 3),
(6, 'Mouse Logitech M185', 'Mouse Logitech M185 dengan desain ergonomis', 200000.00, 50, 5, 4),
(7, 'Keyboard Logitech K120', 'Keyboard Logitech K120 dengan desain sederhana', 300000.00, 40, 5, 4),
(8, 'Laptop Asus Vivobook', 'Laptop Asus Vivobook dengan desain tipis', 8000000.00, 12, 1, 1),
(9, 'Desktop Dell Inspiron', 'Desktop Dell Inspiron dengan performa tinggi', 6000000.00, 18, 2, 2),
(10, 'Monitor LG 27 inch', 'Monitor LG 27 inch dengan resolusi 4K', 3500000.00, 22, 3, 3),
(11, 'Printer Canon Pixma', 'Printer Canon Pixma dengan kualitas cetakan tinggi', 2000000.00, 28, 4, 3),
(12, 'Headphone Sony WH-1000XM4', 'Headphone Sony WH-1000XM4 dengan noise canceling', 3500000.00, 35, 5, 4),
(13, 'Laptop HP Pavilion', 'Laptop HP Pavilion dengan spesifikasi menengah', 7000000.00, 14, 1, 2),
(14, 'Desktop Acer Aspire', 'Desktop Acer Aspire dengan performa bagus', 5000000.00, 21, 2, 2),
(15, 'Monitor AOC 22 inch', 'Monitor AOC 22 inch dengan resolusi full HD', 1500000.00, 26, 3, 3),
(16, 'Printer Brother DCP-T510W', 'Printer Brother DCP-T510W dengan kualitas cetakan bagus', 1200000.00, 29, 4, 3),
(17, 'Mouse Razer DeathAdder', 'Mouse Razer DeathAdder dengan desain gaming', 400000.00, 45, 5, 1),
(18, 'Keyboard Razer BlackWidow', 'Keyboard Razer BlackWidow dengan desain gaming', 700000.00, 38, 5, 1),
(19, 'Laptop Dell XPS 13', 'Laptop Dell XPS 13 dengan desain tipis', 9000000.00, 11, 1, 1),
(20, 'Desktop Lenovo ThinkCentre', 'Desktop Lenovo ThinkCentre dengan performa tinggi', 6500000.00, 17, 2, 2),
(21, 'Monitor BenQ 24 inch', 'Monitor BenQ 24 inch dengan resolusi full HD', 2200000.00, 23, 3, 3),
(22, 'Printer HP LaserJet', 'Printer HP LaserJet dengan kualitas cetakan tinggi', 1800000.00, 27, 4, 3),
(23, 'Headphone Bose QuietComfort', 'Headphone Bose QuietComfort dengan noise canceling', 4000000.00, 32, 5, 4),
(24, 'Laptop MacBook Air', 'Laptop MacBook Air dengan desain tipis', 9500000.00, 10, 1, 1),
(25, 'Desktop Apple iMac', 'Desktop Apple iMac dengan performa tinggi', 7500000.00, 16, 2, 2),
(26, 'Monitor Dell 27 inch', 'Monitor Dell 27 inch dengan resolusi 4K', 3200000.00, 21, 3, 3),
(27, 'Printer Epson EcoTank', 'Printer Epson EcoTank dengan kualitas cetakan bagus', 1600000.00, 24, 4, 3),
(28, 'Mouse Microsoft Surface', 'Mouse Microsoft Surface dengan desain ergonomis', 300000.00, 42, 5, 4),
(29, 'Keyboard Microsoft Surface', 'Keyboard Microsoft Surface dengan desain sederhana', 600000.00, 36, 5, 4),
(30, 'Laptop Asus ROG Strix', 'Laptop Asus ROG Strix dengan spesifikasi gaming', 8500000.00, 13, 1, 1),
(31, 'Desktop MSI Trident', 'Desktop MSI Trident dengan performa gaming', 6200000.00, 19, 2, 1),
(32, 'Monitor Acer Predator', 'Monitor Acer Predator dengan resolusi 4K', 3800000.00, 20, 3, 1),
(33, 'Printer Brother MFC-J995DW', 'Printer Brother MFC-J995DW dengan kualitas cetakan tinggi', 1900000.00, 25, 4, 3),
(34, 'Headphone JBL Quantum', 'Headphone JBL Quantum dengan suara surround', 3300000.00, 31, 5, 4),
(35, 'Laptop Lenovo Legion', 'Laptop Lenovo Legion dengan spesifikasi gaming', 8200000.00, 15, 1, 1),
(36, 'Desktop HP Omen', 'Desktop HP Omen dengan performa gaming', 6100000.00, 18, 2, 1),
(37, 'Monitor Samsung Odyssey', 'Monitor Samsung Odyssey dengan resolusi 4K', 3600000.00, 22, 3, 1),
(38, 'Printer Canon Pixma G6020', 'Printer Canon Pixma G6020 dengan kualitas cetakan bagus', 1700000.00, 26, 4, 3),
(39, 'Mouse Logitech G502', 'Mouse Logitech G502 dengan desain gaming', 450000.00, 43, 5, 1),
(40, 'Keyboard Corsair K70', 'Keyboard Corsair K70 dengan desain gaming', 750000.00, 37, 5, 1),
(41, 'Laptop MSI GL65', 'Laptop MSI GL65 dengan spesifikasi gaming', 8800000.00, 12, 1, 1),
(42, 'Desktop Acer Predator', 'Desktop Acer Predator dengan performa gaming', 6300000.00, 17, 2, 1),
(43, 'Monitor LG UltraGear', 'Monitor LG UltraGear dengan resolusi 4K', 3700000.00, 23, 3, 1),
(44, 'Printer Epson WorkForce', 'Printer Epson WorkForce dengan kualitas cetakan tinggi', 1800000.00, 28, 4, 3),
(45, 'Headphone SteelSeries Arctis', 'Headphone SteelSeries Arctis dengan suara surround', 3400000.00, 33, 5, 4),
(46, 'Laptop Razer Blade', 'Laptop Razer Blade dengan spesifikasi gaming', 9200000.00, 11, 1, 1),
(47, 'Desktop Alienware Aurora', 'Desktop Alienware Aurora dengan performa gaming', 6400000.00, 16, 2, 1),
(48, 'Monitor Asus ROG Swift', 'Monitor Asus ROG Swift dengan resolusi 4K', 3900000.00, 21, 3, 1),
(49, 'Printer HP OfficeJet', 'Printer HP OfficeJet dengan kualitas cetakan bagus', 1600000.00, 24, 4, 3),
(50, 'Mouse Razer Naga', 'Mouse Razer Naga dengan desain gaming', 420000.00, 41, 5, 1),
(51, 'Keyboard Logitech G910', 'Keyboard Logitech G910 dengan desain gaming', 720000.00, 35, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Laptop', 'Kategori untuk laptop'),
(2, 'Desktop', 'Kategori untuk desktop'),
(3, 'Monitor', 'Kategori untuk monitor'),
(4, 'Printer', 'Kategori untuk printer'),
(5, 'Accessories', 'Kategori untuk aksesoris');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `type_id` int NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`type_id`, `type_name`, `description`) VALUES
(1, 'Gaming', 'Tipe produk untuk gaming'),
(2, 'Office', 'Tipe produk untuk kantor'),
(3, 'Home', 'Tipe produk untuk rumah'),
(4, 'Portable', 'Tipe produk yang portable'),
(5, 'High-End', 'Tipe produk high-end');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int NOT NULL,
  `sale_date` datetime NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `sale_date`, `total_amount`, `user_id`) VALUES
(1, '2024-12-22 14:00:00', 15000000.00, 1),
(2, '2024-12-22 14:10:00', 12000000.00, 1),
(3, '2024-12-22 14:20:00', 18000000.00, 1),
(4, '2024-12-22 14:30:00', 16000000.00, 1),
(5, '2024-12-22 14:40:00', 14000000.00, 1),
(6, '2024-12-22 14:50:00', 17000000.00, 1),
(7, '2024-12-22 15:00:00', 13000000.00, 1),
(8, '2024-12-22 15:10:00', 19000000.00, 1),
(9, '2024-12-22 15:20:00', 11000000.00, 1),
(10, '2024-12-22 15:30:00', 15500000.00, 1),
(41, '2024-12-22 15:40:00', 16500000.00, 1),
(42, '2024-12-22 15:50:00', 13500000.00, 1),
(43, '2024-12-22 16:00:00', 17500000.00, 1),
(44, '2024-12-22 16:10:00', 14500000.00, 1),
(45, '2024-12-22 16:20:00', 18500000.00, 2),
(46, '2024-12-22 16:30:00', 12500000.00, 2),
(47, '2024-12-22 16:40:00', 19500000.00, 2),
(48, '2024-12-22 16:50:00', 15500000.00, 2),
(49, '2024-12-22 17:00:00', 11500000.00, 2),
(50, '2024-12-22 17:10:00', 16000000.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `sale_detail_id` int NOT NULL,
  `sale_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`sale_detail_id`, `sale_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 1, 7500000.00),
(2, 1, 2, 1, 6500000.00),
(3, 1, 3, 1, 5500000.00),
(4, 1, 4, 1, 2500000.00),
(5, 2, 5, 1, 1500000.00),
(6, 2, 6, 2, 200000.00),
(7, 2, 7, 1, 300000.00),
(8, 2, 8, 1, 8000000.00),
(9, 3, 9, 1, 6000000.00),
(10, 3, 10, 1, 3500000.00),
(11, 3, 11, 1, 2000000.00),
(12, 3, 12, 1, 3500000.00),
(13, 4, 13, 1, 7000000.00),
(14, 4, 14, 1, 5000000.00),
(15, 4, 15, 1, 1500000.00),
(16, 4, 16, 1, 1200000.00),
(17, 5, 17, 1, 400000.00),
(18, 5, 18, 1, 700000.00),
(19, 5, 19, 1, 9000000.00),
(20, 5, 20, 1, 6500000.00),
(21, 6, 21, 1, 2200000.00),
(22, 6, 22, 1, 1800000.00),
(23, 6, 23, 1, 4000000.00),
(24, 6, 24, 1, 9500000.00),
(25, 7, 25, 1, 7500000.00),
(26, 7, 26, 1, 3200000.00),
(27, 7, 27, 1, 1600000.00),
(28, 7, 28, 1, 300000.00),
(29, 8, 29, 1, 600000.00),
(30, 8, 30, 1, 8500000.00),
(31, 8, 31, 1, 6200000.00),
(32, 8, 32, 1, 3800000.00),
(33, 9, 33, 1, 1900000.00),
(34, 9, 34, 1, 3300000.00),
(35, 9, 35, 1, 8200000.00),
(36, 9, 36, 1, 6100000.00),
(37, 10, 37, 1, 3600000.00),
(38, 10, 38, 1, 1700000.00),
(39, 10, 39, 1, 450000.00),
(40, 10, 40, 1, 750000.00),
(81, 11, 41, 1, 8800000.00),
(82, 11, 42, 1, 6300000.00),
(83, 11, 43, 1, 3700000.00),
(84, 11, 44, 1, 1800000.00),
(85, 12, 45, 1, 3400000.00),
(86, 12, 46, 1, 9200000.00),
(87, 12, 47, 1, 6400000.00),
(88, 12, 48, 1, 3900000.00),
(89, 13, 49, 1, 420000.00),
(90, 13, 50, 1, 720000.00),
(91, 13, 51, 1, 8500000.00),
(92, 13, 52, 1, 6200000.00),
(93, 14, 53, 1, 3800000.00),
(94, 14, 54, 1, 1900000.00),
(95, 14, 55, 1, 3300000.00),
(96, 14, 56, 1, 8200000.00),
(97, 15, 57, 1, 3600000.00),
(98, 15, 58, 1, 1700000.00),
(99, 15, 59, 1, 450000.00),
(100, 15, 60, 1, 750000.00),
(101, 16, 61, 1, 600000.00),
(102, 16, 62, 1, 8500000.00),
(103, 16, 63, 1, 6200000.00),
(104, 16, 64, 1, 3800000.00),
(105, 17, 65, 1, 1900000.00),
(106, 17, 66, 1, 3300000.00),
(107, 17, 67, 1, 8200000.00),
(108, 17, 68, 1, 6100000.00),
(109, 18, 69, 1, 3600000.00),
(110, 18, 70, 1, 1700000.00),
(111, 18, 71, 1, 450000.00),
(112, 18, 72, 1, 750000.00),
(113, 19, 73, 1, 600000.00),
(114, 19, 74, 1, 8500000.00),
(115, 19, 75, 1, 6200000.00),
(116, 19, 76, 1, 3800000.00),
(117, 20, 77, 1, 1900000.00),
(118, 20, 78, 1, 3300000.00),
(119, 20, 79, 1, 8200000.00),
(120, 20, 80, 1, 6100000.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'password123', 'admin'),
(2, 'user1', 'password123', 'admin'),
(3, 'user2', 'password123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `products_ibfk_2` (`type_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`sale_detail_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `sale_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `product_types` (`type_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`),
  ADD CONSTRAINT `sale_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
