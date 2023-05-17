CREATE SCHEMA `flower_store` ;

USE `flower_store`;

CREATE TABLE `suply` (
  `SN` INT AUTO_INCREMENT PRIMARY KEY,
  `suply_name` varchar(16) NOT NULL
);

CREATE TABLE `suply_info` (
  `suply_id` varchar(10) PRIMARY KEY,
  `suply_tel` varchar(10) NOT NULL,
  `suply_email` varchar(255),
  `manager_name` varchar(255) NOT NULL,
  `suply_SN` INT,
  FOREIGN KEY (`suply_SN`) REFERENCES `suply`(`SN`)
);

CREATE TABLE `depot` (
  `SN` INT AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(10) NOT NULL
);

CREATE TABLE `plant` (
  `plant_SN` INT AUTO_INCREMENT PRIMARY KEY,
  `plant_id` CHAR(13) UNIQUE NOT NULL,
  `plant_name` varchar(16) NOT NULL,
  `count` INT(8) NOT NULL,
  `unit` CHAR(1) NOT NULL,
  `unit_price` DECIMAL(8, 2) NOT NULL,
  `total` DECIMAL(8, 2) NOT NULL,
  `purchase_date` DATE NOT NULL,
  `depot_SN` INT,
  `suply_SN` INT,
  FOREIGN KEY (`depot_SN`) REFERENCES `depot`(`SN`),
  FOREIGN KEY (`suply_SN`) REFERENCES `suply`(`SN`)
);

CREATE TABLE `customer` (
  `customer_id` CHAR(10) PRIMARY KEY,
  `customer_name` varchar(255) NOT NULL,
  `birthday` DATE,
  `customer_tel` varchar(10) NOT NULL,
  `customer_email` varchar(255),
  `age` INT(3),
  `discount` DECIMAL(3, 2) NOT NULL
);

CREATE TABLE `order` (
  `plant_SN` INT,
  `customer_id` CHAR(10),
  `customer_name` varchar(255),
  `buy_count` INT(8),
  `order_total` DECIMAL(8, 2),
  `order_date` DATE,
  `predict_date` DATE,
  `real_date` DATE,
  PRIMARY KEY (`plant_SN`, `customer_id`),
  FOREIGN KEY (`plant_SN`) REFERENCES `plant`(`plant_SN`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`)
);