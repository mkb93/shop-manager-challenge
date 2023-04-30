# user stories
As a shop manager
So I can know which items I have in stock
I want to keep a list of my shop items with their name and unit price.

As a shop manager
So I can know which items I have in stock
I want to know which quantity (a number) I have for each item.

As a shop manager
So I can manage items
I want to be able to create a new item.

As a shop manager
So I can know which orders were made
I want to keep a list of orders with their customer name.

As a shop manager
So I can know which orders were made
I want to assign each order to their corresponding item.

As a shop manager
So I can know which orders were made
I want to know on which date an order was placed. 

As a shop manager
So I can manage orders
I want to be able to create a new order.

# nouns
shop_items, item_name, unit_price, item_amount, orders, customer_name, order_date, 
# repository and classes
item, item_repository, inventory, inventory_repository
# methods
all item
find item
create item
delete item
update item
all order
find order
create order
delete order
update order
# tables and columns
item table
id | name | price | amount
order table
id | customer_name | order_date | item