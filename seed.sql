-- NOTE: show ANALYZE output in comments**
-- =========================================
-- ANALYZE OUTPUT 
-- =========================================
 EXPLAIN SELECT * FROM product WHERE name = 'Laptop';
-- Output: Uses index idx_product_name to avoid full table scan
 EXPLAIN SELECT * FROM `order` WHERE created_at > '2024-01-01';
-- Output: Uses index idx_order_created_at for range filtering
-- =========================================

-- Here we start the seeding of the tables **

-- 1. Add 2 sample Users (1 admin, 1 shopper)
INSERT INTO `user` (name, phone, email, address, is_admin, password_hash)
VALUES
('Admin User', '01012345678', 'admin@example.com', 'Admin Street, Cairo', TRUE, 'admin_hashed_pw'),
('Shopper User', '01087654321', 'shopper@example.com', 'Shopper Avenue, Giza', FALSE, 'shopper_hashed_pw');

-- 2. Add 5 Products in 2 categories

INSERT INTO product (name, price, stock_qty, category)
VALUES
('Product A', 100.00, 10, 'Category 1'),
('Product B', 150.00, 15, 'Category 1'),
('Product C', 200.00, 5, 'Category 2'),
('Product D', 250.00, 20, 'Category 2'),
('Product E', 300.00, 8, 'Category 2');

-- 3. Add 1 Cart for the shopper (userId = 2)

INSERT INTO cart (user_id)
VALUES (2);  -- cartId = 1

-- 3.1 Add products to the Cart (Saved Snapshot)
-- Let's say we add Product A (id=1) and Product C (id=3) to the cart
INSERT INTO prodCart (cart_id, product_id)
VALUES
(1, 1),
(1, 3);

-- 4. Create 1 Completed Order for the shopper
INSERT INTO `order` (user_id, promo_code, order_status, created_at)
VALUES
(2, 'PROMO10', 'completed', NOW()); -- orderId = 1

-- 4.1 Add 2 OrderItems to this order
-- Let's use Product A and Product C again
INSERT INTO orderItem (quantity, price, order_id, product_id)
VALUES
(1, 100.00, 1, 1),
(2, 200.00, 1, 3);
