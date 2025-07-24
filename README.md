# MYSQL-Schema-Seed-Data-Task

## 📌 Description
This project is a sample SQL schema for an e-commerce system built for training purposes. It includes users, products, carts, and orders with proper constraints and indexing for performance.

---

## 🔌 How to Connect

1. Make sure you have MySQL installed and running.
2. Open your MySQL terminal or client (e.g., MySQL Workbench).
3. Run the following in order:

```
source schema.sql;
source seed.sql;
```

This will create the database schema and insert sample test data.

---

## 📋 Sample SELECT Queries

### 1. 🛒 Top-Selling Product (based on total quantity ordered)

```sql
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM orderItem oi
JOIN product p ON oi.product_id = p.productId
GROUP BY p.productId
ORDER BY total_sold DESC
LIMIT 1;
```

---

### 2. 📦 Orders per User

```sql
SELECT u.name, COUNT(o.orderId) AS orders_count
FROM `order` o
JOIN `user` u ON o.user_id = u.userId
GROUP BY u.userId;
```

---

### 3. 🛍️ Products in Cart (for a specific user)

```sql
SELECT u.name AS user, p.name AS product, p.price
FROM cart c
JOIN prodCart pc ON c.cartId = pc.cart_id
JOIN product p ON pc.product_id = p.productId
JOIN `user` u ON c.user_id = u.userId;
```

---

### 4. ✅ Completed Orders

```sql
SELECT orderId, user_id, created_at
FROM `order`
WHERE order_status = 'Completed';
```

---

### 5. 📚 Products by Category

```sql
SELECT category, COUNT(*) AS num_products
FROM product
GROUP BY category;
```

---

## ✅ Notes

- Passwords are stored securely using a `password_hash` column.
- Performance indexes are created on `product.name` and `order.created_at`.
- Sample data includes:
  - 2 users (1 admin, 1 shopper)
  - 5 products across 2 categories
  - 1 cart snapshot
  - 1 completed order with 2 items

---
