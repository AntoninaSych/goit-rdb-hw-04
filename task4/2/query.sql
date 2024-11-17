-- Пояснення:
-- Різниця у duration (часі виконання) запитів між INNER JOIN, LEFT JOIN та RIGHT JOIN може бути викликана наступними причинами:
--
-- 1. Розмір таблиць та кількість даних
-- INNER JOIN:
--
-- Повертає лише рядки, де є збіги між таблицями.
-- Зазвичай обробляє менше даних, оскільки виключає рядки без збігів.
-- Виконується швидше, тому що менша кількість рядків бере участь у розрахунках.
-- LEFT JOIN та RIGHT JOIN:
--
-- Повертають усі рядки з лівої (для LEFT JOIN) або правої (для RIGHT JOIN) таблиці, навіть якщо збігів немає.
-- Обробляють більше даних, особливо якщо одна таблиця значно більша за іншу.
-- У нашому випадку, таблиця order_details (ліва таблиця) значно більша за таблицю orders.
-- При використанні RIGHT JOIN база даних змушена перевіряти кожен рядок у правій таблиці (orders),
--          що збільшує час виконання.


SELECT COUNT(*) AS total_rows_with_left_join
FROM order_details od
         LEFT JOIN orders o ON od.order_id = o.id
         LEFT JOIN customers c ON o.customer_id = c.id
         LEFT JOIN employees e ON o.employee_id = e.employee_id
         LEFT JOIN shippers sh ON o.shipper_id = sh.id
         LEFT JOIN products p ON od.product_id = p.id
         LEFT JOIN categories cat ON p.category_id = cat.id
         LEFT JOIN suppliers s ON p.supplier_id = s.id;

SELECT COUNT(*) AS total_rows_with_right_join
FROM order_details od
         RIGHT JOIN orders o ON od.order_id = o.id
         RIGHT JOIN customers c ON o.customer_id = c.id
         RIGHT JOIN employees e ON o.employee_id = e.employee_id
         RIGHT JOIN shippers sh ON o.shipper_id = sh.id
         RIGHT JOIN products p ON od.product_id = p.id
         RIGHT JOIN categories cat ON p.category_id = cat.id
         RIGHT JOIN suppliers s ON p.supplier_id = s.id;orders
