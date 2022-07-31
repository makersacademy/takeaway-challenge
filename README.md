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

User story 2:
- created an order class. It is responsible for creating a basket, adding dishes to the basket and displaying the basket. On initialization it is given the attribute @basket which is an empty array. Adding a dishes adds the dishes to @basket. Displaying the basket shows the dishes in the basket and their prices.

User story 3:
- added responsibility for calculating and displaying the cost of the basket to the order class. The total cost method shows the sum of the price for each dish in the basket.

User story 4:
- I ran out of time


Example feature tests
-----

User story 1:

Create a new menu and view it:
```
require './lib/menu'
menu = Menu.new
menu.view_menu
```

User story 2:

Add dishes to order:
```
require './lib/order.rb'
order = Order.new
order.add_dish("Chips", 3)
order.add_dish("Cheese burger", 2)
order.display_basket
```

User story 3:

```
require './lib/order.rb'
order = Order.new
order.add_dish("Chips", 3)
order.add_dish("Cheese burger", 2)
order.total_cost
```


Test coverage
-----

100%


Reference
-----
I referred to another student's challenge - https://github.com/RPGrimes/takeaway-challenge


Time spent on challenge
-----
Sunday 9am to 8:30pm


Reflections and mistakes along the way
-----

- I spent a lot of time creating a Dish class and using that to try and populate a menu - this wasn't necessary for the challenge. I could have gone straight to creating a Menu in the Menu class since the Menu didn't need to change over time for the challenge. Better planning up front would have helped with this.
- I don't have a good understanding on accessing variables and using them across different classes. I need more practice! For example, creating a Menu in the Menu class, I needed to refer to another student's code to work out how I could access the Menu in the order class (in the end it was creating a new instance of Menu and making it an attribute of Order)
- Understand what tests to write before you know what code you need to meet the requirements of the challenge is hard. Again I need more and more practice of this!