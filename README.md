Takeaway Challenge
==================

User Stories
-----

```
User story 1:
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

User story 2:
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

User story 3:
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

User story 4:
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

My approach
-----

User story 1:

- created a dish class that is responsible for creating dish objects. On initialisation it takes the arguments name and price which are set as instance variables for each dish object.
- created a menu class. It is responsible for creating the menu. On initialization it is given the attribute menu_list which is equal to an array of new dish objects. Each dish object is given a name and price attribute. The menu class is also responsible for showing the menu via the read_menu method. It outputs a readable list showing each dishes name and associated price.


Example feature tests
-----

User story 1:

Create a new dish:

```
require './lib/dish'
dish1 = Dish.new("Chips", 2)
dish2 = Dish.new("Onion rings", 1)
```

Create a new menu:
```
require './lib/menu'
menu = Menu.new
```

Test coverage
-----

ADD IN TEST COVERAGE AS A % HERE