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

- created a menu class. It is responsible for creating the menu. On initialization it is given the attribute @dishes which is equal to an array hashes. Each hash represents a dish, with a key/value pair of name/price. The menu class is also responsible for showing the menu via the view_menu method. It outputs a readable list showing each dish name and it's price.


Example feature tests
-----

User story 1:

Create a new menu and view it:
```
require './lib/menu'
menu = Menu.new
menu.view_menu
```

Test coverage
-----

ADD IN TEST COVERAGE AS A % HERE