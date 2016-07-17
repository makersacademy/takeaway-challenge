[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

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

 The Task
 -----

 Write a Takeaway program that reads out a menu, takes and checks orders. When a customer wants to confirm their order, they need to enter the current payment amount and they'll be sent a text confirmation using Twilio.

 You can see the full brief and user stories [here](https://github.com/JAstbury/takeaway-challenge).

 How to Use
 -----

 1. Clone the repo to your local machine
 2. Run ‘bundle install'
 3. Run IRB or Pry
 4. Require './lib/takeaway'

 Create a new takeaway:
 ```ruby
 perfect_pizza = Takeaway.new
 ```
 See what's for eatin':
 ```ruby
 perfect_pizza.read_menu
 ```
 Order from the menu (dish & quantity):
 ```ruby
 perfect_pizza("10 Hot Wings", 2)
 ```
 Check your order:
 ```ruby
 perfect_pizza.check_order
 ```
 Check your order total:
 ```ruby
 perfect_pizza.total
 ```
 Confirm your order and input payment amount:
 ```ruby
 perfect_pizza.checkout(8)
 ```

 My Approach
 -----
 I first started creating the program with just two classes: Takeaway and Menu. Having a separate menu class means that a new menu could be swapped in easily. Having built up more of the program, I then extracted some functionality from restaurant into a new Basket class. This means that the Restaurant class is only concerned with interacting with the user e.g. printing out the menu, accepting an order and passing it to the Basket class.

 The text confirmation is up and running but seems to be sending more than one text at the moment so this is something that I still need to solve!
