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

Introduction
-------
This is the second weekend assignment from Makers academy.

Task
-----

* The task is to write a Takeaway program with the following user stories:

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

Instructions
------------
- Fork this repo
- Run the command 'bundle' in the project directory to ensure you have all the gems
- Create a trial [Twilio](https://www.twilio.com) user account and set up SMS functionality.
- Due to user credentials being needed in this program these have not been uploaded. To add yours you must add this file: `./lib/secrets.rb` . It should take the following format:
```
module Secrets
  
  ACCOUNT_SID = 'Twilio Account SID'
  AUTH_TOKEN = 'Twilio Auth Token'
  FROM = '#Twilio  phone number'
  TO = '#Twilio registerd phone number'

end

```
- Once set up the program can be run like this example (found in `./bin/example.rb`):
```
require_relative '../lib/menu.rb'
require_relative '../lib/order.rb'

menu = Menu.new
order = Order.new(menu)

menu.add('pizza',9.99)
menu.add('fish & chips', 12.00)
menu.add('curry', 12.99)
menu.add('sushi', 16.00)

puts "---- The Menu ----"
puts menu.print

order.add('pizza', 1)
order.add('fish & chips',3)
order.add('sushi',2)
order.add('curry', 5)

puts "----Order Summary ----"
puts order.summary

puts "----Total Price ----"
puts order.total_price

order.place_order(142.94)
```

Challenges
----------
- Overcomplicating the challenge. It would have been much simpler to have the assumption of one restaurant, one menu and fixed dishes. Instead I wanted to challenge myself by trying to make it as extensible as possible and forming classes of these items.
- Did not have 100% test coverage. Currently it is >98% but the `restaurant` module has no tests. I was unsure how to test this module and the API call.
- It would have been good to have the same `printers` to be used by `menu` and `order`
but their data structures are different.
- Would be good to take to completion and refactor `restaurant` to a class. 

Summary
-------
On the whole I am very happy with my work on this challenge. I think it shows great improvements on structure and design compared with week 1. There is good unit and feature test coverage and have used and external service. Logic is broken down well and a method doesn't have more than 2 lines.
