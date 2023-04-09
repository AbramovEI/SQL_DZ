use Myfirstdata;
CREATE TABLE sales
(
   Id INT AUTO_INCREMENT PRIMARY KEY,
   order_data DATE NOT NULL,
   count_product INT DEFAULT 0
);

SELECT * FROM sales;

INSERT INTO sales (order_data, count_product)
VALUES 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

SELECT Id,
CASE
    WHEN count_product < 100
        THEN 'маленький заказ'
	WHEN count_product > 300
        THEN 'большой заказ'
	WHEN count_product > 100 AND count_product < 300
        THEN 'Средний заказ'
END AS 'тип заказа'
FROM sales;



CREATE TABLE orders
(
   Id INT AUTO_INCREMENT PRIMARY KEY,
   employee_id INT,
   amount DECIMAL(5,2),
   order_status VARCHAR(30),
   FOREIGN KEY (employee_id) REFERENCES sales (Id)
);

INSERT INTO orders (amount, order_status)
VALUES 
(15.00, 'OPEN'),
(25.50, 'OPEN'),
(100.70,'CLOSED'),
(22.18,'OPEN'),
(9.50, 'CANCELLED');


SELECT * FROM orders;


SELECT Id, employee_id, amount, order_status,
CASE
    WHEN  order_status =  'OPEN'
        THEN 'Order is in open state'
	WHEN order_status =  'CLOSED'
        THEN 'Order is closed'
	WHEN order_status = 'CANCELLED'
        THEN 'Order is cancelled'
END AS 'full_order_status'
FROM orders;







	















  