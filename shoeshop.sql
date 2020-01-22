-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 17, 2020 at 06:27 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoeshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` char(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`) VALUES
('ADM001', 'Madushan Sandaruwan');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Adidas'),
(2, 'Nike'),
(3, 'Odel'),
(4, 'DSI');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` char(5) NOT NULL,
  `c_id` char(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p_id` (`p_id`),
  KEY `c_id` (`c_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` char(1) NOT NULL,
  `type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `type`) VALUES
('K', 'Kids'),
('M', 'Men'),
('W', 'Women');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` char(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `phone`) VALUES
('CUS001', 'Dulmini Sandunika', 'duluweeraddana143@gmail.com', '0717191967'),
('CUS002', 'Kelum Nagodawithana', 'kelumnagodavithana97@gmail.com', '0778523941'),
('dul', 'dulu', 'vvteh@143', '0773243373');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` char(7) NOT NULL,
  `c_id` char(6) NOT NULL,
  `date` date NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` char(5) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `category_id` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `brand_id`, `image`, `price`, `category_id`) VALUES
('M0001', 'RUNNING TYLO SHOES', 'Iconic look and superior performance makes it ideal for everyday runner Textile and Mesh upper for lightweight and breathability. Lightstrike IMEVA midsole with the rubber outsole provides best durability.', 1, '../image/product/M0001.jpg', 15411.6, 'M'),
('W0001', 'Nike Air Max 270', 'The bold silhouette of Nike Air lifts the Nike Air Max 270 React to new heights, while the Nike React foam midsole delivers exceptional cushioning. Imagine all-day comfort with unstoppable style.', 2, '../image/product/W0001.jpg', 7628.6, 'W'),
('K0001', 'T8036 Blck 31 - Odel', 'The Nike Air VaporMax 2019 is covered in a translucent layer that shows you the inner layers of the shoe. VaporMax Air cushioning is also translucent to let you see the air you\'re standing on.', 3, '../image/product/K0001.jpg', 5360, 'K'),
('W0002', 'Running shoes', 'Get it for 2016 Fashion Nike women running shoes Nike Elite Crew Basketball Sock - Dicks Sporting Goods', 1, '../image/product/W0002.jpg', 2600, 'W'),
('K002', 'DAME 6 SHOES', 'Fight for every possession with Damian Lillard style. These juniors\' adidas basketball shoes celebrate Dame\'s quiet leadership and bold charisma on and off the floor. Ultralight cushioning lets you create space in comfort. Start and stop on a dime.', 1, '../image/product/K0002.jpg', 3500, 'K'),
('M0002', 'Nike Air Vortex Mens', '', 2, '../image/product/M0002.jpg', 5000, 'M'),
('K0003', 'Nike sandals slippers', '', 2, '../image/product/K0003.jpg', 1200, 'K'),
('W0003', 'High Wedges', 'Tara High Wedge Crochet Shoes', 3, '../image/product/W0003.jpg', 3500, 'W'),
('M0003', 'Unisex\'s Crocband Clogs', '', 2, '../image/product/M0003.jpeg', 5450, 'M'),
('K0004', 'KIDS FLIP FLOPS', 'UPPER :RUBBER\r\nSOLE :EVA', 4, '../image/product/K0004.jpg', 950, 'K'),
('M0004', 'Samsons Men’s Sandal', 'SKU: AA041106\r\nCategories: Men, Sandals\r\nBrand: Samsons', 4, '../image/product/M0004.jpg', 949, 'M'),
('W0004', 'Bata Comfit Ladies ', 'Disclaimer: There may be a slight color variation in the image from original product.', 4, '../image/product/W0004.jpg', 1500, 'W');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `username` char(6) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(8) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `role`) VALUES
('ADM001', '202cb962ac59075b964b07152d234b70', 'admin'),
('CUS001', '202cb962ac59075b964b07152d234b70', 'customer'),
('CUS002', '202cb962ac59075b964b07152d234b70', 'customer'),
('dul', '202cb962ac59075b964b07152d234b70', 'customer');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
