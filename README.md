Takeaway Challenge
==================
[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

This is a simple program that accepts a user's orders to a Restaurant and notifies them via SMS of successful placement of the order using the Twilio API.

> Welcome to Kaiser Chefs, how can we help? Our menu is inspired by Dishoom, today's special is the Chicken Ruby.

Approach
----------
My first step was to draw a simple diagram, outlining classes, state, behavior and information flow based on the user stories. This provided the basis for creating a Restaurant class and an Order class using TDD, where the former would handle user interaction with a pre-defined list of dishes and create instances of the latter.

I proceeded to extract some of the Restaurant class's functionality into an OrderDispatch interactor class, responsible for creating new orders and confirming they were placed. Particular attention was placed on encapsulation and limiting the amount of information being passed between the objects: for example, menu information belongs to the Restaurant class and it is therefore here that we handle business logic to ensure that new orders are correct and calculate the total price.

Having decided to first attempt the challenge without the guidance of the review rubric, the program behaves somewhat different from the prescribed method. New order instances are automatically created via a Restaurant's order dispatcher when calling Restaurant#place_order and passing in comma-separated strings with the quantity and name for each dish. This was done to eventually accommodate the possibility of placing an order via text. If the order is successfully placed, the user will receive confirmation via a text message with the total price and maximum estimated time of delivery, as well as being able to see an order summary alongside the total price.

NOTE: due to the design decision to automatically create order instances, there is no standalone functionality to check the price of an order against the menu items; this information is all provided upon placing an order.

```
[1] pry(main)> require ./lib/restaurant.rb
[2] pry(main)> kaiser_chefs = Restaurant.build_with_dispatch
=> #<Restaurant:0x007fc1d26179e8
 @dispatch=
  #<OrderDispatch:0x007fc1d2654898
   # omitted
[3] pry(main)> kaiser_chefs.view_menu
=> {:far_far=>2.5,
 :samosas=>4,
 :okra_fries=>4.2,
 :mattar_paneer=>6.5,
 :chicken_ruby=>8,
 :masala_prawns=>9,
 :biryani=>7.5,
 :naan=>2.5,
 :roti=>2.5,
 :basmati_rice=>2,
 :bhang_lassi=>3,
 :thums_up=>2.5,
 :kingfisher=>3.5,
 :chai=>2,
 :botal_water=>2}
[4] pry(main)> kaiser_chefs.place_order("6 corndogs")
RuntimeError: Sorry, we do not have Corndogs on our menu.
from /Users/Mic/dev/makers_academy/takeaway-challenge/lib/restaurant.rb:54:in `block in parse_dishes'
[5] pry(main)> kaiser_chefs.place_order("1 okra fries", "1 roti", "2 basmati rice", "1 chicken ruby", "1 biryani", "4 kingfisher", "1 botal water")
=> {:okra_fries=>1,
 :roti=>1,
 :basmati_rice=>2,
 :chicken_ruby=>1,
 :biryani=>1,
 :kingfisher=>4,
 :botal_water=>1,
 :total=>42.2}
```
This sent the following text message:
> Thank you! Your order for £42.2 will be delivered by 00:50

The program was tested using RSpec with >90% coverage (the convenience method for the OrderDispatch class could not be tested). Twilio user credentials are protected using the Dotenv gem.

Next steps
------------
* Refactor so that Restaurant#place_order takes a single string with CSVs (see bullet below)
* Allow customers to place orders via text message
* Load a menu from file (YAML) to create varied Restaurant objects
* Create Customer structs with attributes that can be used to access an order history from the OrderDispatch (via the Restaurant)
* Extract the business logic for parsing customer orders and calculating order totals
* Implement a basket/checkout system
* Write an RSpec feature test

Notes
-----
Rubocop detected no offenses. The following Hound CI violations have been ignored:
* "Style/CollectionMethods: Prefer `inject` over `reduce`." The Ruby Style Guide recommends the opposite.
* "Style/DotPosition: Place the `.` on the previous line, together with the method call receiver." Rubocop recommends the opposite.
