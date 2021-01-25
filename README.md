Takeaway Challenge
==================
 
### Setup and Usage

From the command line run the following:
```
1. git clone git@github.com:otisvg/takeaway-challenge.git
```
```
cd takeaway-challenge
```
```
bundle
```
```
irb
```

require './lib/Restaurant.rb'
require './lib/Order.rb'
require './lib/Menu.rb'

restaurant = Restaurant.new
order = Order.new
menu = Menu.new

View menu: restaurant.view_menu
Add food(s) and quantity to order: restaurant.place_order("hamburger", 2), restaurant.place_order("chicken nuggets", 1)
Pay (with exact amount) for order: restaurant.confirm_order(6.97)

Voila! Order complete.
```

### To run tests

```
rspec
```

### User Stories

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
