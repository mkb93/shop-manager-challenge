DROP TABLE IF EXISTS items;
CREATE TABLE items (
    id SERIAL PRIMARY KEY, 
    name text, 
    price real,
    amount int
    );
    
-- CREATE TABLE items (
--   id SERIAL PRIMARY KEY,
--   content text,
--   post_id int,
--   constraint fk_posts foreign key(post_id)
--     references posts(id)
--     on delete cascade
-- );

TRUNCATE TABLE items RESTART IDENTITY; 

INSERT INTO items (name, price, amount) VALUES ('Item 1', 10.00, 10),('Item 2', 20.00, 20);
