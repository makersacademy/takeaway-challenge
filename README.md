## User Stories

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

## Domain Modelling

The Takeaway app is split up into various classes that understand the behaviour of various methods. The classes encapsulate these behaviours. 

The Takeaway app is based on my favorite takeaway option - Hawaiian Poké Bowls!

The takeaway class understands the behaviour of the view_menu, add_item and view_order methods.

- Class ----> takeaway
- Method (behaviour) ----> view_menu, add_item and view_order 

The order class understands the behavious of the add_to_order, order_summary and basket_total methods.

- Class ----> order
- Method (behaviour) ----> add_to_order, order_summary and basket_total

The menu class understands the behaviour of the menu method.

- Class ----> menu
- Method (behaviour) ----> menu

## How to run

```
irb
require './takeaway.rb'
=> true
irb(main):002:0> takeaway = Takeaway.new
=> #<Takeaway:0x00007fdeb4883f98 @menu=#<Menu:0x00007fdeb4883f70>, @order=#<Order:0x00007fdeb4883f48 @basket={}, @basket_total=0, @menu=#<Menu:0x00007fdeb4883ef
irb(main):003:0> takeaway.view_menu
=> {"Salmon Poke Bowl"=>8, "Tuna Poke Bowl"=>8, "Tofu Poke Bowl"=>8, "Chicken Poke Bowl"=>8, "Blue Hawaii Cocktail"=>7, "Mai Tai Cocktail"=>7, "Hawaiian Margarita Cocktail"=>7, "Mango Martini Cocktail"=>7}
irb(main):004:0> takeaway.add_item("Tuna Poke Bowl", 3)
=> 3
irb(main):004:0> takeaway.view_order
Tuna Poke Bowl x 3: £24
=> 24
```
