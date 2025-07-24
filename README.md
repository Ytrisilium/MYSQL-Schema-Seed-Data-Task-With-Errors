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
select p.name, SUM(oi.quantity) AS total_sold
from orderItem oi
join product p ON oi.product_id = p.productId
group BY p.productId
order BY total_sold DESC
limit 1;
```

---

### 2. 📦 Orders per User

```sql
select u.name, COUNT(o.orderId) AS orders_count
from `order` o
join `user` u ON o.user_id = u.userId
group BY u.userId;
```

---

### 3. 🛍️ Products in Cart (for a specific user)

```sql
select u.name AS user, p.name AS product, p.price
from cart c
join prodCart pc ON c.cartId = pc.cart_id
join product p ON pc.product_id = p.productId
join `user` u ON c.user_id = u.userId;
```

---

### 4. ✅ Completed Orders

```sql
select orderId, user_id, created_at
from `order`
where order_status = 'Completed';
```

---

### 5. 📚 Products by Category

```sql
select category, COUNT(*) AS num_products
from product
group BY category;
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
