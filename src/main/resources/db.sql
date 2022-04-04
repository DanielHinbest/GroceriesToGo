CREATE DATABASE IF NOT EXISTS GroceriesToGo;
USE GroceriesToGo;

DROP TABLE IF EXISTS User;
CREATE TABLE User (
	id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(32) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(12) NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    dateOfBirth DATE,-- NOT NULL,
    addressLine1 VARCHAR(255) NOT NULL,
    addressLine2 VARCHAR(255),
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    postalCode VARCHAR(7) NOT NULL,
    PRIMARY KEY (id)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS Store;
CREATE TABLE Store (
	store_id INTEGER NOT NULL AUTO_INCREMENT,
    store_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(12) NOT NULL,
    address_line_1 VARCHAR(255) NOT NULL,
    address_line_2 VARCHAR(255),
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    postal_code VARCHAR(7) NOT NULL,
    store_location VARCHAR(255) NOT NULL,
    store_map_html TEXT NOT NULL,
    store_website VARCHAR(255),
    enabled BOOLEAN DEFAULT true,
    PRIMARY KEY (store_id)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	department_id INTEGER NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (department_id)
);

DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
	product_id INTEGER NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    product_brand VARCHAR(30),
    product_stock INTEGER NOT NULL,
    product_cost DECIMAL(5, 2) NOT NULL,
    product_image VARCHAR(255) NOT NULL,
    department_id INTEGER NOT NULL,
    store_id INTEGER,
    PRIMARY KEY (product_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (store_id) REFERENCES Store(store_id) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS CartItem;
CREATE TABLE CartItem (
	cart_item_id INTEGER NOT NULL AUTO_INCREMENT,
    product_id INTEGER,
    user_id INTEGER,
    store_id INTEGER,
    PRIMARY KEY (cart_item_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (store_id) REFERENCES Store(store_id) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=1;
    
DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
	order_id INTEGER NOT NULL AUTO_INCREMENT,
    order_cost DECIMAL (6, 2) NOT NULL,
    number_of_items INTEGER NOT NULL,
    order_date DATE NOT NULL,
    user_id INTEGER,
    product_id INTEGER,
    PRIMARY KEY (order_id),
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS Role;
CREATE TABLE role (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO Role VALUES (1, 'ROLE_USER');

DROP TABLE IF EXISTS User_Role;
CREATE TABLE user_role (
  user_id INTEGER NOT NULL,
  role_id INTEGER NOT NULL,
  PRIMARY KEY (user_id, role_id),
  KEY fk_user_role_roleid_idx (role_id),
  CONSTRAINT fk_user_role_roleid FOREIGN KEY (role_id) REFERENCES role (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_user_role_userid FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE ON UPDATE CASCADE
);