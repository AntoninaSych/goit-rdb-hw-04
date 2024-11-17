-- task3
USE mydb;
SELECT
    od.id AS order_detail_id,
    o.id AS order_id,
    o.date AS order_date,
    c.name AS customer_name,
    p.name AS product_name,
    cat.name AS category_name,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    sh.name AS shipper_name,
    s.name AS supplier_name
FROM order_details od
         INNER JOIN orders o ON od.order_id = o.id
         INNER JOIN customers c ON o.customer_id = c.id
         INNER JOIN employees e ON o.employee_id = e.employee_id
         INNER JOIN shippers sh ON o.shipper_id = sh.id
         INNER JOIN products p ON od.product_id = p.id
         INNER JOIN categories cat ON p.category_id = cat.id
         INNER JOIN suppliers s ON p.supplier_id = s.id;
