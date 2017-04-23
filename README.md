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

This repository contains a software which manages takeaway orders from an Italian restaurant.

## My approach

In my TDD I opted on initialising a few instance variables as empty arrays for new objects of the Order class (my_dishes, total, delivery_fee and my_order respectively). None of them are attribute readers as I do not want my customers to be able to manipulate the data.

## Project status
This project covers the user stories from User Story 1 to be determined.

## Getting started

`git clone https://github.com/enonnai/takeaway-challenge.git`

Ruby installation page: https://www.ruby-lang.org/en/documentation/installation/

`gem install rspec`

`bundle install`

## How to run the program

*************** WELCOME TO CRISTINA'S TAKEAWAY SERVICE ***************

To run my program, cd in the project folder name and type in the following commands:
`irb`
`require ./lib/order.rb`

Fist of all, let's create an order:
`order = Order.new`
See my dishes:
`order.see_dishes`
Add a dish by passing its name as an argument (it has to be a string):
`order.add_dish('dish_name')`
Add more dishes!
`order.add_dish('dish_name')`
Remove a dish:
`order.remove_dish('dish_name')`
See your order summary
`order.summary`

## Running tests

Run unit tests from the project folder path via `rspec`

---
BUON APPETITO!
