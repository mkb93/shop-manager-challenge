CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY, 
    name text, 
    price real,
    amount int
    );
    
CREATE TABLE IF NOT EXISTS orders (
  id SERIAL PRIMARY KEY,
  name text,
  date date
);

CREATE TABLE  IF NOT EXISTS orders_items (
  item_id int,
  order_id int,
  constraint fk_items foreign key(item_id) references items(id) on delete cascade,
  constraint fk_orders foreign key(order_id) references orders(id) on delete cascade
);

TRUNCATE TABLE items, orders, orders_items RESTART IDENTITY; 

INSERT INTO items (name, price, amount) VALUES ('Item 1', 10.00, 10),('Item 2', 20.00, 20);
INSERT INTO orders (name, date) VALUES ('Order 1', '1000/10/10'),('Order 2', '2000/10/20');
INSERT INTO orders_items (item_id, order_id) VALUES (1, 1),(1, 2),(1,1),(2,1),(2,2),(2,1);


