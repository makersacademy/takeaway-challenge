[![Build Status](https://travis-ci.org/ccfz/takeaway-challenge.svg?branch=master)](https://travis-ci.org/ccfz/takeaway-challenge)

# Take-away Challenge


## Approach

1. I will start with a very simple menu class, which contains a hash 'dishes' that contains the dish and their price. 
* The second user story requires the ability to create an order with dishes. I will therefore change my original approach. I will now add a dish class and inject it into menu. Menu can create new dishes, which are stored in an hash. The key is the name of the dish and the value is the dish_instance. A dish consists of its name and price. #see_dishes will return all dish's with their #name and #price. 

2. As the job of the menu is only to display dishes I will create a order class to create a new order and save the dishes. As a order class could contain many menues I will inject the menu_instnace into the order class. Therefore the menu is created outside of the order class.

3. 

## How take away works

1. 
