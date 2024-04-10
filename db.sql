-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Nike'),(2,'Adidas'),(3,'Reebok'),(4,'Puma'),(5,'New Balance');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(20) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Иван Иванов','ivan@mail.ru','+79205134225'),(2,'Петр Петров','petr@mail.ru','+79205134229'),(3,'Мария Сидорова','maria@mail.ru','+79205134252'),(4,'Елена Николаева','elena@mail.ru','+79205134421'),(5,'Алексей Козлов','alex@mail.ru','+79205134520');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `customers_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_customers1_idx` (`customers_id`),
  CONSTRAINT `fk_orders_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-03-21 00:00:00',199.98,1),(2,'2024-03-21 00:00:00',89.99,2),(3,'2024-03-21 00:00:00',239.97,3),(4,'2024-03-21 00:00:00',139.98,4),(5,'2024-03-21 00:00:00',59.99,5),(6,'2024-04-04 11:38:09',599.94,1),(7,'2024-04-09 13:24:57',1099.89,1),(8,'2024-04-10 14:50:29',1099.89,1),(9,'2024-04-10 14:55:57',199.98,1),(10,'2024-04-10 14:56:24',299.97,1),(11,'2024-04-10 14:56:45',299.97,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shoe_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `orders_id` int NOT NULL,
  PRIMARY KEY (`id`,`shoe_id`),
  KEY `fk_orders_details_orders1_idx` (`orders_id`),
  CONSTRAINT `fk_orders_details_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_details`
--

LOCK TABLES `orders_details` WRITE;
/*!40000 ALTER TABLE `orders_details` DISABLE KEYS */;
INSERT INTO `orders_details` VALUES (1,1,2,1),(2,2,1,2),(3,3,3,3),(4,4,2,4),(5,5,1,5),(6,1,6,6),(7,1,11,7),(8,1,11,8),(9,1,2,9),(10,1,3,10),(11,1,3,11);
/*!40000 ALTER TABLE `orders_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_total_amount_after_update` AFTER UPDATE ON `orders_details` FOR EACH ROW BEGIN
    DECLARE total DECIMAL(10, 2);

    -- Вычисляем новую общую сумму для соответствующего заказа
    SELECT SUM(s.price * od.quantity)
    INTO total
    FROM orders_details od
    JOIN shoes s ON od.shoe_id = s.id
    WHERE od.orders_id = NEW.orders_id;

    -- Обновляем общую сумму заказа в таблице orders
    UPDATE orders
    SET total_amount = total
    WHERE id = NEW.orders_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `sales_performance`
--

DROP TABLE IF EXISTS `sales_performance`;
/*!50001 DROP VIEW IF EXISTS `sales_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_performance` AS SELECT 
 1 AS `order_details_id`,
 1 AS `customer_name`,
 1 AS `customer_email`,
 1 AS `customer_phone`,
 1 AS `shoe_name`,
 1 AS `brand_name`,
 1 AS `quantity`,
 1 AS `order_date`,
 1 AS `total_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shoes`
--

DROP TABLE IF EXISTS `shoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brands_id` int NOT NULL,
  `shoe_name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `orders_details_id` int NOT NULL,
  `orders_details_shoe_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ shoes_brands_idx` (`brands_id`),
  KEY `fk_ shoes_orders_details1_idx` (`orders_details_id`,`orders_details_shoe_id`),
  CONSTRAINT `fk_ shoes_brands` FOREIGN KEY (`brands_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `fk_ shoes_orders_details1` FOREIGN KEY (`orders_details_id`, `orders_details_shoe_id`) REFERENCES `orders_details` (`id`, `shoe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoes`
--

LOCK TABLES `shoes` WRITE;
/*!40000 ALTER TABLE `shoes` DISABLE KEYS */;
INSERT INTO `shoes` VALUES (1,1,'Air Force 1',99.99,1,1),(2,2,'Superstar',89.99,2,2),(3,3,'Classic Leather',79.99,3,3),(4,4,'Suede Classic',69.99,4,4),(5,5,'574',59.99,5,5);
/*!40000 ALTER TABLE `shoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shop'
--

--
-- Dumping routines for database 'shop'
--
/*!50003 DROP FUNCTION IF EXISTS `total_order_cost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_order_cost`(customer_id INT) RETURNS decimal(10,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE total_cost DECIMAL(10,2);
    
    SELECT SUM(total_amount) as g1 INTO total_cost
    FROM orders
    WHERE customers_id = customer_id;
    
    RETURN total_cost;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_customer`(
    IN p_customer_name VARCHAR(20),
    IN p_customer_email VARCHAR(255),
    IN p_customer_phone VARCHAR(20)
)
BEGIN
    DECLARE duplicate_key CONDITION FOR SQLSTATE '23000';
    DECLARE exit_handler BOOLEAN DEFAULT FALSE;
    DECLARE customer_exists INT;
    DECLARE EXIT HANDLER FOR NOT FOUND SET exit_handler = TRUE;
    
    START TRANSACTION;
    
    SELECT 1 INTO customer_exists FROM customers
    WHERE customer_name = p_customer_name OR customer_email = p_customer_email
    LIMIT 1;

    IF NOT exit_handler THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ошибка: Клиент уже существует.';
    ELSE
        INSERT INTO customers (customer_name, customer_email, customer_phone)
        VALUES (p_customer_name, p_customer_email, p_customer_phone);
        SELECT 'Клиент успешный.' AS Message;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `purchase_shoes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purchase_shoes`(
    IN customer_id INT,
    IN shoe_id INT,
    IN quantity INT
)
BEGIN
    DECLARE order_id INT;

    START TRANSACTION;
    
    IF customer_id IS NULL THEN
        INSERT INTO `customers` VALUES (NULL, NULL, NULL, NULL);
        SET customer_id = LAST_INSERT_ID();
    END IF;

    INSERT INTO `orders` (`order_date`, `total_amount`, `customers_id`)
    VALUES (NOW(), (SELECT price * quantity FROM `shoes` WHERE `id` = shoe_id), customer_id);

    SET order_id = LAST_INSERT_ID();

    INSERT INTO `orders_details` (`shoe_id`, `quantity`, `orders_id`)
    VALUES (shoe_id, quantity, order_id);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_variables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_variables`()
BEGIN
  
    DECLARE var1 INT;
    DECLARE var2 VARCHAR(255);
    DECLARE var3 DECIMAL(10, 2);
    

    SET var1 = 10;
    SET var2 = 'Some text';
    SET var3 = 99.99;
    
  
    SELECT var1, var2, var3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `sales_performance`
--

/*!50001 DROP VIEW IF EXISTS `sales_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_performance` AS select `od`.`id` AS `order_details_id`,`c`.`customer_name` AS `customer_name`,`c`.`customer_email` AS `customer_email`,`c`.`customer_phone` AS `customer_phone`,`s`.`shoe_name` AS `shoe_name`,`b`.`brand_name` AS `brand_name`,`od`.`quantity` AS `quantity`,`o`.`order_date` AS `order_date`,`o`.`total_amount` AS `total_amount` from ((((`orders_details` `od` join `orders` `o` on((`od`.`orders_id` = `o`.`id`))) join `customers` `c` on((`o`.`customers_id` = `c`.`id`))) join `shoes` `s` on((`od`.`shoe_id` = `s`.`id`))) join `brands` `b` on((`s`.`brands_id` = `b`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-10 17:57:56
