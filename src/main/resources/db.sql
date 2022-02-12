CREATE DATABASE IF NOT EXISTS groceriestogo;
USE groceriestogo;

--
-- Table structure for table `role`
--
DROP TABLE IF EXISTS role;
CREATE TABLE role (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--
LOCK TABLES role WRITE;
INSERT INTO role VALUES (1, 'ROLE_USER');
UNLOCK TABLES;

--
-- Table structure for table `user`
--
DROP TABLE IF EXISTS user;
CREATE TABLE user (
	id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(32) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    dateOfBirth DATETIME,-- NOT NULL,
    addressLine1 VARCHAR(255) NOT NULL,
    addressLine2 VARCHAR(255),
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    postalCode VARCHAR(7) NOT NULL,
    reset_password_token VARCHAR(30),
    PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS user_role;
CREATE TABLE user_role (
  user_id INTEGER NOT NULL,
  role_id INTEGER NOT NULL,
  PRIMARY KEY (user_id, role_id),
  KEY fk_user_role_roleid_idx (role_id),
  CONSTRAINT fk_user_role_roleid FOREIGN KEY (role_id) REFERENCES role (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_user_role_userid FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;