-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2024 at 11:21 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

CREATE TABLE `tbl_color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_color`
--

INSERT INTO `tbl_color` (`color_id`, `color_name`) VALUES
(1, 'Red'),
(2, 'Black'),
(3, 'Blue'),
(4, 'Yellow'),
(5, 'Green'),
(6, 'White'),
(7, 'Orange'),
(8, 'Brown'),
(9, 'Tan'),
(10, 'Pink'),
(11, 'Mixed'),
(12, 'Lightblue'),
(13, 'Violet'),
(14, 'Light Purple'),
(15, 'Salmon'),
(16, 'Gold'),
(17, 'Gray'),
(18, 'Ash'),
(19, 'Maroon'),
(20, 'Silver'),
(21, 'Dark Clay'),
(22, 'Cognac'),
(23, 'Coffee'),
(24, 'Charcoal'),
(25, 'Navy'),
(26, 'Fuchsia'),
(27, 'Olive'),
(28, 'Burgundy'),
(29, 'Midnight Blue');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`country_id`, `country_name`) VALUES
(246, 'Nepal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `cust_id` int(11) NOT NULL,
  `cust_name` varchar(100) NOT NULL,
  `cust_email` varchar(100) NOT NULL,
  `cust_phone` varchar(50) NOT NULL,
  `cust_address` text NOT NULL,
  `cust_city` varchar(100) NOT NULL,
  `cust_state` varchar(100) NOT NULL,
  `cust_zip` varchar(30) NOT NULL,
  `cust_d_name` varchar(100) NOT NULL,
  `cust_d_phone` varchar(50) NOT NULL,
  `cust_d_address` text NOT NULL,
  `cust_d_city` varchar(100) NOT NULL,
  `cust_d_state` varchar(100) NOT NULL,
  `cust_d_zip` varchar(30) NOT NULL,
  `cust_password` varchar(100) NOT NULL,
  `cust_token` varchar(255) NOT NULL,
  `cust_datetime` varchar(100) NOT NULL,
  `cust_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`cust_id`, `cust_name`, `cust_email`, `cust_phone`, `cust_address`, `cust_city`, `cust_state`, `cust_zip`, `cust_d_name`, `cust_d_phone`, `cust_d_address`, `cust_d_city`, `cust_d_state`, `cust_d_zip`, `cust_password`, `cust_token`, `cust_datetime`, `cust_status`) VALUES
(11, 'sushant', 'sushant@gmail.com', '9412127489', 'balaju', 'kathmandu', 'bagmati', '44600', 'Sushant Mishra', '9812345678', 'Nayabazar-16, Kathmandu', 'Kathmandu', 'Bagmati', '44600', '7c4a8d09ca3762af61e59520943dc26494f8941b', '73b943004e92ca5a44eebaefe2fdb318', '2024-04-27 10:21:37', 1),
(13, 'Suman Shrestha', 'suman@gmail.com', '9812345678', 'Chamati, KTM', 'Kathmandu', 'Bagmati', '44600', 'Suman', '9812345678', 'Chamati, KTM', 'Kathmandu', 'Bagmati', '44600', 'eea44c069266202e7450b0f3a975cde05873ae82', '556e907fc68f0a9222e1c27c3ae34811ee9a73af', '2024-05-18 01:38:21', 1),
(14, 'sadikshya', 'sadikshya@gmail.com', '9898765432', 'Shanti, KTM', 'Kathmandu', 'Bagmati', '44600', 'sadikshya', '9898765432', 'Shanti Tole, KTM', 'Kathmandu', 'Bagmati', '44600', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'c512c1fc15ce3c49e6b1f4e7d61a0f7762578f0f', '2024-05-18 01:54:21', 1),
(16, 'Ram', 'ram@gmail.com', '9555555555', 'Baneshwor\r\n                                    ', 'Kathmandu', 'Bagmati', '44600', 'Ram', '9555555555', 'Baneshwor\r\n                                    ', 'Kathmandu', 'Bagmati', '44600', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'ebc420fd88d24a49e6a38b152da89c91ac85e209', '2024-05-25 05:26:56', 1),
(17, 'muskan', 'muskan@gmail.com', '9985656223', 'Kalimati\r\n                                    ', 'Kathmandu', 'Bagmati', '44600', 'muskan', '9985656223', 'Kalimati\r\n                                    ', 'Kathmandu', 'Bagmati', '44600', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'd8202a03641b2eb1ca6df8f7bd5919bc359bc7f0', '2024-05-30 01:03:00', 1),
(25, 'Sagar', 'sagar@gmail.com', '9165131023', ' Chandragiri                               \r\n                                    ', 'Kathmandu', 'Bagmati', '44600', 'Sagar', '9165131023', ' Chandragiri                               \r\n                                    ', 'Kathmandu', 'Bagmati', '44600', '97fea0784677d401ad07aa5698bbd5b3fee467ea', 'af91de7c8bd7f4191cdc58b28bd862834438400f', '2024-06-05 03:40:17', 1),
(26, 'User1', 'user1@gmail.com', '9885655123', 'Nepaltar                                \r\n                                    ', 'Kathmandu', 'Bagmati', '44600', 'User1', '9885655123', 'Nepaltar                                \r\n                                    ', 'Kathmandu', 'Bagmati', '44600', '178bab537b8c6e995aa8ea0c8d4032a03d499326', 'c51f687059fed955c8ecddd290db0659686cb156', '2024-06-14 07:48:36', 1),
(27, 'user2', 'user2@gmail.com', '9855566955', 'Balaju                                \r\n                                    ', 'Kathmandu', 'Bagmati', '44600', 'user2', '9855566955', 'Balaju                                \r\n                                    ', 'Kathmandu', 'Bagmati', '44600', '4ba47a586a25255b386b028e8d12679f1139a9ee', '6a624d70c6afc1cb91d151655710d30cc6b1dae2', '2024-06-15 02:21:13', 1),
(28, 'user3', 'user3@gmail.com', '9994656262', 'Jarankhu                              \r\n                                    ', 'Kathmandu', 'Bagmati', '44600', 'user3', '9994656262', 'Jarankhu                              \r\n                                    ', 'Kathmandu', 'Bagmati', '44600', '828b9bb56b9ca803855250afc4e4b83a00a05b50', 'a644118a2d0ba83ec6295118b59fdd16399cf897', '2024-06-16 11:40:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_message`
--

CREATE TABLE `tbl_customer_message` (
  `customer_message_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `order_detail` text NOT NULL,
  `cust_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_customer_message`
--

INSERT INTO `tbl_customer_message` (`customer_message_id`, `subject`, `message`, `order_detail`, `cust_id`) VALUES
(9, 'Order completed.', 'Thank you for using our service.', '\nCustomer Name: sushant<br>\nCustomer Email: sushant@gmail.com<br>\nPayment Method: Bank Deposit<br>\nPayment Date: 2024-05-08 20:53:07<br>\nPayment Details: <br>\nTransaction Details: <br>456789123<br>\nPaid Amount: 6650<br>\nPayment Status: Completed<br>\nShipping Status: Completed<br>\nPayment Id: 1715226787<br>\n            \n<br><b><u>Product Item 1</u></b><br>\nProduct Name: TONY LAMA MEN\'S WESTERN RIDE LEATHER BELT<br>\nSize: One Size for All<br>\nColor: Black<br>\nQuantity: 1<br>\nUnit Price: 650<br>\n            \n<br><b><u>Product Item 2</u></b><br>\nProduct Name: Men\'s Leather jacket<br>\nSize: S<br>\nColor: Black<br>\nQuantity: 1<br>\nUnit Price: 5900<br>\n            ', 11),
(10, 'Order completed.', 'Thank you for using our service.', '\nCustomer Name: sushant<br>\nCustomer Email: sushant@gmail.com<br>\nPayment Method: Bank Deposit<br>\nPayment Date: 2024-05-08 20:53:07<br>\nPayment Details: <br>\nTransaction Details: <br>456789123<br>\nPaid Amount: 6650<br>\nPayment Status: Completed<br>\nShipping Status: Completed<br>\nPayment Id: 1715226787<br>\n            \n<br><b><u>Product Item 1</u></b><br>\nProduct Name: TONY LAMA MEN\'S WESTERN RIDE LEATHER BELT<br>\nSize: One Size for All<br>\nColor: Black<br>\nQuantity: 1<br>\nUnit Price: 650<br>\n            \n<br><b><u>Product Item 2</u></b><br>\nProduct Name: Men\'s Leather jacket<br>\nSize: S<br>\nColor: Black<br>\nQuantity: 1<br>\nUnit Price: 5900<br>\n            ', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery_cost`
--

CREATE TABLE `tbl_delivery_cost` (
  `shipping_cost_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `amount` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_delivery_cost`
--

INSERT INTO `tbl_delivery_cost` (`shipping_cost_id`, `country_id`, `amount`) VALUES
(1, 228, '11'),
(2, 167, '10'),
(3, 13, '8'),
(4, 230, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery_cost_all`
--

CREATE TABLE `tbl_delivery_cost_all` (
  `sca_id` int(11) NOT NULL,
  `amount` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_delivery_cost_all`
--

INSERT INTO `tbl_delivery_cost_all` (`sca_id`, `amount`) VALUES
(1, '100');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_end_category`
--

CREATE TABLE `tbl_end_category` (
  `ecat_id` int(11) NOT NULL,
  `ecat_name` varchar(255) NOT NULL,
  `mcat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_end_category`
--

INSERT INTO `tbl_end_category` (`ecat_id`, `ecat_name`, `mcat_id`) VALUES
(7, 'T-Shirt', 3),
(14, 'Hoodies', 7),
(15, 'Coat', 7),
(16, 'Socks ', 8),
(17, 'Pant', 8),
(18, 'Joggers', 8),
(19, 'Shorts', 8),
(20, 'T-shirts', 9),
(22, 'Shirts', 9),
(23, 'Hoodie', 9),
(24, 'Vests', 9),
(80, 'Jacket', 9),
(81, 'Belts', 8),
(83, 'Coat', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `faq_id` int(11) NOT NULL,
  `faq_title` varchar(255) NOT NULL,
  `faq_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_faq`
--

INSERT INTO `tbl_faq` (`faq_id`, `faq_title`, `faq_content`) VALUES
(1, 'How to find an item?', '<h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; margin: 0.2rem 0px 0.5rem; padding: 0px; line-height: 1.4; background-color: rgb(250, 250, 250);\"><font color=\"#222222\" face=\"opensans, Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15.7143px;\">We have a wide range of fabulous products to choose from.</span></font></h3><h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; margin: 0.2rem 0px 0.5rem; padding: 0px; line-height: 1.4; background-color: rgb(250, 250, 250);\"><span style=\"font-size: 15.7143px; color: rgb(34, 34, 34); font-family: opensans, \"Helvetica Neue\", Helvetica, Helvetica, Arial, sans-serif;\">Tip 1: If you\'re looking for a specific product, use the keyword search box located at the top of the site. Simply type what you are looking for, and prepare to be amazed!</span></h3><h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; margin: 0.2rem 0px 0.5rem; padding: 0px; line-height: 1.4; background-color: rgb(250, 250, 250);\"><font color=\"#222222\" face=\"opensans, Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15.7143px;\">Tip 2: If you want to explore a category of products, use the Shop Categories in the upper menu, and navigate through your favorite categories where we\'ll feature the best products in each.</span></font><br><br></h3>\r\n'),
(2, 'What is your return policy?', '<p><span style=\"color: rgb(10, 10, 10); font-family: opensans, &quot;Helvetica Neue&quot;, Helvetica, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\">You have 15 days to make a refund request after your order has been delivered.</span><br></p>\r\n'),
(3, ' I received a defective/damaged item, can I get a refund?', '<p>In case the item you received is damaged or defective, you could return an item in the same condition as you received it with the original box and/or packaging intact. Once we receive the returned item, we will inspect it and if the item is found to be defective or damaged, we will process the refund along with any shipping fees incurred.<br></p>\r\n'),
(4, 'When are ‘Returns’ not possible?', '<p class=\"a  \" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; line-height: 1.6; margin-bottom: 0.714286rem; padding: 0px; font-size: 14px; color: rgb(10, 10, 10); font-family: opensans, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" background-color:=\"\" rgb(250,=\"\" 250,=\"\" 250);\"=\"\">There are a few certain scenarios where it is difficult for us to support returns:</p><ol style=\"box-sizing: inherit; line-height: 1.6; margin-right: 0px; margin-bottom: 0px; margin-left: 1.25rem; padding: 0px; list-style-position: outside; color: rgb(10, 10, 10); font-family: opensans, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" background-color:=\"\" rgb(250,=\"\" 250,=\"\" 250);\"=\"\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Return request is made outside the specified time frame, of 15 days from delivery.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Product is used, damaged, or is not in the same condition as you received it.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Specific categories like innerwear and&nbsp;socks&nbsp;etc.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Products with tampered or missing serial numbers.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Anything missing from the package you\'ve received including price tags, labels and&nbsp;original packing.</li></ol>\r\n'),
(5, 'What are the items that cannot be returned?', '<p>The items that can not be returned are:</p><p>Clearance items clearly marked as such and displaying a No-Return Policy<br></p><p>When the offer notes states so specifically are items that cannot be returned.</p><p>Items that fall into the below product types-</p><ul><li>Underwear</li><li>Lingerie</li><li>Socks</li><li>Software</li><li>Music albums</li><li>Books</li><li>Swimwear</li><li>Beauty &amp; Fragrances</li><li>Hosiery</li></ul><p>Also, any consumable items that are used or installed cannot be returned. As outlined in consumer Protection Rights and concerning section on non-returnable items<br></p>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language`
--

CREATE TABLE `tbl_language` (
  `lang_id` int(11) NOT NULL,
  `lang_name` varchar(255) NOT NULL,
  `lang_value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_language`
--

INSERT INTO `tbl_language` (`lang_id`, `lang_name`, `lang_value`) VALUES
(1, 'Currency', 'Rs'),
(2, 'Search Product', 'Search Product'),
(3, 'Search', 'Search'),
(4, 'Submit', 'Submit'),
(5, 'Update', 'Update'),
(6, 'Read More', 'Read More'),
(7, 'Serial', 'Serial'),
(8, 'Photo', 'Photo'),
(9, 'Login', 'Login'),
(10, 'Customer Login', 'Customer Login'),
(11, 'Click here to login', 'Click here to login'),
(12, 'Back to Login Page', 'Back to Login Page'),
(13, 'Logged in as', 'Logged in as'),
(14, 'Logout', 'Logout'),
(15, 'Register', 'Register'),
(16, 'Customer Registration', 'Customer Registration'),
(17, 'Registration Successful', 'Registration Successful'),
(18, 'Cart', 'Cart'),
(19, 'View Cart', 'View Cart'),
(20, 'Update Cart', 'Update Cart'),
(21, 'Back to Cart', 'Back to Cart'),
(22, 'Checkout', 'Checkout'),
(23, 'Proceed to Checkout', 'Proceed to Checkout'),
(24, 'Orders', 'Orders'),
(25, 'Order History', 'Order History'),
(26, 'Order Details', 'Order Details'),
(27, 'Payment Date and Time', 'Payment Date and Time'),
(28, 'Transaction ID', 'Transaction ID'),
(29, 'Paid Amount', 'Paid Amount'),
(30, 'Payment Status', 'Payment Status'),
(31, 'Payment Method', 'Payment Method'),
(32, 'Payment ID', 'Payment ID'),
(33, 'Payment Section', 'Payment Section'),
(34, 'Select Payment Method', 'Select Payment Method'),
(35, 'Select a Method', 'Select a Method'),
(36, 'PayPal', 'PayPal'),
(37, 'Stripe', 'Stripe'),
(38, 'Bank Deposit', 'Bank Deposit'),
(39, 'Card Number', 'Card Number'),
(40, 'CVV', 'CVV'),
(41, 'Month', 'Month'),
(42, 'Year', 'Year'),
(43, 'Send to this Details', 'Send to this Details'),
(44, 'Transaction Information', 'Transaction Information'),
(45, 'Include transaction id and other information correctly', 'Include transaction id and other information correctly'),
(46, 'Pay Now', 'Pay Now'),
(47, 'Product Name', 'Product Name'),
(48, 'Product Details', 'Product Details'),
(49, 'Categories', 'Categories'),
(50, 'Category:', 'Category:'),
(51, 'All Products Under', 'All Products Under'),
(52, 'Select Size', 'Select Size'),
(53, 'Select Color', 'Select Color'),
(54, 'Product Price', 'Product Price'),
(55, 'Quantity', 'Quantity'),
(56, 'Out of Stock', 'Out of Stock'),
(57, 'Share This', 'Share This'),
(58, 'Share This Product', 'Share This Product'),
(59, 'Product Description', 'Product Description'),
(60, 'Features', 'Features'),
(61, 'Conditions', 'Conditions'),
(62, 'Return Policy', 'Return Policy'),
(63, 'Reviews', 'Reviews'),
(64, 'Review', 'Review'),
(65, 'Give a Review', 'Give a Review'),
(66, 'Write your comment (Optional)', 'Write your comment (Optional)'),
(67, 'Submit Review', 'Submit Review'),
(68, 'You already have given a rating!', 'You already have given a rating!'),
(69, 'You must have to login to give a review', 'You must have to login to give a review'),
(70, 'No description found', 'No description found'),
(71, 'No feature found', 'No feature found'),
(72, 'No condition found', 'No condition found'),
(73, 'No return policy found', 'No return policy found'),
(74, 'Review not found', 'Review not found'),
(75, 'Customer Name', 'Customer Name'),
(76, 'Comment', 'Comment'),
(77, 'Comments', 'Comments'),
(78, 'Rating', 'Rating'),
(79, 'Previous', 'Previous'),
(80, 'Next', 'Next'),
(81, 'Sub Total', 'Sub Total'),
(82, 'Total', 'Total'),
(83, 'Action', 'Action'),
(84, 'Shipping Cost', 'Shipping Cost'),
(85, 'Continue Shopping', 'Continue Shopping'),
(86, 'Update Billing Address', 'Update Billing Address'),
(87, 'Update Shipping Address', 'Update Shipping Address'),
(88, 'Update Billing and Shipping Info', 'Update Billing and Shipping Info'),
(89, 'Dashboard', 'Dashboard'),
(90, 'Welcome to the Dashboard', 'Welcome to the Dashboard'),
(91, 'Back to Dashboard', 'Back to Dashboard'),
(92, 'Subscribe', 'Subscribe'),
(93, 'Subscribe To Our Newsletter', 'Subscribe To Our Newsletter'),
(94, 'Email Address', 'Email Address'),
(95, 'Enter Your Email Address', 'Enter Your Email Address'),
(96, 'Password', 'Password'),
(97, 'Forget Password', 'Forget Password'),
(98, 'Retype Password', 'Retype Password'),
(99, 'Update Password', 'Update Password'),
(100, 'New Password', 'New Password'),
(101, 'Retype New Password', 'Retype New Password'),
(102, 'Full Name', 'Full Name'),
(103, 'Company Name', 'Company Name'),
(104, 'Phone Number', 'Phone Number'),
(105, 'Address', 'Address'),
(106, 'Country', 'Country'),
(107, 'City', 'City'),
(108, 'State', 'State'),
(109, 'Zip Code', 'Zip Code'),
(110, 'About Us', 'About Us'),
(111, 'Featured Posts', 'Featured Posts'),
(112, 'Popular Posts', 'Popular Posts'),
(113, 'Recent Posts', 'Recent Posts'),
(114, 'Contact Information', 'Contact Information'),
(115, 'Contact Form', 'Contact Form'),
(116, 'Our Office', 'Our Office'),
(117, 'Update Profile', 'Update Profile'),
(118, 'Send Message', 'Send Message'),
(119, 'Message', 'Message'),
(120, 'Find Us On Map', 'Find Us On Map'),
(121, 'Congratulation! Payment is successful.', 'Congratulation! Payment is successful.'),
(122, 'Billing and Shipping Information is updated successfully.', 'Billing and Shipping Information is updated successfully.'),
(123, 'Customer Name can not be empty.', 'Customer Name can not be empty.'),
(124, 'Phone Number can not be empty.', 'Phone Number can not be empty.'),
(125, 'Address can not be empty.', 'Address can not be empty.'),
(126, 'You must have to select a country.', 'You must have to select a country.'),
(127, 'City can not be empty.', 'City can not be empty.'),
(128, 'State can not be empty.', 'State can not be empty.'),
(129, 'Zip Code can not be empty.', 'Zip Code can not be empty.'),
(130, 'Profile Information is updated successfully.', 'Profile Information is updated successfully.'),
(131, 'Email Address can not be empty', 'Email Address can not be empty'),
(132, 'Email and/or Password can not be empty.', 'Email and/or Password can not be empty.'),
(133, 'Email Address does not match.', 'Email Address does not match.'),
(134, 'Email address must be valid.', 'Email address must be valid.'),
(135, 'You email address is not found in our system.', 'You email address is not found in our system.'),
(136, 'Please check your email and confirm your subscription.', 'Please check your email and confirm your subscription.'),
(137, 'Your email is verified successfully. You can now login to our website.', 'Your email is verified successfully. You can now login to our website.'),
(138, 'Password can not be empty.', 'Password can not be empty.'),
(139, 'Passwords do not match.', 'Passwords do not match.'),
(140, 'Please enter new and retype passwords.', 'Please enter new and retype passwords.'),
(141, 'Password is updated successfully.', 'Password is updated successfully.'),
(142, 'To reset your password, please click on the link below.', 'To reset your password, please click on the link below.'),
(143, 'PASSWORD RESET REQUEST - YOUR WEBSITE.COM', 'PASSWORD RESET REQUEST - YOUR WEBSITE.COM'),
(144, 'The password reset email time (24 hours) has expired. Please again try to reset your password.', 'The password reset email time (24 hours) has expired. Please again try to reset your password.'),
(145, 'A confirmation link is sent to your email address. You will get the password reset information in there.', 'A confirmation link is sent to your email address. You will get the password reset information in there.'),
(146, 'Password is reset successfully. You can now login.', 'Password is reset successfully. You can now login.'),
(147, 'Email Address Already Exists', 'Email Address Already Exists.'),
(148, 'Sorry! Your account is inactive. Please contact to the administrator.', 'Sorry! Your account is inactive. Please contact to the administrator.'),
(149, 'Change Password', 'Change Password'),
(150, 'Registration Email Confirmation for YOUR WEBSITE', 'Registration Email Confirmation for YOUR WEBSITE.'),
(151, 'Thank you for your registration! Your account has been created. To active your account click on the link below:', 'Thank you for your registration! Your account has been created. To active your account click on the link below:'),
(152, 'Your registration is completed. Please check your email address to follow the process to confirm your registration.', 'Your registration is completed. Please check your email address to follow the process to confirm your registration.'),
(153, 'No Product Found', 'No Product Found'),
(154, 'Add to Cart', 'Add to Cart'),
(155, 'Related Products', 'Related Products'),
(156, 'See all related products from below', 'See all the related products from below'),
(157, 'Size', 'Size'),
(158, 'Color', 'Color'),
(159, 'Price', 'Price'),
(160, 'Please login as customer to checkout', 'Please login as customer to checkout'),
(161, 'Billing Address', 'Billing Address'),
(162, 'Shipping Address', 'Shipping Address'),
(163, 'Rating is Submitted Successfully!', 'Rating is Submitted Successfully!');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mid_category`
--

CREATE TABLE `tbl_mid_category` (
  `mcat_id` int(11) NOT NULL,
  `mcat_name` varchar(255) NOT NULL,
  `tcat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_mid_category`
--

INSERT INTO `tbl_mid_category` (`mcat_id`, `mcat_name`, `tcat_id`) VALUES
(7, 'Clothing', 2),
(8, 'Bottoms', 1),
(9, 'T-shirts & Shirts', 1),
(10, 'Clothing', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `size` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `unit_price` varchar(50) NOT NULL,
  `payment_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `product_id`, `product_name`, `size`, `color`, `quantity`, `unit_price`, `payment_id`) VALUES
(7, 95, 'TONY LAMA MEN\'S WESTERN RIDE LEATHER BELT', 'One Size for All', 'Black', '1', '650', '1715226787'),
(8, 84, 'Men\'s Leather jacket', 'S', 'Black', '1', '5900', '1715226787'),
(17, 144, 'Socks', 'L', 'Gray', '1', '150', '1716072261'),
(18, 96, 'Men\'s Loose Fit Heavyweight Long-Sleeve Pocket T-Shirt', 'M', 'Charcoal', '1', '2000', '1716080311'),
(19, 168, 'Jogger', 'L', '', '2', '1400', '1716080311'),
(20, 146, 'Socks', 'M', 'Black', '1', '200', '1716080420'),
(21, 136, 'Formal Pant', '43', 'Blue', '2', '2000', '1716081126'),
(22, 183, 'Inside Fur Winter Jacket ', 'XXL', 'Gray', '2', '3000', '1716082271'),
(29, 103, 'Polo Tshirt', 'L', 'Blue', '1', '1550', '1716679313'),
(33, 120, 'Sweat-shirt', 'XL', 'White', '3', '2300', '1717171402'),
(34, 103, 'Polo Tshirt', 'L', 'Blue', '2', '1550', '1717179640'),
(35, 106, ' Jeans Jacket', 'XL', 'Gray', '3', '3150', '1717471661'),
(40, 103, 'Polo Tshirt', 'L', 'Blue', '1', '1550', '1718419611'),
(41, 112, 'T-shirt', 'L', 'White', '10', '1300', '1718427406'),
(47, 119, 'Shirt', 'XL', 'Blue', '1', '1400', '1718607025'),
(48, 109, 'Leather Jacket', 'S', 'Brown', '1', '3900', '1718608505');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page`
--

CREATE TABLE `tbl_page` (
  `id` int(11) NOT NULL,
  `about_title` varchar(255) NOT NULL,
  `about_content` text NOT NULL,
  `about_banner` varchar(255) NOT NULL,
  `about_meta_title` varchar(255) NOT NULL,
  `about_meta_keyword` text NOT NULL,
  `about_meta_description` text NOT NULL,
  `faq_title` varchar(255) NOT NULL,
  `faq_banner` varchar(255) NOT NULL,
  `faq_meta_title` varchar(255) NOT NULL,
  `faq_meta_keyword` text NOT NULL,
  `faq_meta_description` text NOT NULL,
  `blog_title` varchar(255) NOT NULL,
  `blog_banner` varchar(255) NOT NULL,
  `blog_meta_title` varchar(255) NOT NULL,
  `blog_meta_keyword` text NOT NULL,
  `blog_meta_description` text NOT NULL,
  `contact_title` varchar(255) NOT NULL,
  `contact_banner` varchar(255) NOT NULL,
  `contact_meta_title` varchar(255) NOT NULL,
  `contact_meta_keyword` text NOT NULL,
  `contact_meta_description` text NOT NULL,
  `pgallery_title` varchar(255) NOT NULL,
  `pgallery_banner` varchar(255) NOT NULL,
  `pgallery_meta_title` varchar(255) NOT NULL,
  `pgallery_meta_keyword` text NOT NULL,
  `pgallery_meta_description` text NOT NULL,
  `vgallery_title` varchar(255) NOT NULL,
  `vgallery_banner` varchar(255) NOT NULL,
  `vgallery_meta_title` varchar(255) NOT NULL,
  `vgallery_meta_keyword` text NOT NULL,
  `vgallery_meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_page`
--

INSERT INTO `tbl_page` (`id`, `about_title`, `about_content`, `about_banner`, `about_meta_title`, `about_meta_keyword`, `about_meta_description`, `faq_title`, `faq_banner`, `faq_meta_title`, `faq_meta_keyword`, `faq_meta_description`, `blog_title`, `blog_banner`, `blog_meta_title`, `blog_meta_keyword`, `blog_meta_description`, `contact_title`, `contact_banner`, `contact_meta_title`, `contact_meta_keyword`, `contact_meta_description`, `pgallery_title`, `pgallery_banner`, `pgallery_meta_title`, `pgallery_meta_keyword`, `pgallery_meta_description`, `vgallery_title`, `vgallery_banner`, `vgallery_meta_title`, `vgallery_meta_keyword`, `vgallery_meta_description`) VALUES
(1, 'About Us', '<p style=\"border: 0px solid; margin-top: 1.5rem; margin-bottom: 0px;\">Welcome to Ecommerce PHP Project!</p><p style=\"border: 0px solid; margin-top: 1.5rem; margin-bottom: 0px;\"><span style=\"border: 0px solid;\">We aim to offer our customers a variety of the latest products. We have come a long way, so we know exactly which direction to take when supplying you with high quality yet budget-friendly products. We offer all of this while providing excellent customer service and friendly support.</span></p><p style=\"border: 0px solid; margin-top: 1.5rem; margin-bottom: 0px;\"><span style=\"border: 0px solid;\">We always keep an eye on the latest trends and put our customer wishes first. That is why we have satisfied our all customers.</span></p><p style=\"border: 0px solid; margin-top: 1.5rem; margin-bottom: 0px;\"><span style=\"border: 0px solid;\">The interests of our customers are always top priority for us, so we hope you will enjoy our products as much as we enjoy making them available to you.</span></p><p style=\"\">We make sure you get the best quality outfits with hassle free returns and exchanges policy. We ensure what you see is exactly what you get!</p><ul><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Low Price Guarantee</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">24/7 Customer Support</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">E-Mail - Call</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">We are here for you 24/7 online and via phone.</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Sizing &amp; Color</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Easy Returns</span></font></li></ul><p style=\"text-align: justify; \"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Bought an outfit but want to return it? We have a 3 days easy return policy. Please mail us at ratnagentswear@gmail.com for more details.</span></font></p><p style=\"text-align: justify; \"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\"><b>Verified Security</b></span></font></p><p style=\"text-align: justify; \"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">All our transactions are Verified with the highest standards of security. Plus, there\'s a lot to go around too through regular exciting offers and gifts, so spread the word and refer us to everyone from your family, friends and colleagues and get rewarded for it. Don\'t wait any longer Sign up with us now! start stalking, start buying, start loving and start Introducing the beauty in you.</span></font></p>\r\n', 'about-banner.jpg', 'About Us', 'about, about us, about fashion, about company, about ecommerce php project', 'Our goal has always been to get the best in you we brought a huge collection whether you are attending a party, wedding, and all those events that require a WOW dress.', 'FAQ', 'faq-banner.jpg', 'FAQ', '', '', 'Blog', 'blog-banner.jpg', 'Ecommerce - Blog', '', '', 'Contact Us', 'contact-banner.jpg', 'Contact', '', '', 'Photo Gallery', 'pgallery-banner.jpg', 'Ecommerce - Photo Gallery', '', '', 'Video Gallery', 'vgallery-banner.jpg', 'Ecommerce - Video Gallery', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `payment_date` varchar(50) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `card_holder_name` varchar(50) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `card_cvv` varchar(20) NOT NULL,
  `card_expiry` varchar(50) NOT NULL,
  `bank_transaction_info` text NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `shipping_status` varchar(20) NOT NULL,
  `payment_id` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`id`, `customer_id`, `customer_name`, `customer_email`, `payment_date`, `paid_amount`, `card_holder_name`, `card_number`, `card_cvv`, `card_expiry`, `bank_transaction_info`, `payment_method`, `payment_status`, `shipping_status`, `payment_id`) VALUES
(57, 11, 'sushant', 'sushant@gmail.com', '2024-05-08 20:53:07', 6650, '', '0', '0', '', '456789123', 'Bank Deposit', 'Completed', 'Completed', '1715226787'),
(96, 13, 'Suman Shrestha', 'suman@gmail.com', '2024-06-17 00:15:05', 4000, '', '', '', '', '', 'Khalti', 'Pending', 'Pending', '1718608505'),
(95, 28, 'user3', 'user3@gmail.com', '2024-06-16 23:50:25', 1500, 'user3', '4428316add20dcecc344', '6216f8a75fd5bb3d5f22', '2024-09', '', 'Debit Card', 'Completed', 'Completed', '1718607025');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_photo`
--

CREATE TABLE `tbl_photo` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_photo`
--

INSERT INTO `tbl_photo` (`id`, `caption`, `photo`) VALUES
(1, 'Photo 1', 'photo-1.jpg'),
(2, 'Photo 2', 'photo-2.jpg'),
(3, 'Photo 3', 'photo-3.jpg'),
(4, 'Photo 4', 'photo-4.jpg'),
(5, 'Photo 5', 'photo-5.jpg'),
(6, 'Photo 6', 'photo-6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_slug` varchar(255) NOT NULL,
  `post_content` text NOT NULL,
  `post_date` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `total_view` int(11) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`post_id`, `post_title`, `post_slug`, `post_content`, `post_date`, `photo`, `category_id`, `total_view`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(1, 'Cu vel choro exerci pri et oratio iisque', 'cu-vel-choro-exerci-pri-et-oratio-iisque', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-1.jpg', 3, 14, 'Cu vel choro exerci pri et oratio iisque', '', ''),
(2, 'Epicurei necessitatibus eu facilisi postulant ', 'epicurei-necessitatibus-eu-facilisi-postulant-', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-2.jpg', 3, 6, 'Epicurei necessitatibus eu facilisi postulant ', '', ''),
(3, 'Mei ut errem legimus periculis eos liber', 'mei-ut-errem-legimus-periculis-eos-liber', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-3.jpg', 3, 1, 'Mei ut errem legimus periculis eos liber', '', ''),
(4, 'Id pro unum pertinax oportere vel', 'id-pro-unum-pertinax-oportere-vel', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-4.jpg', 4, 0, 'Id pro unum pertinax oportere vel', '', ''),
(5, 'Tollit cetero cu usu etiam evertitur', 'tollit-cetero-cu-usu-etiam-evertitur', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-5.jpg', 4, 24, 'Tollit cetero cu usu etiam evertitur', '', ''),
(6, 'Omnes ornatus qui et te aeterno', 'omnes-ornatus-qui-et-te-aeterno', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-6.jpg', 4, 2, 'Omnes ornatus qui et te aeterno', '', ''),
(7, 'Vix tale noluisse voluptua ad ne', 'vix-tale-noluisse-voluptua-ad-ne', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-7.jpg', 2, 0, 'Vix tale noluisse voluptua ad ne', '', ''),
(8, 'Liber utroque vim an ne his brute', 'liber-utroque-vim-an-ne-his-brute', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-8.jpg', 2, 12, 'Liber utroque vim an ne his brute', '', ''),
(9, 'Nostrum copiosae argumentum has', 'nostrum-copiosae-argumentum-has', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-9.jpg', 1, 12, 'Nostrum copiosae argumentum has', '', ''),
(10, 'An labores explicari qui eu', 'an-labores-explicari-qui-eu', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-10.jpg', 1, 4, 'An labores explicari qui eu', '', ''),
(11, 'Lorem ipsum dolor sit amet', 'lorem-ipsum-dolor-sit-amet', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', '05-09-2017', 'news-11.jpg', 1, 18, 'Lorem ipsum dolor sit amet', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `p_old_price` varchar(10) NOT NULL,
  `p_current_price` varchar(10) NOT NULL,
  `p_qty` int(10) NOT NULL,
  `p_featured_photo` varchar(255) NOT NULL,
  `p_description` text NOT NULL,
  `p_short_description` text NOT NULL,
  `p_feature` text NOT NULL,
  `p_condition` text NOT NULL,
  `p_return_policy` text NOT NULL,
  `p_total_view` int(11) NOT NULL,
  `p_is_featured` int(1) NOT NULL,
  `p_is_active` int(1) NOT NULL,
  `ecat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`p_id`, `p_name`, `p_old_price`, `p_current_price`, `p_qty`, `p_featured_photo`, `p_description`, `p_short_description`, `p_feature`, `p_condition`, `p_return_policy`, `p_total_view`, `p_is_featured`, `p_is_active`, `ecat_id`) VALUES
(96, ' Long-Sleeve Polo T-Shirt', '2200', '1800', 101, 'product-featured-96.png', '<p><span style=\"color: rgb(51, 51, 51); font-family: \" amazon=\"\" ember\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" small;\"=\"\">Men\'s long-sleeve polo t-shirt made of heavyweight cotton.&nbsp;</span><br></p>', '', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: \" amazon=\"\" ember\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"overflow-wrap: break-word; display: block;\">100% cotton </span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"overflow-wrap: break-word; display: block;\">Left-chest pocket </span></li></ul>', '<p><br></p>', '<p><br></p>', 63, 1, 1, 20),
(103, 'Polo Tshirt', '1900', '1550', 51, 'product-featured-103.jpg', '<p>A stylish and comfortable men\'s t-shirt made from high-quality cotton, perfect for casual wear or layering.<br></p>', '', '', '', '', 93, 1, 1, 20),
(104, 'Denim Jeans Jacket', '3700', '3200', 25, 'J_1.jpg', '<p>Denim High Quality Jacket.</p>', '', '', '', '', 49, 1, 1, 80),
(106, 'Korean Jacket', '3500', '3150', 25, 'product-featured-106.png', '<p>Korean Winter Jacket super stylish and high quality fashionable jacket.</p>', '', '', '', '', 32, 1, 1, 80),
(107, ' Jeans Fur Jacket', '3000', '2650', 30, 'J_2.jpg', '<p>Inside Fur warm and stylish jeans jacket.</p>', '', '', '', '', 26, 1, 1, 80),
(108, 'Winter Down Jacket', '4000', '3700', 20, 'J_4.jpg', 'Winter&nbsp; Jacket super warm and high quality jacket.', '', '', '', '', 18, 1, 1, 80),
(109, 'Leather Jacket', '4300', '3900', 19, 'J_6.jpg', '<p>Winter branded leather jacket.</p>', '', '', '', '', 20, 1, 1, 80),
(110, 'T-shirt', '1600', '1300', 30, 'product-featured-110.jpg', '<p>A stylish and comfortable men\'s t-shirt made from high-quality cotton, perfect for casual wear or layering.<br></p>', '', '', '', '', 2, 1, 1, 20),
(111, 'T-shirt', '1600', '1300', 30, 'product-featured-111.png', '<p>Stylish Fancy Cotton Blend T-Shirts to elevate your everyday style.<br></p>', '', '', '', '', 4, 1, 1, 20),
(112, 'T-shirt', '1600', '1300', 20, 'ts1.jpg', '<p>A stylish men\'s t-shirt perfect for casual wear or layering.<br></p>', '', '', '', '', 12, 1, 1, 20),
(113, 'T-shirt', '1600', '1300', 20, 'product-featured-113.png', '<p>Classic cotton T-shirt to elevate your style.</p>', '', '', '', '', 6, 1, 1, 20),
(116, 'Shirt', '1400', '1200', 20, 'ss9.jpg', '<p>High quality collar design, offering comfort and style.<br></p>', '', '', '', '', 15, 1, 1, 22),
(117, 'Shirt', '1600', '1450', 30, 'product-featured-117.jpg', '<p>High quality collar design, offering comfort and style.<br></p>', '', '', '', '', 3, 1, 1, 22),
(118, 'Shirt', '1400', '1200', 30, 'product-featured-118.jpg', '<p>High quality collar design, offering comfort and style.<br></p>', '', '', '', '', 3, 1, 1, 22),
(119, 'Shirt', '1600', '1400', 19, 'product-featured-119.jpg', '<p>High quality collar design, offering comfort and style.<br></p>', '', '', '', '', 9, 1, 1, 22),
(120, 'Sweat-shirt', '2700', '2300', 17, 'hoo1.jpg', '<p>Made of soft cotton fabric that feels comfortable and comes in various colors and patterns to suit your personal taste and preference.<br></p>', '', '', '', '', 38, 1, 1, 23),
(121, 'Sweat-shirt', '2400', '2000', 20, 'product-featured-121.jpg', '<p>Made of soft cotton fabric that feels comfortable and comes in various colors and patterns to suit your personal taste and preference.<br></p>', '', '', '', '', 4, 1, 1, 23),
(122, 'Hoodie', '2400', '2000', 30, 'black_H.jpg', '<p>Made of soft cotton fabric that feels comfortable and comes in various colors and patterns to suit your personal taste and preference.<br></p>', '', '', '', '', 10, 1, 1, 23),
(126, 'Shorts', '1600', '1300', 20, 'product-featured-126.png', '<p>High quality and comfortable shorts.</p>', '', '', '', '', 2, 1, 1, 19),
(127, 'Denim Shorts', '1600', '1300', 20, 'sh4.jpg', '<p>Comfortable and high quality denim shorts.<br></p>', '', '', '', '', 5, 1, 1, 19),
(129, ' Square neck vests', '900', '700', 30, 'vvs.jpg', '<p>Lightweight, sleeveless garments perfect for staying cool and stylish.<br></p>', '', '', '', '', 10, 1, 1, 24),
(130, 'vests', '600', '400', 30, 'product-featured-130.jpeg', '<p>Lightweight, sleeveless garments perfect for staying cool and stylish.<br></p>', '', '', '', '', 4, 1, 1, 24),
(135, 'Jeans Pant', '1800', '1400', 55, 'product-featured-135.png', '<p>High-quality denim wash jean.<br></p>', '', '', '', '', 3, 1, 1, 17),
(136, 'Formal Pant', '1500', '1200', 53, 'product-featured-136.jpg', '<p>Stylish and classic formal pant.<br></p>', '', '', '', '', 18, 1, 1, 17),
(137, 'Jeans Pant', '2200', '2000', 30, 'p1.jpg', '<p>Our men\'s pants combine style and comfort, offering a perfect fit for any occasion.<br></p>', '', '', '', '', 4, 1, 1, 17),
(138, 'Rock Belt', '1300', '1050', 55, 'b3.jpg', '<p>Studded Black and Silver, Rock Belt, Super Cool Belt, Premium Full Grain Leather.<br></p>', '', '', '', '', 10, 1, 1, 81),
(139, 'Leather belt ', '1300', '1000', 30, 'product-featured-139.jpg', '<p>Branded Leather Belt and super stylish.</p>', '', '', '', '', 4, 1, 1, 81),
(140, 'Timberland Classic Jean Belt', '1600', '1200', 30, 'product-featured-140.jpg', '<p>Classic and Branded Leather Belt.<br></p>', '', '', '', '', 0, 1, 1, 81),
(141, 'Leather belt with metal buckle', '1500', '1300', 20, 'product-featured-141.jpg', '<p>Branded Leather Belt and super stylish.<br></p>', '', '', '', '', 10, 1, 1, 81),
(142, 'TONY LAMA MEN\'S WESTERN RIDE LEATHER BELT', '1300', '1000', 30, 'product-featured-142.jpg', '<p>Branded Leather Belt and super stylish.<br></p>', '', '', '', '', 6, 1, 1, 81),
(143, 'Slide Lock Leather Belt', '1500', '1300', 55, 'b1.jpg', '<p>Simple buckle for easy adjustment and a polished finish to complement any outfit.</p>', '', '', '', '', 6, 1, 1, 81),
(144, 'Socks', '350', '150', 53, 'product-featured-144.png', '<p><span segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" white-space-collapse:=\"\" preserve;\"=\"\" style=\"color: rgb(13, 13, 13);\">Comfy&nbsp;</span><span segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" white-space-collapse:=\"\" preserve;\"=\"\" style=\"color: rgb(13, 13, 13);\">cotton socks&nbsp;</span><span segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" white-space-collapse:=\"\" preserve;\"=\"\" style=\"color: rgb(13, 13, 13);\">and long-lasting for all-day wear.</span><br></p>', '', '', '', '', 40, 1, 1, 16),
(145, 'Alpaca Socks', '350', '150', 0, 'so_1.jpg', '<p><span style=\"color: rgb(13, 13, 13);\">Woolen socks keep your feet warm and cozy during chilly weather with their soft and insulating material.</span><br></p>', '', '', '', '', 9, 0, 1, 16),
(150, 'Polo Tshirt', '1600', '1300', 30, 'product-featured-150.jpg', '<p>Classic wardrobe staple, featuring a collared neckline, short sleeves, comfortable and effortlessly stylish look.<br></p>', '', '', '', '', 2, 1, 1, 20),
(152, 'Tshirt', '1600', '1300', 50, 'ts4.jpg', '<p>Classic wardrobe staple, featuring a collared neckline, short sleeves, comfortable and effortlessly stylish look.<br></p>', '', '', '', '', 7, 1, 1, 20),
(153, 'Polo Tshirt', '1600', '1300', 25, 'product-featured-153.png', '<p>Classic wardrobe staple, featuring a collared neckline, short sleeves, comfortable and effortlessly stylish look.<br></p>', '', '', '', '', 2, 1, 1, 20),
(155, 'Long Black Coat', '5500', '5000', 55, 'co_1.jpg', '<p>Long warm and stylish choice for colder weather, with a classic design that goes down past the hips for extra coverage and a sharp look.<br></p>', '', '', '', '', 14, 1, 1, 83),
(156, 'Long Coat', '4300', '3900', 30, 'co_2.jpg', '<p>Long warm and stylish choice for colder weather, with a classic design that goes down past the hips for extra coverage and a sharp look.<br></p>', '', '', '', '', 9, 1, 1, 83),
(158, 'One Button Blazer ', '3000', '2500', 25, 'cc3.jpg', '<p>Designed with luxurious fabrics, tailored cuts, and elegant details to elevate your style for special occasions and events.<br></p>', '', '', '', '', 10, 1, 1, 83),
(159, 'Stylish Tuxedo Blazer Suit', '3500', '2900', 20, 'c01.jpg', '<p><span style=\"color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" white-space-collapse:=\"\" preserve;\"=\"\">Party wear and stylish outerwear piece, featuring a tailored fit, durable materials, and versatile design to keep you warm and fashionable.</span><br></p>', '', '', '', '', 11, 1, 1, 83),
(160, 'Vests', '400', '200', 55, 'V_1.jpg', '<p>Lightweight, sleeveless garments perfect for staying cool and stylish.<br></p>', '', '', '', '', 5, 1, 1, 24),
(161, 'Printed Vests', '900', '600', 55, 'V_2.jpg', '<p>Lightweight, sleeveless garments perfect for staying cool and stylish.<br></p>', '', '', '', '', 6, 1, 1, 24),
(162, ' Printed Vest', '900', '600', 25, 'V_3.jpg', '<p>Lightweight, sleeveless garments perfect for staying cool and stylish.<br></p>', '', '', '', '', 8, 1, 1, 24),
(163, 'Vest', '250', '150', 30, 'V_4.jpg', '<p>Lightweight, sleeveless garments perfect for staying cool and stylish.<br></p>', '', '', '', '', 4, 1, 1, 24),
(166, 'Black Cotton Jogger', '1600', '1400', 30, 'product-featured-166.jpg', '<p>Comfortable, elasticized waistband, and functional pockets.<br></p>', '', '', '', '', 1, 1, 1, 18),
(168, 'Linen Cotton Jogger', '1600', '1400', 28, 'J1.jpg', '<p>Comfortable, elasticized waistband, and functional pockets.<br></p>', '', '', '', '', 16, 1, 1, 18),
(169, 'White CottonJogger', '1500', '1200', 30, 'product-featured-169.jpg', '<p>Comfortable, elasticized waistband, and functional pockets.<br></p>', '', '', '', '', 1, 1, 1, 18),
(172, ' Travel Cargo Shorts ', '1600', '1400', 30, 'product-featured-172.jpg', '<p>High quality cargo shorts.</p>', '', '', '', '', 5, 1, 1, 19),
(173, 'Cargo Pant', '2200', '2000', 30, '136.jpg', '<p><span style=\"color: rgb(51, 51, 51); font-family: Lato, Arial, Helvetica, sans-serif; font-size: 13.3px;\">High Quality New Stylish Box</span><span style=\"color: rgb(51, 51, 51); font-family: Lato, Arial, Helvetica, sans-serif; font-size: 13.3px;\"> Pant</span><br></p>', '', '', '', '', 14, 1, 1, 17),
(175, 'Black Wash Pant', '1900', '1500', 30, 'product-featured-175.png', '<p>Offers a sleek and sophisticated aesthetic, crafted from high-quality denim and treated with a deep, rich black wash for a timeless finish.<br></p>', '', '', '', '', 3, 1, 1, 17),
(176, 'Jeans Wash Pant', '1900', '1700', 30, 'product-featured-176.jpg', '<p><span style=\"color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; font-size: 16px; white-space-collapse: preserve;\">Comfortable and a versatile denim fabric washed to achieve a subtle vintage look.</span><br></p>', '', '', '', '', 8, 1, 1, 17),
(177, 'Jack Victor Blue Suit', '3500', '3000', 20, 'product-featured-177.jpg', '<p>Sharp, classy and  ideal for any formal event or professional occasion.<br></p>', '', '', '', '', 2, 1, 1, 83),
(178, ' Maroon Velvet Party Wear Coat', '5000', '4500', 30, 'product-featured-178.jpg', '<p><span style=\"color: rgb(17, 17, 17); font-family: Pin-Sans, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen-Sans, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", Ubuntu, Cantarell, \"Fira Sans\", \"Droid Sans\", \"Helvetica Neue\", Helvetica, \"?????? Pro W3\", ????, Meiryo, \"?? ?????\", Arial, sans-serif; font-size: 16px;\">S</span><font color=\"#111111\" face=\"Pin-Sans, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen-Sans, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue, Helvetica, ?????? Pro W3, ????, Meiryo, ?? ?????, Arial, sans-serif\"><span style=\"font-size: 16px;\">harp, classy and ideal for any formal event or professional occasion.</span></font><br></p>', '', '', '', '', 3, 1, 1, 83),
(179, 'Loose Fit Collar Shirt', '1400', '1200', 55, 'black_shirt.jpg', '<p>Loose fit with a collar design, offering comfort and style.<br></p>', '', '', '', '', 9, 1, 1, 22),
(180, ' Zip Hoodie', '2400', '2100', 30, 'zip1.jpg', '<p>Zip hoodie cozy and convenient, featuring a zipper closure for easy wear and warmth on chilly days.<br></p>', '', '', '', '', 10, 1, 1, 23),
(181, 'Regular Fit Hoodie', '2200', '2000', 50, 'product-featured-181.jpg', '<p>Casual, comfortable garment with a hood attached, perfect for staying warm and relaxed in cooler weather.<br></p>', '', '', '', '', 1, 1, 1, 23),
(182, 'Back Printed Hoodie', '2200', '2000', 20, 'product-featured-182.jpg', '<p>Casual, comfortable garment with a hood attached, perfect for staying warm and relaxed in cooler weather.<br></p>', '', '', '', '', 7, 1, 1, 23),
(183, 'Inside Fur Winter Jacket ', '1700', '1400', 28, 'product-featured-183.jpg', '<p>Warm outerwear piece featuring fur and stylish during cold weather.<br></p>', '', '', '', '', 7, 1, 1, 80),
(185, 'Ultra thin Breathable Cotton Socks', '180', '100', 30, 'product-featured-185.jpg', '<p>Comfortable and ultra thin breathable cotton socks.<br></p>', '', '', '', '', 6, 1, 1, 16),
(186, 'Black socks', '150', '100', 30, 'product-featured-186.jpg', 'Pair sport crew cotton socks wear mock up. Long clear soft cloth stand presentation.&nbsp;', '', '', '', '', 3, 1, 1, 16),
(187, 'White socks', '180', '100', 30, 'product-featured-187.jpg', '<p><span style=\"color: rgb(51, 51, 51); font-size: 14px;\">Pair sport crew cotton socks wear mock up. Long clear soft cloth stand presentation.&nbsp;</span><br></p>', '', '', '', '', 4, 1, 1, 16),
(188, 'Woolen Socks', '200', '150', 50, 'product-featured-188.jpg', '<p><span style=\"color: rgb(13, 13, 13);\">Woolen socks&nbsp;keep your feet warm and cozy during chilly weather with their soft and insulating material.</span><br></p>', '', '', '', '', 5, 1, 1, 16),
(189, 'Pocket Jogger', '1900', '1500', 25, 'J2.jpg', '<p>Super Stylish comfortable pocket jogger</p>', '', '', '', '', 21, 1, 1, 18),
(190, 'Army Printed Jogger', '1900', '1700', 30, 'J3.jpg', '<p>Comfy and high quality stretchable jogger</p><h1 class=\"p_txt\" style=\"-webkit-font-smoothing: antialiased; font-size: 20px; font-weight: bold; color: rgb(0, 0, 0); margin-bottom: 0px; text-align: center; font-family: Lato, sans-serif;\"><br></h1>', '', '', '', '', 11, 1, 1, 18),
(191, 'Printed Jogger', '2500', '2100', 50, 'product-featured-191.jpg', '<p>Cool Printed Green Skull Horn Jogger Hip Hop Pant<br></p>', '', '', '', '', 10, 1, 1, 18),
(192, 'Printed Shorts', '900', '700', 20, 'product-featured-192.png', '<p>Print Cotton Elastic Shorts high quality and comes with belt.</p>', '', '', '', '', 1, 1, 1, 19),
(193, 'Korean Shorts', '900', '700', 25, 'product-featured-193.png', '<p>Formal Korean black shorts with key ring. Super stylish and comfort.<br></p>', '', '', '', '', 4, 1, 1, 19),
(195, 'Printed Shorts', '950', '700', 30, 'product-featured-195.png', '<p>Trendy casual color printed shorts stylish and comfortable<br></p>', '', '', '', '<p>We accept returns of unworn and unwashed clothing within 3 days of purchase in case of size problem.<br></p>', 1, 1, 1, 19);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_color`
--

CREATE TABLE `tbl_product_color` (
  `id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_product_color`
--

INSERT INTO `tbl_product_color` (`id`, `color_id`, `p_id`) VALUES
(69, 1, 4),
(70, 4, 4),
(77, 6, 6),
(82, 2, 12),
(83, 9, 13),
(84, 3, 14),
(85, 2, 15),
(86, 6, 15),
(87, 3, 16),
(88, 3, 17),
(89, 2, 18),
(90, 3, 19),
(91, 1, 20),
(92, 8, 21),
(93, 2, 22),
(94, 2, 23),
(95, 2, 25),
(96, 5, 26),
(97, 2, 27),
(98, 4, 27),
(99, 5, 28),
(100, 7, 29),
(101, 10, 30),
(102, 11, 31),
(103, 14, 32),
(105, 2, 34),
(106, 1, 35),
(107, 3, 36),
(109, 6, 38),
(110, 2, 39),
(111, 11, 42),
(149, 3, 10),
(150, 6, 9),
(151, 3, 8),
(152, 7, 7),
(159, 2, 77),
(163, 17, 79),
(164, 2, 78),
(167, 3, 80),
(168, 2, 81),
(172, 1, 82),
(173, 2, 82),
(174, 4, 82),
(195, 2, 84),
(222, 16, 93),
(237, 27, 91),
(239, 2, 92),
(240, 29, 92),
(244, 2, 90),
(245, 6, 90),
(246, 25, 90),
(247, 27, 90),
(248, 28, 90),
(251, 2, 95),
(252, 6, 95),
(256, 2, 94),
(257, 3, 87),
(258, 17, 87),
(261, 25, 97),
(262, 5, 98),
(263, 6, 99),
(266, 6, 101),
(267, 2, 102),
(314, 19, 114),
(325, 8, 125),
(451, 17, 176),
(458, 5, 167),
(460, 2, 165),
(461, 6, 165),
(462, 17, 165),
(477, 17, 144),
(478, 2, 146),
(481, 8, 145),
(492, 8, 129),
(500, 1, 151),
(501, 5, 150),
(510, 17, 123),
(512, 2, 122),
(513, 2, 121),
(515, 17, 156),
(516, 2, 155),
(522, 19, 178),
(523, 3, 177),
(530, 3, 119),
(531, 6, 118),
(532, 2, 117),
(537, 17, 182),
(540, 2, 181),
(549, 3, 89),
(554, 2, 186),
(555, 3, 185),
(557, 6, 187),
(565, 3, 164),
(566, 3, 188),
(578, 17, 173),
(579, 5, 191),
(580, 6, 169),
(581, 2, 166),
(589, 2, 138),
(590, 2, 143),
(591, 27, 152),
(594, 3, 116),
(595, 5, 116),
(598, 23, 180),
(599, 6, 120),
(605, 17, 183),
(607, 3, 158),
(609, 6, 159),
(610, 3, 107),
(614, 2, 113),
(615, 24, 96),
(616, 2, 111),
(617, 2, 193),
(622, 25, 192),
(623, 4, 126),
(624, 4, 153),
(625, 2, 175),
(635, 2, 161),
(636, 2, 162),
(637, 7, 163),
(638, 17, 130),
(639, 2, 179),
(640, 2, 160),
(642, 11, 168),
(643, 5, 190),
(644, 17, 189),
(645, 2, 110),
(646, 6, 112),
(647, 3, 103),
(649, 3, 195),
(650, 2, 139),
(651, 10, 139),
(652, 8, 142),
(653, 8, 140),
(654, 2, 141),
(655, 2, 135),
(656, 3, 136),
(658, 3, 137),
(659, 3, 127),
(660, 17, 172),
(661, 17, 106),
(662, 2, 104),
(663, 3, 104),
(664, 25, 108),
(665, 8, 109);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_photo`
--

CREATE TABLE `tbl_product_photo` (
  `pp_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_product_photo`
--

INSERT INTO `tbl_product_photo` (`pp_id`, `photo`, `p_id`) VALUES
(108, '108.jpg', 84),
(109, '109.jpg', 84),
(114, '114.jpg', 87),
(115, '115.jpg', 87),
(120, '120.jpg', 90),
(121, '121.jpg', 91),
(122, '122.jpg', 92),
(123, '123.jpg', 92),
(124, '124.jpg', 93),
(125, '125.jpg', 94),
(129, '129.jpg', 98),
(130, '130.jpg', 98),
(132, '132.jpg', 102),
(136, '136.jpg', 176),
(137, '137.jpeg', 175),
(138, '138.jpg', 173);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_size`
--

CREATE TABLE `tbl_product_size` (
  `id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_product_size`
--

INSERT INTO `tbl_product_size` (`id`, `size_id`, `p_id`) VALUES
(44, 1, 6),
(56, 8, 12),
(57, 9, 12),
(58, 10, 12),
(59, 11, 12),
(60, 12, 12),
(61, 13, 12),
(62, 9, 13),
(63, 11, 13),
(64, 13, 13),
(65, 15, 13),
(66, 9, 14),
(67, 11, 14),
(68, 12, 14),
(69, 13, 14),
(70, 9, 15),
(71, 11, 15),
(72, 13, 15),
(73, 15, 16),
(74, 16, 16),
(75, 17, 16),
(76, 16, 17),
(77, 17, 17),
(78, 14, 18),
(79, 15, 18),
(80, 16, 18),
(81, 17, 18),
(82, 15, 19),
(83, 16, 19),
(84, 17, 19),
(85, 14, 20),
(86, 15, 20),
(87, 17, 20),
(88, 15, 21),
(89, 17, 21),
(90, 15, 22),
(91, 16, 22),
(92, 17, 22),
(93, 15, 23),
(94, 16, 23),
(95, 17, 23),
(96, 18, 25),
(97, 19, 25),
(98, 20, 25),
(99, 21, 25),
(100, 19, 26),
(101, 21, 26),
(102, 22, 26),
(103, 23, 26),
(104, 19, 27),
(105, 20, 27),
(106, 21, 27),
(107, 22, 27),
(108, 19, 28),
(109, 20, 28),
(110, 21, 28),
(111, 19, 29),
(112, 20, 29),
(113, 22, 29),
(114, 1, 30),
(115, 2, 30),
(116, 3, 30),
(117, 4, 30),
(118, 23, 31),
(119, 26, 32),
(123, 2, 34),
(124, 2, 35),
(125, 2, 36),
(126, 3, 36),
(129, 2, 38),
(130, 3, 38),
(131, 4, 38),
(132, 5, 38),
(133, 27, 39),
(134, 8, 42),
(210, 3, 10),
(211, 4, 10),
(212, 5, 10),
(213, 6, 10),
(214, 3, 9),
(215, 4, 9),
(216, 3, 8),
(217, 4, 8),
(218, 2, 7),
(219, 3, 7),
(220, 4, 7),
(249, 1, 79),
(250, 2, 79),
(251, 3, 79),
(252, 1, 78),
(253, 2, 78),
(254, 3, 78),
(255, 4, 78),
(256, 5, 78),
(259, 26, 80),
(262, 3, 82),
(263, 4, 82),
(278, 2, 84),
(279, 3, 84),
(280, 4, 84),
(281, 5, 84),
(282, 6, 84),
(339, 27, 93),
(363, 2, 91),
(364, 3, 91),
(365, 4, 91),
(366, 5, 91),
(367, 6, 91),
(369, 27, 92),
(375, 1, 90),
(376, 2, 90),
(377, 3, 90),
(378, 4, 90),
(380, 27, 95),
(398, 33, 94),
(399, 29, 87),
(400, 30, 87),
(401, 31, 87),
(402, 32, 87),
(403, 33, 87),
(404, 34, 87),
(405, 35, 87),
(406, 36, 87),
(407, 37, 87),
(408, 38, 87),
(409, 39, 87),
(418, 8, 97),
(419, 9, 97),
(420, 10, 97),
(421, 11, 97),
(422, 12, 97),
(423, 13, 97),
(424, 14, 97),
(425, 15, 97),
(426, 16, 97),
(427, 17, 97),
(428, 18, 97),
(429, 19, 97),
(430, 4, 98),
(431, 5, 98),
(432, 6, 98),
(433, 7, 98),
(434, 40, 99),
(435, 41, 99),
(441, 27, 101),
(442, 42, 102),
(443, 43, 102),
(444, 44, 102),
(445, 45, 102),
(446, 46, 102),
(447, 47, 102),
(529, 1, 114),
(530, 4, 114),
(531, 5, 114),
(550, 3, 125),
(551, 4, 125),
(692, 4, 171),
(693, 6, 171),
(765, 8, 176),
(766, 9, 176),
(781, 5, 167),
(782, 6, 167),
(785, 3, 165),
(786, 4, 165),
(817, 4, 144),
(818, 3, 146),
(819, 4, 146),
(825, 2, 145),
(826, 3, 145),
(827, 4, 145),
(844, 2, 129),
(845, 3, 129),
(857, 5, 151),
(858, 4, 150),
(859, 5, 150),
(873, 5, 123),
(874, 6, 123),
(877, 4, 122),
(878, 5, 122),
(879, 5, 121),
(880, 6, 121),
(883, 2, 156),
(884, 3, 156),
(885, 5, 156),
(886, 4, 155),
(887, 5, 155),
(888, 6, 155),
(900, 4, 178),
(901, 5, 178),
(902, 4, 177),
(903, 5, 177),
(904, 6, 177),
(916, 5, 119),
(917, 5, 118),
(918, 5, 117),
(919, 6, 117),
(928, 4, 182),
(929, 5, 182),
(936, 5, 181),
(937, 6, 181),
(969, 3, 89),
(970, 4, 89),
(971, 5, 89),
(972, 6, 89),
(973, 7, 89),
(982, 2, 186),
(983, 3, 186),
(984, 5, 186),
(985, 3, 185),
(986, 5, 185),
(989, 27, 187),
(1004, 2, 164),
(1005, 3, 164),
(1006, 5, 188),
(1032, 4, 173),
(1033, 5, 173),
(1034, 4, 191),
(1035, 5, 191),
(1036, 6, 191),
(1037, 4, 169),
(1038, 5, 169),
(1039, 4, 166),
(1040, 5, 166),
(1057, 9, 138),
(1058, 12, 138),
(1059, 3, 143),
(1060, 5, 143),
(1061, 6, 143),
(1062, 5, 152),
(1068, 4, 116),
(1069, 5, 116),
(1072, 4, 180),
(1073, 5, 180),
(1074, 5, 120),
(1075, 6, 120),
(1086, 5, 183),
(1087, 6, 183),
(1088, 7, 183),
(1091, 3, 158),
(1092, 4, 158),
(1095, 3, 159),
(1096, 4, 159),
(1097, 3, 107),
(1098, 4, 107),
(1099, 5, 107),
(1112, 5, 113),
(1113, 6, 113),
(1114, 3, 96),
(1115, 4, 96),
(1116, 5, 96),
(1117, 6, 96),
(1118, 7, 96),
(1119, 4, 111),
(1120, 5, 111),
(1121, 2, 193),
(1122, 4, 193),
(1134, 5, 192),
(1135, 6, 192),
(1136, 4, 126),
(1137, 5, 126),
(1138, 6, 153),
(1139, 8, 175),
(1140, 9, 175),
(1156, 3, 161),
(1157, 4, 161),
(1158, 5, 161),
(1159, 5, 162),
(1160, 5, 163),
(1161, 3, 130),
(1162, 4, 130),
(1163, 4, 179),
(1164, 5, 179),
(1165, 6, 179),
(1166, 2, 160),
(1167, 3, 160),
(1173, 4, 168),
(1174, 5, 168),
(1175, 5, 190),
(1176, 5, 189),
(1177, 6, 189),
(1178, 3, 110),
(1179, 4, 110),
(1180, 5, 110),
(1181, 4, 112),
(1182, 5, 112),
(1183, 6, 112),
(1184, 4, 103),
(1185, 5, 103),
(1188, 5, 195),
(1189, 6, 195),
(1190, 4, 139),
(1191, 5, 139),
(1192, 3, 142),
(1193, 4, 142),
(1194, 5, 142),
(1195, 4, 140),
(1196, 5, 140),
(1197, 6, 140),
(1198, 1, 141),
(1199, 3, 141),
(1200, 4, 141),
(1201, 16, 135),
(1202, 17, 135),
(1203, 19, 135),
(1204, 20, 136),
(1205, 21, 136),
(1206, 22, 136),
(1210, 21, 137),
(1211, 22, 137),
(1212, 23, 137),
(1213, 4, 127),
(1214, 5, 127),
(1215, 4, 172),
(1216, 5, 172),
(1217, 5, 106),
(1218, 6, 106),
(1219, 3, 104),
(1220, 4, 104),
(1221, 5, 104),
(1222, 6, 104),
(1223, 2, 108),
(1224, 3, 108),
(1225, 4, 108),
(1226, 5, 108),
(1227, 6, 108),
(1228, 2, 109),
(1229, 3, 109),
(1230, 4, 109),
(1231, 5, 109),
(1232, 6, 109);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`id`, `title`, `content`, `photo`) VALUES
(5, 'Easy Returns', 'Return any item before 3 days!', 'service-5.png'),
(6, 'Fast Delivery', 'Enjoy fast delivery service!', 'service-6.jpg'),
(7, 'Premium Quality', 'Branded Product', 'service-7.jpg'),
(8, 'Satisfaction Guarantee', 'We guarantee you with our quality satisfaction.', 'service-8.png'),
(9, 'Secure Checkout', 'Providing Secure Checkout Options for all', 'service-9.png'),
(10, 'Money Back Guarantee', 'Offer money back guarantee on our products', 'service-10.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `footer_about` text NOT NULL,
  `footer_copyright` text NOT NULL,
  `contact_address` text NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `contact_fax` varchar(255) NOT NULL,
  `contact_map_iframe` text NOT NULL,
  `receive_email` varchar(255) NOT NULL,
  `receive_email_subject` varchar(255) NOT NULL,
  `receive_email_thank_you_message` text NOT NULL,
  `forget_password_message` text NOT NULL,
  `total_recent_post_footer` int(10) NOT NULL,
  `total_popular_post_footer` int(10) NOT NULL,
  `total_recent_post_sidebar` int(11) NOT NULL,
  `total_popular_post_sidebar` int(11) NOT NULL,
  `total_featured_product_home` int(11) NOT NULL,
  `total_latest_product_home` int(11) NOT NULL,
  `total_popular_product_home` int(11) NOT NULL,
  `meta_title_home` text NOT NULL,
  `meta_keyword_home` text NOT NULL,
  `meta_description_home` text NOT NULL,
  `banner_login` varchar(255) NOT NULL,
  `banner_registration` varchar(255) NOT NULL,
  `banner_forget_password` varchar(255) NOT NULL,
  `banner_reset_password` varchar(255) NOT NULL,
  `banner_search` varchar(255) NOT NULL,
  `banner_cart` varchar(255) NOT NULL,
  `banner_checkout` varchar(255) NOT NULL,
  `banner_product_category` varchar(255) NOT NULL,
  `banner_blog` varchar(255) NOT NULL,
  `cta_title` varchar(255) NOT NULL,
  `cta_content` text NOT NULL,
  `cta_read_more_text` varchar(255) NOT NULL,
  `cta_read_more_url` varchar(255) NOT NULL,
  `cta_photo` varchar(255) NOT NULL,
  `featured_product_title` varchar(255) NOT NULL,
  `featured_product_subtitle` varchar(255) NOT NULL,
  `latest_product_title` varchar(255) NOT NULL,
  `latest_product_subtitle` varchar(255) NOT NULL,
  `popular_product_title` varchar(255) NOT NULL,
  `popular_product_subtitle` varchar(255) NOT NULL,
  `testimonial_title` varchar(255) NOT NULL,
  `testimonial_subtitle` varchar(255) NOT NULL,
  `testimonial_photo` varchar(255) NOT NULL,
  `blog_title` varchar(255) NOT NULL,
  `blog_subtitle` varchar(255) NOT NULL,
  `newsletter_text` text NOT NULL,
  `paypal_email` varchar(255) NOT NULL,
  `stripe_public_key` varchar(255) NOT NULL,
  `stripe_secret_key` varchar(255) NOT NULL,
  `bank_detail` text NOT NULL,
  `before_head` text NOT NULL,
  `after_body` text NOT NULL,
  `before_body` text NOT NULL,
  `home_service_on_off` int(11) NOT NULL,
  `home_welcome_on_off` int(11) NOT NULL,
  `home_featured_product_on_off` int(11) NOT NULL,
  `home_latest_product_on_off` int(11) NOT NULL,
  `home_popular_product_on_off` int(11) NOT NULL,
  `home_testimonial_on_off` int(11) NOT NULL,
  `home_blog_on_off` int(11) NOT NULL,
  `newsletter_on_off` int(11) NOT NULL,
  `ads_above_welcome_on_off` int(1) NOT NULL,
  `ads_above_featured_product_on_off` int(1) NOT NULL,
  `ads_above_latest_product_on_off` int(1) NOT NULL,
  `ads_above_popular_product_on_off` int(1) NOT NULL,
  `ads_above_testimonial_on_off` int(1) NOT NULL,
  `ads_category_sidebar_on_off` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `logo`, `favicon`, `footer_about`, `footer_copyright`, `contact_address`, `contact_email`, `contact_phone`, `contact_fax`, `contact_map_iframe`, `receive_email`, `receive_email_subject`, `receive_email_thank_you_message`, `forget_password_message`, `total_recent_post_footer`, `total_popular_post_footer`, `total_recent_post_sidebar`, `total_popular_post_sidebar`, `total_featured_product_home`, `total_latest_product_home`, `total_popular_product_home`, `meta_title_home`, `meta_keyword_home`, `meta_description_home`, `banner_login`, `banner_registration`, `banner_forget_password`, `banner_reset_password`, `banner_search`, `banner_cart`, `banner_checkout`, `banner_product_category`, `banner_blog`, `cta_title`, `cta_content`, `cta_read_more_text`, `cta_read_more_url`, `cta_photo`, `featured_product_title`, `featured_product_subtitle`, `latest_product_title`, `latest_product_subtitle`, `popular_product_title`, `popular_product_subtitle`, `testimonial_title`, `testimonial_subtitle`, `testimonial_photo`, `blog_title`, `blog_subtitle`, `newsletter_text`, `paypal_email`, `stripe_public_key`, `stripe_secret_key`, `bank_detail`, `before_head`, `after_body`, `before_body`, `home_service_on_off`, `home_welcome_on_off`, `home_featured_product_on_off`, `home_latest_product_on_off`, `home_popular_product_on_off`, `home_testimonial_on_off`, `home_blog_on_off`, `newsletter_on_off`, `ads_above_welcome_on_off`, `ads_above_featured_product_on_off`, `ads_above_latest_product_on_off`, `ads_above_popular_product_on_off`, `ads_above_testimonial_on_off`, `ads_category_sidebar_on_off`) VALUES
(1, 'logo.jpeg', 'favicon.jpeg', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an.Â Ea suas pertinax has.</p>\r\n', 'All Rights Reserved © 2024', ' Kathmandu 44600\r\n\r\n Ason Bazar', 'ratnagentswear@gmail.com', '9840170458', '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d355.35432273490807!2d85.31076948780021!3d27.709390195532674!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb18fe60f6a4bb%3A0x81b2e43beda50498!2sRatna%20Gents%20Wear%20Collection!5e0!3m2!1sen!2snp!4v1714281236615!5m2!1sen!2snp\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'ratnagentswear@gmail.com', 'Visitor Email Message from Ecommerce Site PHP', 'Thank you for sending email. We will contact you shortly.', 'A confirmation link is sent to your email address. You will get the password reset information in there.', 4, 4, 5, 5, 10, 15, 15, 'Ecommerce PHP', 'online fashion store, garments shop, online garments', 'ecommerce php project with mysql database', 'banner_login.jpg', 'banner_registration.jpg', 'banner_forget_password.jpg', 'banner_reset_password.jpg', 'banner_search.jpg', 'banner_cart.jpg', 'banner_checkout.jpg', 'banner_product_category.jpg', 'banner_blog.jpg', 'Welcome To Our Ecommerce Website', 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, \r\nat usu eius eligendi singulis. Sea ocurreret principes ne. At nonumy aperiri pri, nam quodsi copiosae intellegebat et, ex deserunt euripidis usu. ', 'Read More', '#', 'cta.jpg', 'Featured Products', 'Our list on Top Featured Products', 'Latest Products', 'Our list of recently added products', 'Popular Products', 'Popular products based on customer\'s choice', 'Testimonials', 'See what our clients tell about us', 'testimonial.jpg', 'Latest Blog', 'See all our latest articles and news from below', 'Sign-up to our newsletter for latest promotions and discounts.', 'admin@ecom.com', 'pk_test_0SwMWadgu8DwmEcPdUPRsZ7b', 'sk_test_TFcsLJ7xxUtpALbDo1L5c1PN', 'Bank Name: Citizen Bank\r\nAccount Number: CA100270589600\r\nBranch Name: CA Branch\r\nCountry:Nepal', '', '<div id=\"fb-root\"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = \"//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10&appId=323620764400430\";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, \'script\', \'facebook-jssdk\'));</script>', '<!--Start of Tawk.to Script-->\r\n<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5ae370d7227d3d7edc24cb96/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>\r\n<!--End of Tawk.to Script-->', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_size`
--

CREATE TABLE `tbl_size` (
  `size_id` int(11) NOT NULL,
  `size_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_size`
--

INSERT INTO `tbl_size` (`size_id`, `size_name`) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'XXL'),
(7, '3XL'),
(8, '31'),
(9, '32'),
(10, '33'),
(11, '34'),
(12, '35'),
(13, '36'),
(14, '37'),
(15, '38'),
(16, '39'),
(17, '40'),
(18, '41'),
(19, '42'),
(20, '43'),
(21, '44'),
(22, '45'),
(23, '46'),
(24, '47'),
(25, '48'),
(26, 'Free Size'),
(27, 'One Size for All'),
(28, '10'),
(29, '12 Months'),
(30, '2T'),
(31, '3T'),
(32, '4T'),
(33, '5T'),
(34, '6 Years'),
(35, '7 Years'),
(36, '8 Years'),
(37, '10 Years'),
(38, '12 Years'),
(39, '14 Years'),
(40, '256 GB'),
(41, '128 GB'),
(42, '14 Plus'),
(43, '16 Plus'),
(44, '18 Plus'),
(45, '20 Plus'),
(46, '22 Plus'),
(47, '24 Plus');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `button_text` varchar(255) NOT NULL,
  `button_url` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`id`, `photo`, `heading`, `content`, `button_text`, `button_url`, `position`) VALUES
(1, 'slider-1.jpg', 'Express Yourself Through Fashion', 'Shop Online for Latest Men Collections', 'View Men Collections', '', 'Center'),
(3, 'slider-3.jpg', '24 Hours Customer Support', 'Super value deals on all products.', 'Read More', '#', 'Right');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social`
--

CREATE TABLE `tbl_social` (
  `social_id` int(11) NOT NULL,
  `social_name` varchar(30) NOT NULL,
  `social_url` varchar(255) NOT NULL,
  `social_icon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_social`
--

INSERT INTO `tbl_social` (`social_id`, `social_name`, `social_url`, `social_icon`) VALUES
(1, 'Facebook', '', 'fa fa-facebook'),
(6, 'YouTube', '', 'fa fa-youtube'),
(7, 'Instagram', '', 'fa fa-instagram'),
(12, 'WhatsApp', '', 'fa fa-whatsapp');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscriber`
--

CREATE TABLE `tbl_subscriber` (
  `subs_id` int(11) NOT NULL,
  `subs_email` varchar(255) NOT NULL,
  `subs_date` varchar(100) NOT NULL,
  `subs_date_time` varchar(100) NOT NULL,
  `subs_hash` varchar(255) NOT NULL,
  `subs_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_subscriber`
--

INSERT INTO `tbl_subscriber` (`subs_id`, `subs_email`, `subs_date`, `subs_date_time`, `subs_hash`, `subs_active`) VALUES
(22, 'sushant@gmail.com', '2024-06-14', '2024-06-14 19:46:57', '2ae4b66aae2f4977214aa4e0ad73324b74c80bc7', 0),
(23, 'sadikshya@gmail.com', '2024-06-14', '2024-06-14 19:47:07', '7bba28c0e22967ef1147e80954797bae63c77a82', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_top_category`
--

CREATE TABLE `tbl_top_category` (
  `tcat_id` int(11) NOT NULL,
  `tcat_name` varchar(255) NOT NULL,
  `show_on_menu` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_top_category`
--

INSERT INTO `tbl_top_category` (`tcat_id`, `tcat_name`, `show_on_menu`) VALUES
(1, 'Men', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `full_name`, `email`, `phone`, `password`, `photo`, `role`, `status`) VALUES
(1, 'Admin1', 'admin@gmail.com', '9877777777', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user-1.jpg', 'Super Admin', 'Active'),
(2, 'Admin2', 'admin2@gmail.com', '9811111111', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'admin.png', 'Admin', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `tbl_customer_message`
--
ALTER TABLE `tbl_customer_message`
  ADD PRIMARY KEY (`customer_message_id`);

--
-- Indexes for table `tbl_delivery_cost`
--
ALTER TABLE `tbl_delivery_cost`
  ADD PRIMARY KEY (`shipping_cost_id`);

--
-- Indexes for table `tbl_delivery_cost_all`
--
ALTER TABLE `tbl_delivery_cost_all`
  ADD PRIMARY KEY (`sca_id`);

--
-- Indexes for table `tbl_end_category`
--
ALTER TABLE `tbl_end_category`
  ADD PRIMARY KEY (`ecat_id`);

--
-- Indexes for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `tbl_language`
--
ALTER TABLE `tbl_language`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `tbl_mid_category`
--
ALTER TABLE `tbl_mid_category`
  ADD PRIMARY KEY (`mcat_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_photo`
--
ALTER TABLE `tbl_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `tbl_product_color`
--
ALTER TABLE `tbl_product_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_photo`
--
ALTER TABLE `tbl_product_photo`
  ADD PRIMARY KEY (`pp_id`);

--
-- Indexes for table `tbl_product_size`
--
ALTER TABLE `tbl_product_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_size`
--
ALTER TABLE `tbl_size`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social`
--
ALTER TABLE `tbl_social`
  ADD PRIMARY KEY (`social_id`);

--
-- Indexes for table `tbl_subscriber`
--
ALTER TABLE `tbl_subscriber`
  ADD PRIMARY KEY (`subs_id`);

--
-- Indexes for table `tbl_top_category`
--
ALTER TABLE `tbl_top_category`
  ADD PRIMARY KEY (`tcat_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_color`
--
ALTER TABLE `tbl_color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_customer_message`
--
ALTER TABLE `tbl_customer_message`
  MODIFY `customer_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_delivery_cost`
--
ALTER TABLE `tbl_delivery_cost`
  MODIFY `shipping_cost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_delivery_cost_all`
--
ALTER TABLE `tbl_delivery_cost_all`
  MODIFY `sca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_end_category`
--
ALTER TABLE `tbl_end_category`
  MODIFY `ecat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_language`
--
ALTER TABLE `tbl_language`
  MODIFY `lang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `tbl_mid_category`
--
ALTER TABLE `tbl_mid_category`
  MODIFY `mcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `tbl_photo`
--
ALTER TABLE `tbl_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `tbl_product_color`
--
ALTER TABLE `tbl_product_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=667;

--
-- AUTO_INCREMENT for table `tbl_product_photo`
--
ALTER TABLE `tbl_product_photo`
  MODIFY `pp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `tbl_product_size`
--
ALTER TABLE `tbl_product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1235;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_size`
--
ALTER TABLE `tbl_size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_social`
--
ALTER TABLE `tbl_social`
  MODIFY `social_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_subscriber`
--
ALTER TABLE `tbl_subscriber`
  MODIFY `subs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_top_category`
--
ALTER TABLE `tbl_top_category`
  MODIFY `tcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
