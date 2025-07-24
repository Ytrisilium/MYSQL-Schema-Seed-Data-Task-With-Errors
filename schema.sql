create database TaskDB;
use TaskDB;

-- **
-- NOTE: Index definitions for performance optimization are included at the end of this file.
-- **

create table `user`(
userId int auto_increment primary key,
`name` varchar(200) not null,
phone varchar(100) not null,
email varchar(100) unique not null,
address text not null,
is_admin boolean default FALSE,
password_hash varchar(255) not null
);

create table `session` (
sessionId int auto_increment primary key,
user_id int not null,
start_at DATETIME DEFAULT CURRENT_TIMESTAMP,
expire_at DATETIME,
FOREIGN KEY (user_id) REFERENCES `user`(userId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

create table cart(
cartId int auto_increment primary key,
user_id int not null,
 FOREIGN KEY (user_id) REFERENCES `user`(userId) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

create table `order` (
orderId int auto_increment primary key,
user_id INT NOT NULL,
promo_code varchar(200),
order_status varchar(100) not null,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES `user`(userId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

create table product(
productId int auto_increment primary key,
`name` varchar(255) not null ,
price decimal(10,5) not null,
stock_qty int not null,
category varchar(100) not null
);

create table orderItem(
orderItemId INT AUTO_INCREMENT PRIMARY KEY,
quantity int not null,
price decimal(10, 5) not null,
order_id int not null,
product_id int not null,
FOREIGN KEY (order_id) REFERENCES `order`(orderId)
    ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (product_id) REFERENCES product(productId)
    ON DELETE CASCADE ON UPDATE CASCADE
);

create table prodCart(
product_id int not null,
cart_id int not null,
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


