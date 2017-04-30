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

This repository contains a software which manages takeaway orders from a restaurant.

## My approach

In my TDD I opted creating an Order and a TextNotifier class. I have also decided that the instance variables of the Order class shall not be readable, however the user can check their order via the method 'summary'. Please see further down for instructions on how to use the program. 

## Project status
This project covers the user stories from User Story 1 to 4 - please check the file 'user_stories.txt' for more info.

## Installation

`git clone https://github.com/enonnai/takeaway-challenge.git`

Ruby installation page: https://www.ruby-lang.org/en/documentation/installation/

`gem install rspec`

`bundle install`


*************** WELCOME TO CRISTINA'S TAKEAWAY SERVICE ***************
## Getting started

To run my program, cd in the project folder name and type in the following commands:
`irb`
`require ./lib/order.rb`

## Let's order!

Create a new order:
`order = Order.new`

See dishes with prices:
`order.see_dishes`

Add a dish by passing a string as an argument:
`order.add_dish('dish_name')` - returns the price of the dish just added

Add more dishes:
`order.add_dish('dish_name')` - adds on dish price

Remove a dish:
`order.remove_dish('dish_name')` - returns your total spent minus the removed dish

See order summary:
`order.summary`

Check out the order:
`order.check_out` - sends an SMS with 1 hour estimated delivery time or returns an error if minimum amount spent is less than 20.


## Running tests

Run unit tests from the project folder path via `rspec`

---
BUON APPETITO!
