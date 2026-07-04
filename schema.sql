create database TaskDB;
use TaskDB;

-- **
-- NOTE: Index definitions for performance optimization are included at the end of this file.
-- **

create table `user`(
userId int auto_increment primary key,
`name` varchar(200),
phone varchar(100),
email varchar(100),
address text,
is_admin boolean default FALSE,
password_hash varchar(255)
);

create table `session` (
sessionId int auto_increment primary key,
user_id int,
start_at DATETIME DEFAULT CURRENT_TIMESTAMP,
expire_at DATETIME,
FOREIGN KEY (user_id) REFERENCES `user`(userId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

create table cart(
cartId int auto_increment primary key,
user_id int,
 FOREIGN KEY (user_id) REFERENCES `user`(userId) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

create table `order` (
orderId int auto_increment primary key,
user_id INT,
promo_code varchar(200),
order_status varchar(100),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES `user`(userId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

create table product(
productId int auto_increment primary key,
`name` varchar(255),
price decimal(10,5),
stock_qty int,
category varchar(100)
);

create table orderItem(
orderItemId INT AUTO_INCREMENT PRIMARY KEY,
quantity int,
price decimal(10, 5),
order_id int,
product_id int,
FOREIGN KEY (order_id) REFERENCES `order`(orderId)
    ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (product_id) REFERENCES product(productId)
    ON DELETE CASCADE ON UPDATE CASCADE
);

create table prodCart(
product_id int,
cart_id int,
PRIMARY KEY (cart_id, product_id),
FOREIGN KEY (cart_id) REFERENCES cart (cartId)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (product_id) REFERENCES product(productId)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Add index on product.name
CREATE INDEX idx_product_name ON product(name);

-- Add index on order.created_at
CREATE INDEX idx_order_created_at ON `order`(created_at);


