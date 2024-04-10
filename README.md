## Скриншоты
[png](https://github.com/MaximStroev2004/lovebd/assets/120455884/6cc0a079-5fa5-4d45-a243-385795efc39b)

##  5 типовых запросов к БД

1.Получить список всех брендов обуви:
```Mysql
SELECT * FROM brands;
```
2. Получить сумму всех заказов за определенный период времени  с 2024-01-01 по 2024-03-31:
```Mysql
SELECT SUM(total_amount) 
AS total_sales 
FROM orders 
WHERE order_date 
BETWEEN '2024-01-01' 
AND '2024-03-31';
```

3.Получить список наиболее популярных моделей обуви:
```Mysql
SELECT shoe_name, SUM(quantity) AS total_quantity_sold 
FROM shoes 
JOIN orders_details ON shoes.id = orders_details.shoe_id 
GROUP BY shoe_name 
ORDER BY total_quantity_sold DESC 
LIMIT 3;
```

4. Получить список всех заказов, сделанных клиентом по имени:
```Mysql
SELECT * FROM orders
WHERE customers_id = (SELECT id FROM customers WHERE customer_name = 'Иван Иванов');
```

5.Получить среднюю сумму заказа:
```Mysql
SELECT AVG(total_amount) AS avg_order_amount
FROM orders;
```

