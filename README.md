Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

[![Build Status](https://travis-ci.org/harrim91/takeaway-challenge.svg?branch=master)](https://travis-ci.org/harrim91/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/harrim91/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/harrim91/takeaway-challenge?branch=master)

Task
-----

Makers Academy Week 2 Weekend Challenge

* Write a Takeaway program with the following user stories:

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

Installation
-----
* Clone this repo
* Install `bundle` gem - `gem install bundle`
* Run `bundle` from the root directory
* In IRB/PRY, require the following files:
```
[1] pry(main)> require './lib/dish.rb'
=> true

[2] pry(main)> require './lib/menu.rb'
=> true

[3] pry(main)> require './lib/restaurant.rb'
=> true

[4] pry(main)> require './lib/order.rb'
=> true
```


Classes
-----

**Dish**

Responsible for holding information about dishes.
Dishes should be initialized with a name. These can be returned via `#name`.

```
[5] pry(main)> pad_thai = Dish.new "Pad Thai"
=> #<Dish:0x007fd881b25e10 @name="Pad Thai">

[6] pry(main)> pad_thai.name
=> "Pad Thai"
```

**Menu**

Responsible for associating dishes with prices.
Dishes and prices can be added to the menu via the `#add` method.
Dishes can be removed from the menu via the `#remove` method.
`#view` returns a hash of dishes and prices on the menu.

```
[7] pry(main)> menu = Menu.new
=> #<Menu:0x007fd8828db2f8 @dish_class=Dish,@menu={}>

[8] pry(main)> menu.add pad_thai, 7
=> 7

[9] pry(main)> menu.view
=> {"PAD THAI"=>7}

[10] pry(main)> menu.remove pad_thai
=> 7

[11] pry(main)> menu.view
RuntimeError: Menu is empty
from /Users/michaelharrison/Projects/makers_academy/takeaway-challenge/lib/menu.rb:13:in `view'
```

**Restaurant**

Responsible for displaying the menu to customers.
Needs to be initialized with an instance of `Menu`.
The menu can be viewed using `#view_menu`.
Items can be added to an order via `#order`.
A summary of the items ordered and the total price can be accessed via `#order_summary`.

```
[12] pry(main)> restaurant = Restaurant.new menu
=> #<Restaurant:0x007f9daac806f0 @menu=#<Menu:0x007f9da997f6f0 @dish_class=Dish, @menu={"PAD THAI"=>7}>, @order=#<Order:0x007f9daac806c8 @menu=#<Menu:0x007f9da997f6f0 @dish_class=Dish, @menu={"PAD THAI"=>7}>, @order={:total=>0}>, @order_class=Order>

[13] pry(main)> restaurant.view_menu
=> {"PAD THAI"=>7}

[14] pry(main)> restaurant.order pad_thai, 3
=> 21

[15] pry(main)> restaurant.order_summary
=> {:total=>21, "PAD THAI"=>3}
```

**Order**

Responsible for keeping track of quantities of each dish ordered and calculating the total.
Needs to be initialized with an instance of `Menu`.
A quantity of a `Dish` can be added to an order via `#add`.
A list of each `Dish` and the quantity in the order, along with the total price is returned via `#summary`.
Should not be used directly, instead, use `Restaurant`.
```
[16] pry(main)> order = Order.new menu
=> #<Order:0x007f9daa8aba48 @menu=#<Menu:0x007f9da997f6f0 @dish_class=Dish, @menu={"PAD THAI"=>7}>, @order={:total=>0}>

[17] pry(main)> order.add pad_thai, 3
=> 21

[18] pry(main)> order.summary
=> {:total=>21, "PAD THAI"=>3}
```
