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
```


Classes
-----
**Dish**

Dishes should be initialized with a name. These can be returned via `#name` and `#price` and altered via `#name=` and `#price=`

```
[1] pry(main)> pad_thai = Dish.new 'Pad Thai', 7

=> #<Dish:0x007f93a134cf60
 @name="Pad Thai",
 @price=7>
[2] pry(main)> pad_thai.name
=> "Pad Thai"
[3] pry(main)> pad_thai.price
=> 7
[4] pry(main)> pad_thai.name = 'Hoisin Crispy Owl'

=> "Hoisin Crispy Owl"
[5] pry(main)> pad_thai.name=> "Hoisin Crispy Owl"
[6] pry(main)> pad_thai.price = 10

=> 10
[7] pry(main)> pad_thai.price=> 10
```

**Menu**

Menus can be initialized with any class which can respond to a `#name` and `#price` method. If nothing is passed, then Dish class will be used be default.
Dishes can be added to the menu via the `#add` method.
Dishes can be removed from the menu via the `#remove` method.
`#view` returns a hash of names and prices of the dishes on the menu.

```
[1] pry(main)> menu = Menu.new=> #<Menu:0x007ffe321b91e8
 @dish_class=Dish,
 @dishes=[],
[2] pry(main)> menu.add pad_thai
=> [#<Dish:0x007ffe319c4e10
  @name="Pad Thai",
  @price=7>]
[3] pry(main)> menu.view
=> {"PAD THAI"=>7}
[4] pry(main)> menu.remove pad_thai

=> []
[5] pry(main)> menu.view
RuntimeError: Menu is empty
from /Users/michaelharrison/Projects/makers_academy/takeaway-challenge/lib/menu.rb:14:in `view'
```