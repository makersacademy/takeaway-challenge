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


Classes
-----
*Dish*

Dishes should be initialized with a name and a price. These can be returned via `attr_reader`s and altered via `attr_writers`s.

```
[1] pry(main)> require './lib/dish.rb'

=> true
[2] pry(main)> pad_thai = Dish.new 'Pad Thai', 7

=> #<Dish:0x007f93a134cf60
 @name="Pad Thai",
 @price=7>
[3] pry(main)> pad_thai.name
=> "Pad Thai"
[4] pry(main)> pad_thai.price
=> 7
[5] pry(main)> pad_thai.name = 'Hoisin Crispy Owl'

=> "Hoisin Crispy Owl"
[6] pry(main)> pad_thai.name=> "Hoisin Crispy Owl"
[7] pry(main)> pad_thai.price = 10

=> 10
[8] pry(main)> pad_thai.price=> 10
```