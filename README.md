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

Dishes should be initialized with a name. These can be returned via `#name`.

```
[3] pry(main)> pad_thai = Dish.new "Pad Thai"

=> #<Dish:0x007fd881b25e10
 @name="Pad Thai">
[4] pry(main)> pad_thai.name
=> "Pad Thai"
```

**Menu**

Dishes and prices can be added to the menu via the `#add` method.
Dishes can be removed from the menu via the `#remove` method.
`#view` returns a hash of dishes and prices on the menu.

```
[5] pry(main)> menu = Menu.new
=> #<Menu:0x007fd8828db2f8
 @dish_class=Dish,
 @menu={}>
[6] pry(main)> menu.add pad_thai, 7

=> 7
[7] pry(main)> menu.view
=> {"PAD THAI"=>7}
[8] pry(main)> menu.remove pad_thai

=> 7
[9] pry(main)> menu.view
RuntimeError: Menu is empty
from /Users/michaelharrison/Projects/makers_academy/takeaway-challenge/lib/menu.rb:13:in `view'
```
