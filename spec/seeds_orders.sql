DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    id SERIAL PRIMARY KEY, 
    name text, 
    date date,
    price real,
    items int
    );
    
-- CREATE TABLE items (
--   id SERIAL PRIMARY KEY,
--   content text,
--   post_id int,
--   constraint fk_posts foreign key(post_id)
--     references posts(id)
--     on delete cascade
-- );

TRUNCATE TABLE orders RESTART IDENTITY; 

INSERT INTO orders (name, date, price, items) VALUES ('Order 1', '1000/10/10',15.00, 10),('Order 2', '2000/10/20', 30.00, 20);
