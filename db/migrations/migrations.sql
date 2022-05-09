CREATE DATABASE menu;

-- to create dishes table in menu database

CREATE TABLE dishes (
  id SERIAL PRIMARY KEY,
  dishname VARCHAR(60),
  dishdescr VARCHAR(280),
  dishprice NUMERIC (6,2)
);

-- to insert values

insert into dishes (dishname, dishdescr, dishprice) VALUES ('Pizza - Margherita', 'cheese and tomato pizza', '7.99');
insert into dishes (dishname, dishdescr, dishprice) VALUES ('Pizza - Four Cheese', 'lots of cheese', '8.99');
insert into dishes (dishname, dishdescr, dishprice) VALUES ('Pizza - Pepperoni', 'spicy!', '8.99');
insert into dishes (dishname, dishdescr, dishprice) VALUES ('Pizza - Fiorentina', 'spinach and egg', '8.50');
insert into dishes (dishname, dishdescr, dishprice) VALUES ('Garlic bread', 'mmm yummy garlic', '3.50');
insert into dishes (dishname, dishdescr, dishprice) VALUES ('Cheesy garlic bread', 'gooey cheese', '3.50');
insert into dishes (dishname, dishdescr, dishprice) VALUES ('Raspberry cheesecake', 'best dessert ever', '4.50');
