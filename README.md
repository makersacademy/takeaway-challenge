Takeaway Challenge
==================


Installation
-------
```
$ git clone https://github.com/LGretzk/takeaway-challenge.git

$ cd takeaway-challenge

$ bundle
```

Instructions
-----

* Use IRB to require the order.rb file

* Create a new instance of Order to order food.

* Use show_dishes method to see the menu.

* Use add_dish(id, quantity) to order dish.

* Use remove_dish(id) to remove dish from your order.

* Use update_dish_quantity(id, quantity) to update the quantity of your chosen dish.

* Use show_current_order to preview your order.

* Use total to get the total amount you would need to pay for your order.

* Use place_order(Confirmation.new) to place your order.


User stories
-----

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
